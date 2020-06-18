local Ruin = {}

--[[
/c remote.call("space-exploration", "build_ruin", {ruin_name = "satellite", surface_index = game.player.surface.index, position = game.player.position})

Add more ruins below, eg:
Ruin.ruins["my-ruin"] = require("ruins/my-ruin.lua")
test with
/c remote.call("space-exploration", "build_ruin", {ruin_name = "my-ruin", surface_index = game.player.surface.index, position = game.player.position})

Ruin forces:
"enemy" = turrets are hostile to player, cannot be mined, cannot be opened
"neutral" = can be mined
"capture" = can be captured by nearby player (not implemented yet, defaults to neutral)
]]--

Ruin.ruins = {}

Ruin.ruins["satellite"] = require("ruins/satellite.lua")


function Ruin.build(data)
  if not (data.ruin_name and data.surface_index and data.position) then return end
  local ruin_name = data.ruin_name
  local ruin = Ruin.ruins[ruin_name]
  if not ruin then return end

  local ruin_position = data.position
  ruin_position.x = math.floor(ruin_position.x)
  ruin_position.y = math.floor(ruin_position.y)

  local surface = game.surfaces[data.surface_index]

  surface.request_to_generate_chunks(ruin_position, 2)
  surface.force_generate_chunk_requests() -- must be generated to place

  if ruin.prebuild then
    ruin.prebuild(surface, ruin_position, ruin)
  end

  if ruin.tiles then
    local tiles = {}
    for tile_name, positions in pairs(ruin.tiles) do
      for _, position in pairs(positions) do
        table.insert(tiles, {name = tile_name,
        position = {
          x = ruin_position.x + position[1] - ruin.center.x,
          y = ruin_position.y + position[2] - ruin.center.y}})
      end
    end
    surface.set_tiles(tiles, true)
  end

  if ruin.under_tiles then
    for tile_name, positions in pairs(ruin.under_tiles) do
      for _, position in pairs(positions) do
        surface.set_hidden_tile({
          x = ruin_position.x + position[1] - ruin.center.x,
          y = ruin_position.y + position[2] - ruin.center.y}, tile_name)
      end
    end
  end

  for entity_name, set in pairs(ruin.entities) do
    for _, entity_data in pairs(set) do
      if type(entity_data.x) == "number" or type(entity_data[1]) then
        local entity_relative_position = {
          x = 0 + (entity_data.x or entity_data[1]),
          y = 0 + (entity_data.y or entity_data[2])
        }
        local entity_position = {
          x = ruin_position.x + entity_relative_position.x - ruin.center.x,
          y = ruin_position.y + entity_relative_position.y - ruin.center.y
        }
        local force_name = entity_data.force_name or "capture"
        if force_name == "capture" then force_name = "neutral" end
        local entity = surface.create_entity{
          name = entity_name,
          force = force_name,
          position = entity_position,
          direction = entity_data.direction,
          raise_built = true
        }
        if entity_data.stacks then
          for _, stack in pairs(entity_data.stacks) do
            entity.insert{name = stack.name, count = stack.count}
          end
        end
      end
    end
  end

  if ruin.wires then
    for wire_type, set in pairs(ruin.wires) do
      for _, wire_data in pairs(set) do
        local from = surface.find_entity(wire_data.from.name,
          {
            x = ruin_position.x + (wire_data.from.position.x or wire_data.from.position[1]) - ruin.center.x,
            y = ruin_position.y + (wire_data.from.position.y or wire_data.from.position[2]) - ruin.center.y
          }
        )
        local to = surface.find_entity(wire_data.to.name,
          {
            x = ruin_position.x + (wire_data.to.position.x or wire_data.to.position[1]) - ruin.center.x,
            y = ruin_position.y + (wire_data.to.position.y or wire_data.to.position[2]) - ruin.center.y
          }
        )
        if from and to then
          from.connect_neighbour({ -- https://lua-api.factorio.com/latest/LuaEntity.html#LuaEntity.connect_neighbour
            wire = wire_type,
            target_entity = to,
            source_circuit_id = wire_data.source_circuit_id,
            target_circuit_id  = wire_data.target_circuit_id
          })
        else
          game.print("can't find")
        end
      end
    end
  end

  if ruin.postbuild then
    ruin.postbuild(surface, ruin_position, ruin)
  end

end

return Ruin
