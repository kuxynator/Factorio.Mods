require("stdlib/table")
require("stdlib/string")

version = 0001130 -- 0.1.130
local mod_display_name = "Space Exploration"
is_debug_mode = false

Util = require("scripts/util") util = Util
mod_prefix = util.mod_prefix

Log = require('scripts/log')
Event = require('scripts/event')

Shared = require("shared")
Universe = require("scripts/universe")
RemoteView = require('scripts/remote-view')
Respawn = require('scripts/respawn')
Launchpad = require('scripts/launchpad')
Landingpad = require('scripts/landingpad')
Capsule = require('scripts/capsule')
Zone = require('scripts/zone')
Weapon = require('scripts/weapon')
Spaceship = require('scripts/spaceship')
Coreminer = require('scripts/core-miner')
CondenserTurbine = require('scripts/condenser-turbine')
Meteor = require('scripts/meteor')
Migrate = require('scripts/migrate')

Ruin = require('scripts/ruin')

satellite_blueprint = require("scripts/satellite")

sp_tile_plate = mod_prefix.."space-platform-plating"
sp_tile_scaffold = mod_prefix.."space-platform-scaffold"
name_space_tile = mod_prefix.."space"
name_out_of_map_tile = "out-of-map"
space_tiles = {
  name_space_tile
}
name_asteroid_tile = mod_prefix.."asteroid"
--air_tiles = {"air-1", "air-2", "air-3", "air-4"}

name_fluid_rocket_fuel = mod_prefix.."liquid-rocket-fuel"

name_thruster_suits = {
  mod_prefix.."thruster-suit",
  mod_prefix.."thruster-suit-2",
  mod_prefix.."thruster-suit-3",
  mod_prefix.."thruster-suit-4",
}
base_space_thrust = 1
thruster_suit_thrust = {
  [mod_prefix.."thruster-suit"] = 2,
  [mod_prefix.."thruster-suit-2"] = 3,
  [mod_prefix.."thruster-suit-3"] = 4,
  [mod_prefix.."thruster-suit-4"] = 5,
}

suffocation_interval = 120

collision_player = mod_prefix.."collision-player"
collision_player_not_space = mod_prefix.."collision-player-not-space"
collision_rocket_destination_surface = mod_prefix.."collision-rocket-destination-surface"
collision_rocket_destination_orbit = mod_prefix.."collision-rocket-destination-orbital"

function get_make_playerdata(player)
  global.playerdata = global.playerdata or {}
  global.playerdata[player.index] = global.playerdata[player.index] or {}
  return global.playerdata[player.index]
end

function player_set_dropdown_values(player, key, values)
   local playerdata = get_make_playerdata(player)
   playerdata.dropdown_values = playerdata.dropdown_values or {}
   playerdata.dropdown_values[key] = values
end

function player_get_dropdown_value(player, key, index)
   local playerdata = get_make_playerdata(player)
   if playerdata.dropdown_values and playerdata.dropdown_values[key] then
     return playerdata.dropdown_values[key][index]
   end
end

function player_clear_dropdown_values(player, key)
   local playerdata = get_make_playerdata(player)
   if playerdata.dropdown_values then playerdata.dropdown_values[key] = nil end
end

function player_clear_all_dropdown_values(player)
   local playerdata = get_make_playerdata(player)
   playerdata.dropdown_values = nil
end


-- creation must contain position
-- returns entity, position
function create_non_colliding(surface, creation, radius, precision)
    radius = radius or 32
    precision = precision or 1
    local try_pos = creation.position
    local safe_pos = surface.find_non_colliding_position(creation.name, try_pos, radius, 1)or try_pos
    creation.position = safe_pos
    return surface.create_entity(creation), safe_pos
end

-- returns entity, position
function teleport_non_colliding(entity, position, radius, precision)
  if entity then
    radius = radius or 32
    precision = precision or 1
    local try_pos = position
    local safe_pos = entity.surface.find_non_colliding_position(entity.name, try_pos, radius, 1) or try_pos
    entity.teleport(safe_pos)
    return entity, safe_pos
  end
end

function teleport_non_colliding_player(player, position, surface, radius, precision)
  surface = surface or player.surface
  radius = radius or 32
  precision = precision or 1
  local try_pos = position
  local safe_pos = surface.find_non_colliding_position(player.character.name, try_pos, radius, 1) or try_pos
  player.teleport(safe_pos, surface)
  return player, safe_pos
end

function teleport_character_to_surface(character, surface, position)
  local try_pos = position
  local safe_pos = surface.find_non_colliding_position(character.name, try_pos, 32, 1) or try_pos
  if surface == character.surface then
    -- easy
    character.teleport(safe_pos)
    return character, safe_pos
  end
  if (not done) and character.player then
    -- use the player to do it
    local player = character.player
    player.teleport(safe_pos, surface) -- surface change breaks character reference
    local playerdata = get_make_playerdata(player)
    playerdata.last_position = nil
    playerdata.set_postition = nil
    playerdata.velocity = nil
    return player.character, safe_pos
  end

  -- attach a player to do it
  for player_index, playerdata in pairs(global.playerdata) do
    local player = game.players[player_index]
    if player and player.connected then
      if RemoteView.is_active(player) and playerdata.character and playerdata.character == character then
        local player_pos = player.position
        local player_surface = player.surface
        player.teleport(playerdata.character.position, playerdata.character.surface)
        player.set_controller{type = defines.controllers.character, character = playerdata.character}
        player.teleport(safe_pos, surface) -- surface change breaks character reference
        playerdata.character = player.character
        player.set_controller{type = defines.controllers.ghost}
        --player.set_controller{type = defines.controllers.spectator}
        player.teleport(player_pos, player_surface)
        playerdata.last_position = nil
        playerdata.set_postition = nil
        playerdata.velocity = nil
        Log.trace("character moved by reassociation")
        return playerdata.character, safe_pos
      end
    end
  end

  -- clone the character and destroy the original
  -- what could possibly go wrong?
  surface.clone_entities{
    entities = {character},
    destination_offset = util.vectors_delta(character.position, safe_pos),
    destination_surface = surface,
    destination_force = character.force,
    snap_to_grid = false
  }
  local candidates = surface.find_entities_filtered{
    type = character.type,
    name = character.name,
    force = character.force
  }
  for _, candidate in pairs(candidates) do
    if candidate.player == nil
      and candidate.color.r == character.color.r
      and candidate.color.g == character.color.g
      and candidate.color.b == character.color.b then
        candidate.teleport(safe_pos)

        for player_index, playerdata in pairs(global.playerdata) do
          if playerdata.character and playerdata.character == character then
            playerdata.character = candidate
          end
        end
        character.destroy()
        Log.trace("character moved by cloning")
        return clone, safe_pos
    end
  end

  Log.trace("character move by cloning but failed")
  -- failed
  return nil, safe_pos
