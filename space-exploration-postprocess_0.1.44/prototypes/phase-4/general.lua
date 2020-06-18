local data_util = require("data_util")

if data.raw.technology["automation-science-pack"] then
  data.raw.technology["automation-science-pack"].icon = "__space-exploration-graphics__/graphics/technology/red.png"
end

data.raw.technology["space-science-pack"].prerequisites = {data_util.mod_prefix .."space-science-lab"}

for _, lab in pairs(data.raw.lab) do
  if lab.inputs and lab.name ~= data_util.mod_prefix.."space-science-lab" then
    for _, input in pairs(lab.inputs) do
      if not (string.find(input, "module", 1, true) or string.find(input, "circuit-board", 1, true)) then
        if not data_util.table_contains(data.raw.lab[data_util.mod_prefix.."space-science-lab"].inputs, input) then
          table.insert(data.raw.lab[data_util.mod_prefix.."space-science-lab"].inputs, input)
        end
      end
    end
  end
end

-- all rails now are required to collide
for _, rail in pairs(data.raw["straight-rail"]) do
  if not data_util.table_contains(rail.collision_mask, "floor-layer") then
    table.insert( rail.collision_mask, "floor-layer" )
  end
end

for _, rail in pairs(data.raw["curved-rail"]) do
  if not data_util.table_contains(rail.collision_mask, "floor-layer") then
    table.insert( rail.collision_mask, "floor-layer" )
  end
end