end

function surface_set_area_tiles(data)
  -- data.surface
  -- data.name (tile type)
  -- data.area
  if not (data.surface and data.name and data.area) then return end

  local tiles = {}
  for y = data.area.left_top.y, data.area.right_bottom.y, 1 do
    for x = data.area.left_top.x, data.area.right_bottom.x, 1 do
      table.insert(tiles, {
        name = data.name,
        position = {x = x, y = y}})
    end
  end
  data.surface.set_tiles(tiles, true)
end

function surface_set_space_tiles(data)
  -- data.surface
  -- data.area
  if not (data.surface and data.area) then return end

  local tiles = {}
  for y = data.area.left_top.y, data.area.right_bottom.y, 1 do
    for x = data.area.left_top.x, data.area.right_bottom.x, 1 do
      table.insert(tiles, {
        name = name_space_tile,
        position = {x = x, y = y}})
    end
  end
  data.surface.set_tiles(tiles, true)
end

function position_2d_array_add(array, position)
    if not array[position.y] then array[position.y] = {} end
    if not array[position.y][position.x] then array[position.y][position.x] = position end
end

function position_2d_array_add_range(array, position, range)
    for y = position.y - range, position.y + range, 1 do
      for x = position.x - range, position.x + range, 1 do
            position_2d_array_add(array, {x = x, y = y})
      end
    end
end

function tile_is_space(tile)
    for _, name in pairs(space_tiles) do
      if tile.name == name then return true end
    end
    return false
end

function tile_is_space_platform(tile)
    return tile.name == sp_tile_plate or tile.name == sp_tile_scaffold
end


function on_player_created(event)
    --local player = game.players[event.player_index]
    --TODO: capsule crash sequence
end

function close_own_guis(player)
  -- NOTE: don't close remote view gui here
  Launchpad.gui_close(player)
  Landingpad.gui_close(player)
  Capsule.gui_close(player)
  Spaceship.gui_close(player)
  --player_clear_all_dropdown_values(player)
end


--[[
  tag: {
    surface_name (optional)
    force_name
    position
    icon_type (item/virtual)
    icon_name
    text
    chart_range (optional)
  }
]]
function chart_tag_buffer_add(tag)
  local surface = tag.surface
  local force_name = tag.force_name
  local force = game.forces[force_name]
  local range = tag.chart_range or Zone.discovery_scan_radius

  force.chart(surface, util.position_to_area(tag.position, range))

  global.chart_tag_buffer = global.chart_tag_buffer or {}
  global.chart_tag_next_id = (global.chart_tag_next_id or 0) + 1
  global.chart_tag_buffer[global.chart_tag_next_id] = tag
end

function process_chart_tag_buffer()
  if global.chart_tag_buffer then
    local tags_remaining = 0
    for _, tag in pairs(global.chart_tag_buffer) do
      local surface = tag.surface
      local force_name = tag.force_name
      local force = game.forces[force_name]
      local chart_tag = force.add_chart_tag(surface, {
        icon = {type = tag.icon_type, name = tag.icon_name},
        position = tag.position,
        text = tag.text
      })
      if chart_tag then
        global.chart_tag_buffer[_] = nil
      else
        tags_remaining = tags_remaining + 1
      end
    end
    if tags_remaining == 0 then
      -- cleanup
      global.chart_tag_buffer = nil
      global.chart_tag_next_id = nil
    end
  end
end


function get_selected_index(array, current)
  local i = 0
  for _, item in ipairs(array) do
    i = i + 1
    if item == current then return i end
  end
end

function get_dropdown_string(element, relevant_value)
  if not relevant_value then relevant_value = 1 end
  if element.selected_index and element.items[element.selected_index] then
    local selected = element.items[element.selected_index]
    if type(selected) == "string" then
      return selected
    elseif type(selected) == "table" and selected[relevant_value] then
      return selected[relevant_value]
    end
  end
end

function selected_name_from_dropdown_preset(element, preset)
  -- options eg:  destination_type_options

  local selected_string = get_dropdown_string(element)
  for _, option in pairs(preset) do
    if type(option.display) == "string" then
      if option.display == selected_string then
        return option.name
      end
    elseif type(option.display) == "table" and option.display[1] == selected_string then
      return option.name
    end
  end
end

function dropdown_from_preset(preset, current)
  -- options eg:  destination_type_options
  local selected_index
  local list = {}
  for _, option in pairs(preset) do
    table.insert(list, option.display)
    if option.name == current then selected_index = #list end
  end
  return list, selected_index
end

function count_inventory_slots_used(inv)
  count = 0
  for i = 1, #inv do
    if inv[i] and inv[i].valid_for_read then count = count + 1 end
  end
  return count
end

function gui_element_or_parent(element, name)
  if not element then return end
  if element.name == name then
    return element
  elseif element.parent then
    return gui_element_or_parent(element.parent, name)
  end
end

function on_tick_player_gui(player)

  local playerdata = get_make_playerdata(player)

  if player.opened ~= playerdata.opened or player.opened_gui_type ~= playerdata.opened_gui_type then
    local event_data = {
      player = player,
      opened_new = player.opened,
      opened_old = playerdata.opened,
      opened_gui_type_new = player.opened_gui_type,
      opened_gui_type_old = playerdata.opened_gui_type
    }
    playerdata.opened = player.opened
    playerdata.opened_gui_type = player.opened_gui_type
    Event.trigger("on_player_opened_changed", event_data)
  end


  if player.selected ~= playerdata.selected then
    local event_data = {
      player = player,
      selected_new = player.selected,
      selected_old = playerdata.selected,
    }
    playerdata.selected = player.selected
    Event.trigger("on_player_selected_changed", event_data)
  end

end

function on_gui_click(event)
  if event.element and event.element.valid and event.element.name == "space-exploration-accept-experimental-warning" then
    game.players[event.player_index].gui.center["space-exploration-experimental-warning"].destroy()
    game.tick_paused = false
  end
end
Event.addListener(defines.events.on_gui_click, on_gui_click)

function on_tick_player(player)

  local playerdata = get_make_playerdata(player)

  on_tick_player_gui(player)

  if game.tick > 1 and (not playerdata.experimental_warning) and settings.global["se-skip-experimental-warning"].value ~= true then
    if #game.connected_players == 1 then
      game.tick_paused = true
    end
    local experimental = player.gui.center.add{ type="frame", name="space-exploration-experimental-warning", style="space_platform_container",
      direction = "vertical", caption="Space Exploration (Experimental)" }
    local string = "This is a very early experimental version of Space Exploration. \n\n"

    string = string .. "There are still features to add and balancing to do. It is advised to with play only the required mods and quality-of-life mods for the time being. \n\n"

    string = string .. "All Alien Biomes tiles are required, if you have disabled certain biomes please enable them before you explore other planets or moons. \n\n"

    string = string .. "Try to avoid adding/removing resource mods or changing mod configuration that adds/removes resources mid-game. Each planet, moon, orbit around them, and asteroid field has its own resource settings which are disrupted by adding/removing resources. \n\n"

    local text = experimental.add{type = "label", caption = string}


    text.style.width = 300
    text.style.single_line = false

    experimental.add{type = "button", name="space-exploration-accept-experimental-warning", style = "red_confirm_button",
      caption="I accept"}

    playerdata.experimental_warning = version
  end

  if player.character and player.surface.index ~= 1 then

      local is_space = false
      local zone = Zone.from_surface(player.surface)
      local spaceship = Spaceship.from_own_surface_index(player.surface.index)

      if zone then
        if Zone.is_space(zone) then
          is_space = true
        end
      else
        if spaceship then
          is_space = true
        end
      end
      if is_space then
        -- is in space
        playerdata.last_position = playerdata.position or player.position
        playerdata.set_postition = playerdata.set_postition or player.position
        playerdata.position = player.position
        playerdata.velocity = playerdata.velocity or {x = 0, y = 0}

        if game.tick % suffocation_interval == 0 then
          local armor_inv = player.get_inventory(defines.inventory.character_armor)
          playerdata.suit_thrust = base_space_thrust
          local suffocate = true
          if armor_inv and armor_inv[1] and armor_inv[1].valid_for_read then
            for suit_name, thrust in pairs(thruster_suit_thrust) do
              if suit_name == armor_inv[1].name then
                playerdata.suit_thrust = thrust
                suffocate = false
              end
            end
          end
          if suffocate and player.vehicle then
            suffocate = false
          end
          if suffocate and zone then
            local position = Util.position_to_tile(player.position)
            if Util.table_contains(Spaceship.names_spaceship_floors, player.surface.get_tile(position).name) then
              suffocate = false
            end
          end
          if suffocate and spaceship then
            if spaceship.known_tiles then
              local position = Util.position_to_tile(player.position)
              if spaceship.known_tiles[position.x] and spaceship.known_tiles[position.x][position.y]
                and (spaceship.known_tiles[position.x][position.y] == Spaceship.tile_status.floor_interior
                 or spaceship.known_tiles[position.x][position.y] == Spaceship.tile_status.floor_console_connected
                 or spaceship.known_tiles[position.x][position.y] == Spaceship.tile_status.bulkhead_console_disconnected) then
                  suffocate = false
              end
            end
          end
          if suffocate then
            playerdata.suffocating = (playerdata.suffocating or 0) + suffocation_interval
            if player.character.health < player.character.prototype.max_health * 0.9 then
              player.print({"space-exploration.suffocating-warning"}, {r = 1, g = 0, b = 0, a = 0})
            end
            player.character.damage(suffocation_interval * (math.pow(playerdata.suffocating / 60, 2) / 30000 + player.character.health / 2000), "neutral", "suffocation") -- amount, force, type
            if not player.character then -- died
              playerdata.suffocating = nil
            end
          else
            playerdata.suffocating = nil
          end
        end

        local tile = player.surface.get_tile(player.position.x, player.position.y)

        if tile_is_space(tile) then -- floating in space

          local extramove = util.vectors_delta(playerdata.set_postition, playerdata.position)
          local extramove_length = Util.vector_length(extramove)
          if extramove_length > 0 then
            if playerdata.velocity.x == 0 and playerdata.velocity.y == 0 then -- boost stepping off platform
              if extramove_length > 0.1 then
                extramove = Util.vector_set_length(extramove, 0.2)
              end
              playerdata.velocity = util.vectors_add(extramove, playerdata.velocity)
            else -- normal floating
              local thrust = playerdata.suit_thrust or base_space_thrust
              if extramove_length > 0.01 then
                extramove = Util.vector_set_length(extramove, 0.01)
              end
              playerdata.velocity = util.vectors_add(util.vector_multiply(extramove, 0.1 * thrust), playerdata.velocity)
            end
          end
          -- drag
          if util.vector_length(playerdata.velocity) > 0.15 then
            playerdata.velocity = util.vector_multiply(playerdata.velocity, 1 - util.vector_length(playerdata.velocity)/500)
          end
          if playerdata.zero_velocity then
            playerdata.zero_velocity = nil
            playerdata.velocity = {x = 0, y = 0}
          end

          if util.vector_length(extramove) > 0.005 and math.random() < 0.25 and tile.name ~= "air-1" then
            player.surface.create_trivial_smoke{name = "smoke", position = {player.position.x, player.position.y - 0.7} }
          end

          if spaceship and spaceship.speed > 0.1 then
            playerdata.velocity.y = playerdata.velocity.y +
            0.000005 * math.pow(spaceship.speed / Spaceship.speed_taper, Spaceship.partical_speed_power) * Spaceship.speed_taper
          end

          local drift_position = util.vectors_add(player.position, playerdata.velocity)
          player.teleport(drift_position)
          playerdata.set_postition = player.position

        else -- on space platform

          if playerdata.velocity and (playerdata.velocity.x ~= 0 or playerdata.velocity.y ~= 0) then
            -- player had momentum but now is static.
            -- might have flown into an object and is stuck
            local original_position = player.position;
            player.teleport({x = original_position.x - 5, y = original_position.y - 5})
            local safe_place = player.surface.find_non_colliding_position(collision_player, original_position, 5, 0.1)
            if safe_place then
              player.teleport(safe_place)
            else
              player.teleport(original_position)
            end
          end

          playerdata.velocity = {x = 0, y = 0}
          playerdata.set_postition = player.position

        end

      else -- not in space or air
        playerdata.velocity = nil
        playerdata.position = nil
        playerdata.last_position = nil
        playerdata.set_postition = nil
        playerdata.suffocating = false
      end
  else
      playerdata.velocity = nil
      playerdata.position = nil
      playerdata.last_position = nil
      playerdata.set_postition = nil
  end
  -- save position
  playerdata.surface_positions = playerdata.surface_positions or {}
  playerdata.surface_positions[player.surface.index] = player.position
end

function on_trigger_created_entity(event)
  if event.entity and event.entity.valid and event.entity.name == mod_prefix.."trigger-movable-debris" then
    -- meteor and rocket fragments

    local surface = event.entity.surface
    local deconstruct = false
    for force in pairs(game.forces) do
      local networks = surface.find_logistic_networks_by_construction_area(event.entity.position, force)
      if networks and #networks > 0 then
        for _, network in pairs(networks) do
          if network.storages and #network.storages > 1 then
            local entities = surface.find_entities_filtered{position = event.entity.position, type = "simple-entity"}
            for _, entity in pairs(entities) do
              entity.order_deconstruction(force)
              deconstruct = true
            end
          end
        end
      end
    end
    if not deconstruct then
      local tile = surface.get_tile(event.entity.position.x, event.entity.position.y)
      local meteors = surface.find_entities_filtered{ type = "simple-entity", area = Util.position_to_area(event.entity.position, 1) }
      for _, meteor in pairs(meteors) do
        if string.find(meteor.name, "meteor", 1, true) then
          if tile.collides_with("player-layer") then
            meteor.destroy()
          else
            --[[
            local size = math.random() < 0.5 and "crater2-medium" or "crater1-large"
            surface.create_decoratives{
              check_collision = true,
              decoratives={
                {
                  name=size,
                  position = event.entity.position,
                  amount = 1
                }
              }
            }
            ]]--
          end
        end
      end
    end
  end
end
Event.addListener(defines.events.on_trigger_created_entity, on_trigger_created_entity)

function cancel_entity_creation(entity, player_index, message)
  -- put an item back in the inventory or drop to ground
  -- display flying text
  local player
  if player_index then
    player = game.players[player_index]
  end
  local inserted = 0
  if player then
    inserted = player.insert{name = entity.prototype.items_to_place_this[1].name, count = 1}
  end
  if inserted == 0 and entity.prototype.items_to_place_this[1] and entity.prototype.items_to_place_this[1].name then
   entity.surface.create_entity{
      name = "item-on-ground",
      position = entity.position,
      ["item-entity"] = {name = entity.prototype.items_to_place_this[1].name, count = 1}
    }
  end
  entity.surface.create_entity{
     name = "flying-text",
     position = entity.position,
     text = message,
     render_player_index = player_index,
   }
  entity.destroy()
end

function cancel_tile_placement(surface, tile, old_tiles, player_index, message)
  -- put an item back in the inventory or drop to ground
  -- display flying text
  local player
  if player_index then
    player = game.players[player_index]
  end
  local set_tiles = {}
  for i, old_tile in pairs(old_tiles) do
    local inserted = 0
    if player then
      inserted = player.insert{name = tile.items_to_place_this[1].name, count = 1}
    end
    if inserted == 0 then
     surface.create_entity{
        name = "item-on-ground",
        position = old_tile.position,
        --["item-entity"] = {name = tile.items_to_place_this[1].name, count = 1}
        stack = {name = tile.items_to_place_this[1].name, count = 1}
      }
    end
    if i == 1 then
      surface.create_entity{
         name = "flying-text",
         position = old_tile.position,
         text = message,
         render_player_index = player_index,
       }
     end
     local hidden = surface.get_hidden_tile(old_tile.position)
    table.insert(set_tiles, {name = hidden or old_tile.old_tile.name, position = old_tile.position})
  end
  surface.set_tiles(set_tiles)

end

function on_entity_created(event)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if not entity then return end
  if entity.type == "car" and not string.find(entity.name, mod_prefix.."space", 1, true) then
    local zone = Zone.from_surface(entity.surface)
    if zone and Zone.is_space(zone) then
      cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-vehicle-in-space"})
    end
  end
end

function on_built_tile(event)
  if not event.surface_index then return end
  local surface = game.surfaces[event.surface_index]
  if not surface then return end
  local player
  local tile = event.tile
  local old_tiles = event.tiles
  local stack = event.stack -- used to create, may be empty
  if tile_is_space_platform(tile) then
    local zone = Zone.from_surface(surface)
    if (not zone) or not (
      zone.type == "orbit" or
      zone.type == "asteroid-belt" or
      zone.type == "asteroid-field" or
      zone.type == "anomaly") then
        -- should not be here
        cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied"})
    end
  end
end



function on_tick()

  process_chart_tag_buffer()

  for _, player in pairs(game.connected_players) do
    on_tick_player(player)
  end

  for _, tick_task in pairs(global.tick_tasks) do
    if tick_task.type == "chain-beam" then
      Weapon.chain_beam(tick_task)
    elseif tick_task.type == "plague-tick" then
      Weapon.plague_tick(tick_task)
    elseif tick_task.type == "bind-corpse" then
      Respawn.tick_task_bind_corpse(tick_task)
    elseif tick_task.type == "launchpad-journey" then
      Launchpad.tick_journey(tick_task)
    elseif tick_task.type == "force-message" then
      if tick_task.force_name then
        local force = game.forces[tick_task.force_name]
        if force then
          force.print(tick_task.message)
        end
      end
      tick_task.valid = false
    else
      tick_task.valid = false
    end
    if not tick_task.valid then
      global.tick_tasks[tick_task.id] = nil
    end
  end

end

function new_tick_task(type)
  global.next_tick_task_id = global.next_tick_task_id or 1
  local new_tick_task = {
    id = global.next_tick_task_id,
    valid = true,
    type = type
  }
  global.tick_tasks[new_tick_task.id] = new_tick_task
  global.next_tick_task_id = global.next_tick_task_id + 1
  return new_tick_task
end

function build_satellite(force_name)
  Log.debug_log("build_satellite: " .. force_name)
  local zone = Zone.from_name("Nauvis Orbit")
  local surface = Zone.get_make_surface(zone)
  local satellite_position = Zone.find_zone_landing_position(zone, {
    x = (-0.5+math.random()) * 256,
    y = (-0.5+math.random()) * 64})

  --local try_angle = math.random() * math.pi * 2 -- rad
  --local try_distance = planets[1].radius * real_space_multiplier * 1.1
  --local satellite_position = {x = math.cos(try_angle) * try_distance, y = math.sin(try_angle) * try_distance}
  surface.request_to_generate_chunks(satellite_position, 2)
  surface.force_generate_chunk_requests() -- must be generated to place
  local tiles = {}
  for tile_name, positions in pairs(satellite_blueprint.tiles) do
    for _, position in pairs(positions) do
      table.insert(tiles, {name = tile_name,
      position = {
        x = satellite_position.x + position[1] - satellite_blueprint.center[1],
        y = satellite_position.y + position[2] - satellite_blueprint.center[2]}})
    end
  end
  surface.set_tiles(tiles, true)

  for entity_name, set in pairs(satellite_blueprint.entities) do
    local entities = {}
    for _, position in pairs(set.positions) do
      table.insert(entities, surface.create_entity{name = entity_name, force = force_name,
        position =  {
          x = satellite_position.x + position[1] - satellite_blueprint.center[1],
          y = satellite_position.y + position[2] - satellite_blueprint.center[2]}})
    end
    if set.stacks then
      for _, entity in pairs(entities) do
        if entity and entity.valid then
          for _, stack in pairs(set.stacks) do
            entity.insert{name = stack.name, count = stack.count}
          end
        end
      end
    end
  end
  local range = Zone.discovery_scan_radius
  game.forces[force_name].chart(surface, {
      {satellite_position.x - range, satellite_position.y - range},
      {satellite_position.x + range, satellite_position.y + range}
  })
  game.forces[force_name].print({"space-exploration.satellite-discovered-platform"})
  chart_tag_buffer_add({
    force_name = force_name,
    surface = Zone.get_make_surface(zone),
    position = satellite_position,
    icon_type = "item",
    icon_name = "satellite",
    text = "Space Platform",
    chart_range = Zone.discovery_scan_radius,
  })
  global.forces[force_name].nauvis_satellite = satellite_position
end

function on_satellite_launched(force_name)
  Log.debug_log("on_satellite_launched: " .. force_name)
  game.forces[force_name].print({"space-exploration.satellite-launched"})
  global.forces[force_name] = global.forces[force_name] or {}
  global.forces[force_name].satellites_launched = (global.forces[force_name].satellites_launched or 0) + 1

  -- discovery options are:
    -- discover the satellite (always on 1st launch) either in orbit or deadsapce
    -- discover a planet or moon (always on 1st - 5rd launches), 90% chance after
    -- if nothing else discovered, discover an asteroid in deadpsace

  local dicovered_something = false
  if global.forces[force_name].satellites_launched == 1 then
    -- nauvis satellite station

    build_satellite(force_name)
    Zone.discover_next(force_name)
    dicovered_something = true
  --elseif global.forces[force_name].satellites_launched < 6
  --    or math.random() < 0.9 then
  else
    dicovered_something = Zone.discover_next(force_name)
  end

end



function on_satellite_launched(force_name)
  Log.debug_log("on_satellite_launched: " .. force_name)
  game.forces[force_name].print({"space-exploration.satellite-launched"})
  global.forces[force_name] = global.forces[force_name] or {}
  global.forces[force_name].satellites_launched = (global.forces[force_name].satellites_launched or 0) + 1

  -- discovery options are:
    -- discover the satellite (always on 1st launch) either in orbit or deadsapce
    -- discover a planet or moon (always on 1st - 5rd launches), 90% chance after
    -- if nothing else discovered, discover an asteroid in deadpsace

  local dicovered_something = false
  if global.forces[force_name].satellites_launched == 1 then
    -- nauvis satellite station

    build_satellite(force_name)
    Zone.discover_next(force_name)
    dicovered_something = true
  --elseif global.forces[force_name].satellites_launched < 6
  --    or math.random() < 0.9 then
  else
    dicovered_something = Zone.discover_next(force_name)
  end

end

function on_rocket_launched(event)
  Log.debug_log("on_rocket_launched")
	game.set_game_state{game_finished=false, player_won=false, can_continue=true}
  if event.rocket and event.rocket.valid then
    if event.rocket.get_item_count("satellite") > 0 then
      on_satellite_launched(event.rocket.force.name)
    end
  end
end

function setup_force(force)
  if force.name == "enemy" or force.name == "neutral" then return end
  local force_name = force.name
  Log.debug_log("setup_force: "..force_name)
  global.forces = global.forces or {}
  global.forces[force_name] = {
    force_name = force_name,
    zones_discovered_count = 0, -- planets and moons discovered
    zones_discovered = {}, -- name = ForceZoneData{discovered_at = tick discovered, marker = map marker}
    satellites_launched = 0,
    cargo_rockets_launched = 0,
    cargo_rockets_crashed = 0,
    zone_assets = {}, -- zone_index > (rocket_launch_pad_names/ rocket_landing_pad_names)
  }
  Zone.discover(force_name, Zone.from_name("Nauvis"))
  Zone.discover(force_name, Zone.from_name("Nauvis").parent)
end

function on_force_created(event)
  setup_force(event.force)
end

function on_runtime_mod_setting_changed()
  if global.next_meteor_shower and
    global.next_meteor_shower > game.tick + 60 * 60 * settings.global["se-meteor-interval"].value then
    global.next_meteor_shower = game.tick + math.random() * 60 * 60 * settings.global["se-meteor-interval"].value * 0.5
  end
end

function on_configuration_changed()

  Migrate.migrations()

  local zone = Zone.from_name("Nauvis")
  zone.fragment_name = "se-core-fragment-omni"
  zone.surface_index = 1
  zone.inflated = true

  if global.astronomical then
    global.universe = global.astronomical
    global.astronomical = nil
  end

  global.tick_tasks = global.tick_tasks or {}

  if global.forces then
    for force_name in pairs(global.forces) do
      global.forces[force_name].force_name = force_name
    end
  end

  for _, force in pairs(game.forces) do
    force.reset_recipes()
    if force.technologies["radar"] then
      force.technologies["radar"].enabled = true
    end
  end

  -- enable any recipes that should be unlocked.
  -- mainly required for entity-update-externals as a migration file won't work
  for _, force in pairs(game.forces) do
    for _, tech in pairs(force.technologies) do
      if tech.researched then
        for _, effect in pairs(tech.effects) do
          if effect.type == "unlock-recipe" and force.recipes[effect.recipe] then
            force.recipes[effect.recipe].enabled = true
          end
        end
      end
    end
  end

  -- stop game from ending on launch and tracking of launches
  local interface_name = "silo_script"
  if remote.interfaces[interface_name] then
    if remote.interfaces[interface_name]["set_finish_on_launch"] then
      remote.call(interface_name, "set_finish_on_launch", false)
    end
    if remote.interfaces[interface_name]["set_show_launched_without_satellite"] then
      remote.call(interface_name, "set_show_launched_without_satellite", false)
    end
    if remote.interfaces[interface_name]["remove_tracked_item"] then
      remote.call(interface_name, "remove_tracked_item", "satellite")
    end
  end

  if global.next_meteor_shower and
    global.next_meteor_shower > game.tick + 60 * 60 * settings.global["se-meteor-interval"].value then
    global.next_meteor_shower = game.tick + math.random() * 60 * 60 * settings.global["se-meteor-interval"].value * 0.5
  end

  Universe.load_resource_data()

  local zone = Zone.from_name("Nauvis")
  zone.fragment_name = "se-core-fragment-omni"
  zone.surface_index = 1
  zone.inflated = true
  zone.resources = {}
  zone.ticks_per_day = 25000
  homeworld_resources(game.surfaces[1])

  Coreminer.equalise_all()

  global.cache_travel_delta_v = nil

end

function homeworld_resources(surface)
  -- if homeworld resources are too high people never have an incentive to leave.
  local map_gen = surface.map_gen_settings
  local autoplace_controls = map_gen.autoplace_controls
  for control_name, control in pairs(autoplace_controls) do
    if game.autoplace_control_prototypes[control_name] and game.autoplace_control_prototypes[control_name].category == "resource" then
      if control_name ~= "crude-oil" then
        local original = control.richness * control.size
        if control_name == "uranium-ore" then
          control.frequency = math.min(0.5, control.frequency)
          local low_freq = control.frequency * 2
          local richness = 1 * control.richness / (control.richness + control.size)
          local size = 1 * control.size / (control.richness + control.size)
          control.richness = math.min(richness / low_freq, control.richness)
          control.size = math.min(size / low_freq, control.size)
        else
          control.frequency = math.min(0.5, control.frequency)
          local low_freq = control.frequency * 2
          local richness = 2 * control.richness / (control.richness + control.size)
          local size = 2 * control.size / (control.richness + control.size)
          control.richness = math.min(richness / low_freq, control.richness)
          control.size = math.min(size / low_freq, control.size)
        end
        local new = control.richness * control.size
        if new ~= original and game.entity_prototypes[control_name] then
          local remaining_ratio = new / original
          for _, entity in pairs(surface.find_entities_filtered{type = "resource", name=control_name}) do
            local amount = math.floor(entity.amount * remaining_ratio)
            if amount > 0 then
              entity.amount = amount
            else
              entity.destroy()
            end
          end
        end
      end
    end
  end
  if game.forces["enemy"].evolution_factor > 0.5 and not global.evolution_factor_reduced then
    global.evolution_factor_reduced = true
    game.forces["enemy"].evolution_factor = math.max(0.5, game.forces["enemy"].evolution_factor * 0.5)
  end
  surface.map_gen_settings = map_gen
end

function on_init()
  -- When creating a new game, script.on_init() will be called on each mod that has a control.lua file.
  -- When loading a save game and the mod did not exist in that save game script.on_init() is called.

    global.version = version

    -- Astronomical first
    global.seed = game.surfaces[1].map_gen_settings.seed
    global.next_tick_task_id = 1
    global.tick_tasks = {}

    Universe.build()

    local zone = Zone.from_name("Nauvis")
    zone.fragment_name = "se-core-fragment-omni"
    zone.surface_index = 1
    zone.inflated = true
    zone.resources = {}
    zone.ticks_per_day = 25000
    homeworld_resources(game.surfaces[1])

    global.zones_by_surface[zone.surface_index] = zone
    if game.surfaces[1].map_gen_settings.autoplace_controls["planet-size"] then
      -- planet_radius = 10000 / 6 * (6 + log(1/planet_frequency/6, 2))
      -- planet_frequency = 1 / 6 / 2 ^ (planet_radius * 6 / 10000 - 6)
      --zone.radius = 10000 / 6 * game.surfaces[1].map_gen_settings.autoplace_controls["planet-size"].frequency
      zone.radius = 10000 / 6 * (6 + util.math_log(1/game.surfaces[1].map_gen_settings.autoplace_controls["planet-size"].frequency/6, 2))
      Log.trace(zone.radius)
    else
      zone.radius = 10000 / 6
    end

    if Log.debug_big_logs then
      Log.log_universe_simplified()
      Log.log_universe()
    end

    -- Other stuff second
    global.playerdata = global.playerdata or {}
    global.forces = global.forces or {}

    for _, force in pairs(game.forces) do
        setup_force(force)
        force.reset_recipes()

        -- enable any recipes that should be unlocked.
        -- mainly required for entity-update-externals as a migration file won't work
        for _, tech in pairs(force.technologies) do
          if tech.researched then
            for _, effect in pairs(tech.effects) do
              if effect.type == "unlock-recipe" and force.recipes[effect.recipe] then
                force.recipes[effect.recipe].enabled = true
              end
            end
          end
        end

        for tech in pairs(force.technologies['rocket-silo'].prerequisites) do
          force.technologies[tech].enabled = true
        end
    end

end


-- core events
Event.addListener("on_init", on_init, true)
Event.addListener("on_configuration_changed", on_configuration_changed, true)

-- standard events
Event.addListener(defines.events.on_tick, on_tick)

Event.addListener(defines.events.on_player_created, on_player_created)
Event.addListener(defines.events.on_player_built_tile, on_built_tile)
Event.addListener(defines.events.on_robot_built_tile, on_built_tile)
--Event.addListener(defines.events.on_player_mined_tile, on_mined_tile)
--Event.addListener(defines.events.on_robot_mined_tile, on_mined_tile)
Event.addListener(defines.events.on_force_created, on_force_created)
Event.addListener(defines.events.on_rocket_launched, on_rocket_launched)
Event.addListener(defines.events.on_robot_built_entity, on_entity_created)
Event.addListener(defines.events.on_built_entity, on_entity_created)
Event.addListener(defines.events.script_raised_built, on_entity_created)
Event.addListener(defines.events.script_raised_revive, on_entity_created)
Event.addListener(defines.events.on_runtime_mod_setting_changed, on_runtime_mod_setting_changed)


-- virtual events
--Event.addListener("on_player_opened_changed", on_player_opened_changed) -- used directly by launch pad / landing pad
--[[
function on_load()
  --{ name, tick, player_index, parameter}
  commands.add_command("respawn", "Triggers respawn.",
     function(data) Respawn.die(game.players[data.player_index]) end)

  commands.add_command("remoteview", "Starts remote view.",
    function(data) RemoteView.start(game.players[data.player_index]) end)


  -- TODO: lock these behind settings
  commands.add_command("debug_research_all", "Researches all techs.",
    function(data) for name, recipe in pairs(game.players[data.player_index].force.recipes) do recipe.enabled = true end end)

  commands.add_command("debug_cheat", "Sets cheat mode.",
    function(data) game.players[data.player_index].cheat_mode = true end)

  commands.add_command("debug_uncheat", "Sets cheat mode to false.",
    function(data) game.players[data.player_index] = true end)

  commands.add_command("debug_launch_satellite", "Triggers satellite launch and zone discovery",
    function(data) build_satellite(game.players[data.player_index].force.name) end)

  commands.add_command("debug_discover_next_zone", "Triggers zone discovery",
    function(data) Zone.discover_next(game.players[data.player_index].force.name) end)

  commands.add_command("debug_view_all_zones", "Shows all zones. Specify \"false\" to undo.",
    function(data)
      local playerdata = get_make_playerdata(game.players[data.player_index])
      if data.parameter ~= "false" then
        playerdata.debug_view_all_zones = true
      else
        playerdata.debug_view_all_zones = nil
      end
     end)

   commands.add_command("debug_teleport_to", "Teleports to a zone or spaceship. Specify zone name, spaceship name, or \"spaceship\".",
     function(data)
       local player = game.players[data.player_index]

       if data.parameter == "spaceship" then
         for _, spaceship in pairs(global.spaceships) do
           if spaceship.force_name == player.force.name then
             return teleport_non_colliding_player(player, {0,0}, Spaceship.get_console_or_middle_position(spaceship))
           end
         end
       end
       local zone = Zone.from_name(data.parameter)
       if zone then
         return teleport_non_colliding_player(player, {0,0}, Zone.get_make_surface(zone))
       end
       local spaceship = Spaceship.from_name(data.parameter)
       if spaceship then
         return teleport_non_colliding_player(player, {0,0}, Spaceship.get_console_or_middle_position(spaceship))
       end
      end)
end
Event.addListener("on_load", on_load, true)
]]--

remote.add_interface(
    "space-exploration",
    {

--/c remote.call("space-exploration", "get_player_character", {player = game.player})
        get_player_character = function(data)
          if data.player and data.player.valid then
            if player.character then return player.character end
            local playerdata = get_make_playerdata(data.player)
            return playerdata.character
          end
        end,

--Can multiply resources on nauvis. It should not be used unless you are sure the available resources on nauvis are insufficient to set up a few moon mining bases.
--/c remote.call("space-exploration", "multiply_nauvis_resource", {surface = game.player.surface, resource_name = "iron-ore", multiplier=0.9})
        multiply_nauvis_resource = function(data)
          if data.multiplier > 0 and data.multiplier ~= 1 and data.surface then
            for _, entity in pairs(data.surface.find_entities_filtered{type = "resource", name=data.resource_name}) do
              local amount = math.ceil(entity.amount * data.multiplier)
              if amount > 0 then
                entity.amount = amount
              else
                entity.destroy()
              end
            end
          end
        end,

-- set the target zone to be a homeworld
--/c remote.call("space-exploration", "set_zone_as_homeworld", {zone_name = "Arendel", match_nauvis_seed = false, reset_surface = true})
        set_zone_as_homeworld = function(data)
          local zone = Zone.from_name(data.zone_name)
          if not zone then
            game.print("No zone found")
          else
            if zone.type ~= "planet" then
              game.print("Zone type must be planet, selected zone is: " .. zone.type)
            else
              zone.is_homeworld = true
              zone.inflated = true
              zone.resources = {}
              zone.ticks_per_day = 25000
              zone.fragment_name = "se-core-fragment-omni"

              local surface = Zone.get_make_surface(zone)
              local seed = surface.map_gen_settings.seed
              local nauvis_map_gen = game.surfaces[1].map_gen_settings
              if data.match_nauvis_seed ~= true then
                nauvis_map_gen.seed = seed
              end
              surface.map_gen_settings = nauvis_map_gen
              if reset_surface ~= false then
                surface.clear(true)
              end
            end
          end
        end,


--/c remote.call("space-exploration", "get_zone_from_name", {zone_name = "Nauvis"})
        get_zone_from_name = function(data) return Zone.export_zone(Zone.from_name(data.zone_name)) end,

--/c remote.call("space-exploration", "get_zone_from_zone_index", {zone_index = 2})
        get_zone_from_zone_index = function(data) return Zone.export_zone(Zone.from_zone_index(data.zone_index)) end,

--/c remote.call("space-exploration", "get_zone_from_surface_index", {surface_index = game.player.surface.index})
        get_zone_from_surface_index = function(data) return Zone.export_zone(Zone.from_surface_index(data.surface_index)) end,

--/c remote.call("space-exploration", "get_zone_icon", {zone_index = game.player.surface.index})
        get_zone_icon = function(data) return Zone.get_icon(Zone.from_zone_index(data.zone_index)) end,

--/c remote.call("space-exploration", "get_zone_is_solid", {zone_index = game.player.surface.index})
        get_zone_is_solid = function(data) return Zone.is_solid(Zone.from_zone_index(data.zone_index)) end,

--/c remote.call("space-exploration", "get_zone_is_space", {zone_index = game.player.surface.index})
        get_zone_is_space = function(data) return Zone.is_space(Zone.from_zone_index(data.zone_index)) end,

--/c remote.call("space-exploration", "get_cargo_loss", {force = game.player.force})
        get_cargo_loss = function(data) return Launchpad.get_cargo_loss(data.force) end,

--/c remote.call("space-exploration", "get_reusability", {force = game.player.force})
        get_reusability = function(data) return Launchpad.get_reusability(data.force) end,

--/c remote.call("space-exploration", "get_survivability_loss", {force = game.player.force})
--/c game.print(remote.call("space-exploration", "get_survivability_loss", {force = game.player.force}))
        get_survivability_loss = function(data) return Launchpad.get_survivability_loss(data.force) end,

--/c game.print(remote.call("space-exploration", "get_rockets_launched", {force = game.player.force}))
        get_rockets_launched = function(data) return global.forces[data.force.name].cargo_rockets_launched end,

--/c remote.call("space-exploration", "launch_satellite", {force_name = game.player.force.name})
        launch_satellite = function(data) on_satellite_launched(data.force_name) end,

--/c remote.call("space-exploration", "build_satellite", {force_name = game.player.force.name})
        build_satellite = function(data) build_satellite(data.force_name) end,

--/c remote.call("space-exploration", "build_ruin", {ruin_name = "satellite", surface_index = game.player.surface.index, position = game.player.position})
        build_ruin = function(data)
          Ruin.build(data)
        end,

--/c remote.call("space-exploration", "discover_next_zone", {force_name = game.player.force.name})
        discover_next_zone = function(data) Zone.discover_next(data.force_name) end,

--/c remote.call("space-exploration", "show_all_zones", {})
        show_all_zones = function(data)
          global.debug_view_all_zones = true
        end,

--/c remote.call("space-exploration", "unshow_all_zones", {})
        unshow_all_zones = function(data)
          global.debug_view_all_zones = false
        end,

--/c remote.call("space-exploration", "debug_set_global", {debug_view_all_zones = true})
--        debug_set_global = function(data)  for k, v in pairs(data) do  global[k] = v end end,

--/c remote.call("space-exploration", "teleport_to_zone", {zone_name = "Nauvis", player=game.player})
        teleport_to_zone = function(data)
          local zone = Zone.from_name(data.zone_name)
          if zone and data.player then
            data.player.teleport({0,0}, Zone.get_make_surface(zone))
          end
        end,

--/c remote.call("space-exploration", "set_player_velocity", {player=game.player, velocity = {x = 0, y = 0}})
        set_player_velocity = function(data)
          if data.player and data.velocity and data.velocity.x and data.velocity.y then
            local playerdata = get_make_playerdata(player)
            if playerdata then
              playerdata.velocity = data.velocity
            end
          end
        end,
--/c remote.call("space-exploration", "begin_meteor_shower", {target_entity = game.player, meteors = 10})
--/c remote.call("space-exploration", "begin_meteor_shower", {target_entity = game.player.selected or game.player})
--/c remote.call("space-exploration", "begin_meteor_shower", {zone_name = "Nauvis", position = {x=0,y=0}, range = 1, meteors = 100})
        begin_meteor_shower = function(data)
          local entity = data.target_entity
          if entity then
            local zone = Zone.from_surface(entity.surface)
            if zone and zone.type ~= "spaceship" then
              Meteor.begin_meteor_shower(zone, entity.position, data.range, data.meteors)
            end
          elseif data.zone_name then
            local zone = Zone.from_name(data.zone_name)
            if zone and zone.type ~= "spaceship" then
              local position = data.position or {x = 0, y = 0}
              Meteor.begin_meteor_shower(zone, position, data.range, data.meteors)
            end
          end

        end,


--/c remote.call("space-exploration", "fuel_rocket_silos", {})
        fuel_rocket_silos = function()
          for _, launch_pad in pairs(global.rocket_launch_pads) do
            launch_pad.lua_fuel = (launch_pad.lua_fuel or 0) + 100000000
          end
        end,

--/c remote.call("space-exploration", "cheats", {})
        cheats = function()
          for _, player in pairs(game.players) do
            player.cheat_mode = true
            for name, recipe in pairs(player.force.recipes) do recipe.enabled = true end
            player.force.technologies["inserter-capacity-bonus-1"].researched = true
            player.force.technologies["inserter-capacity-bonus-2"].researched = true
            player.force.technologies["laser-turret-speed-1"].researched = true
            player.force.technologies["laser-turret-speed-2"].researched = true
            player.force.technologies["laser-turret-speed-3"].researched = true
            player.force.technologies["laser-turret-speed-4"].researched = true
            player.force.technologies["energy-weapons-damage-1"].researched = true
            player.force.technologies["energy-weapons-damage-2"].researched = true
            player.force.technologies["energy-weapons-damage-3"].researched = true
            player.force.technologies["energy-weapons-damage-4"].researched = true
            player.force.technologies["energy-weapons-damage-5"].researched = true
            player.force.technologies["construction-robotics"].researched = true
            for i = 1, 8 do
              player.force.technologies["se-spaceship-integrity-"..i].researched = true
            end
            player.force.technologies["se-spaceship-supersize"].level = 11
            player.get_inventory(defines.inventory.character_guns).clear()
            player.get_inventory(defines.inventory.character_ammo).clear()
            player.insert{name = "se-thruster-suit", count = 1}
            player.insert{name = "se-tesla-gun", count = 1}
            player.insert("se-tesla-ammo")
            player.insert("se-medpack")
            player.insert("electric-energy-interface")
            player.insert("substation")
            player.insert("infinity-chest")
            player.insert("infinity-pipe")
          end
        end,

--/c remote.call("space-exploration", "show_only_zones", {zone_names = {"Nauvis", "Sandro", "Zomble", "Foenestra", "Kamsta"}})
        show_only_zones = function(data)
          for force_name, force_data in pairs(global.forces) do
            force_data.zones_discovered = {}
            force_data.zones_discovered_count = 0
            force_data.satellites_launched = 1
            for _, zone_name in pairs(data.zone_names) do
              local zone = Zone.from_name(zone_name)
              if zone then
                Zone.discover(force_name, zone, "Command")
              else
                game.print("Invalid zone name: "..zone_name)
              end
            end
          end
        end,

        get_on_cargo_rocket_launched_event = function() return Launchpad.on_cargo_rocket_launched_event end,

-- TODO: add planet swap command

--/c remote.call("space-exploration", "planet_swap", {star="Calidus", add_planet="Sandro"})

        robot_attrition_for_surface = function(data)
          local surface_index = data.surface_index
          local default_rate = data.default_rate
          local zone = Zone.from_surface_index(surface_index)
          return Zone.get_attrition(zone, default_rate)
        end,

--/c remote.call("space-exploration", "log_map_gen", {})
        log_map_gen = Log.log_map_gen,
        log_global = Log.log_global,
        log_universe_simplified = Log.log_universe_simplified,
        log_universe = Log.log_universe,
        log_forces = Log.log_forces,
        log_spaceships = Log.log_spaceships,
    }
)


--log( serpent.block( data.raw["projectile"], {comment = false, numformat = '%1.8g' } ) )
-- /c Log.trace(serpent.block( game.surfaces.nauvis.map_gen_settings.autoplace_controls, {comment = false, numformat = '%1.8g' }))
