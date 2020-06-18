local data_util = require("data_util")

require("prototypes/phase-multi/no-recycle")

require("prototypes/phase-3/recipe")

require("prototypes/phase-3/technology")

require("prototypes/phase-3/noise-programs")

require("prototypes/phase-3/space-collision")

require("prototypes/phase-3/resources")

require("prototypes/phase-3/core-fragments")

require("prototypes/phase-3/incompatibility")

require("prototypes/phase-3/angels")
--require("prototypes/phase-3/compatibility")

data.raw["heat-pipe"]["heat-pipe"].heat_buffer.max_transfer = "2GW"

for _, fish in pairs(data.raw.fish) do
  if not fish.healing_per_tick then fish.healing_per_tick = 0.01 end
  fish.resistances = {
    {type = "meteor", percent = 100}
  }
end

-- only space lab can use space science
for _, lab in pairs(data.raw.lab) do
  if lab.name ~= data_util.mod_prefix.."space-science-lab" then
    data_util.remove_from_table(lab.inputs, "space-science-pack")
  end
end

-- undo some alien biomes changes, impotant for asteroid decals
data.raw.tile["se-space"].layer = 0
data.raw.tile["se-space"].pollution_absorption_per_second = 0.1
data.raw.tile["se-asteroid"].layer = 5

local function find_orphaned_recipes()
  local all_recipes = {}
  for _, recipe in pairs(data.raw.recipe) do
    if (recipe.enabled == false) or
      (recipe.normal and recipe.normal.enabled == false) or
      (recipe.expensive and recipe.expensive.enabled == false) then
      all_recipes[recipe.name] = true
    end
  end
  for _, tech in pairs(data.raw.technology) do
    if tech.effects then
      for _, effect in pairs(tech.effects) do
        if effect.type == "unlock-recipe" and effect.recipe then
          all_recipes[effect.recipe] = nil
        end
      end
    end
  end
  for recipe_name, valid in pairs(all_recipes) do
    log("Orphaned recipe: " .. recipe_name)
  end
end


data_util.tech_add_prerequisites("energy-shield-equipment", { data_util.mod_prefix .. "energy-science-pack"})
data_util.tech_add_ingredients("energy-shield-equipment", {
  "automation-science-pack", "logistic-science-pack", "chemical-science-pack", "space-science-pack", data_util.mod_prefix .. "energy-science-pack"}, true)
data.raw.technology["energy-shield-equipment"].icon = "__space-exploration-graphics__/graphics/technology/energy-shield-red.png"
data.raw.item["energy-shield-equipment"].icon = "__space-exploration-graphics__/graphics/icons/energy-shield-red.png"
data.raw.item["energy-shield-equipment"].icon_size = 64
data.raw["energy-shield-equipment"]["energy-shield-equipment"].max_shield_value = 100
data.raw["energy-shield-equipment"]["energy-shield-equipment"].energy_source.input_flow_limit = "1MW"
data.raw["energy-shield-equipment"]["energy-shield-equipment"].sprite.filename = "__space-exploration-graphics__/graphics/equipment/energy-shield-red.png"
data_util.replace_or_add_ingredient("energy-shield-equipment", nil, 'copper-cable', 20)
data_util.replace_or_add_ingredient("energy-shield-equipment", nil, data_util.mod_prefix .. 'plasma-electrodynamics-data', 5)

data_util.tech_add_prerequisites("energy-shield-mk2-equipment", { data_util.mod_prefix .. "space-catalogue-energy-2"})
data_util.tech_add_prerequisites("energy-shield-mk2-equipment", { data_util.mod_prefix .. "material-science-pack"})
data.raw.technology["energy-shield-mk2-equipment"].icon = "__space-exploration-graphics__/graphics/technology/energy-shield-yellow.png"
data.raw.item["energy-shield-mk2-equipment"].icon = "__space-exploration-graphics__/graphics/icons/energy-shield-yellow.png"
data.raw.item["energy-shield-mk2-equipment"].icon_size = 64
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].max_shield_value = 250
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].energy_source.input_flow_limit = "4MW"
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].sprite.filename = "__space-exploration-graphics__/graphics/equipment/energy-shield-yellow.png"
data_util.replace_or_add_ingredient("energy-shield-mk2-equipment", "energy-shield-equipment", "energy-shield-equipment", 5)
data_util.replace_or_add_ingredient("energy-shield-mk2-equipment", nil, data_util.mod_prefix .. 'plasma-thermodynamics-data', 5)
data_util.replace_or_add_ingredient("energy-shield-mk2-equipment", nil, data_util.mod_prefix .. 'subatomic-data', 5)

data_util.tech_add_prerequisites("energy-shield-mk3-equipment", { data_util.mod_prefix .. "space-catalogue-energy-3"})
data.raw.technology["energy-shield-mk3-equipment"].icon = "__space-exploration-graphics__/graphics/technology/energy-shield-green.png"
data.raw.item["energy-shield-mk3-equipment"].icon = "__space-exploration-graphics__/graphics/icons/energy-shield-green.png"
data.raw.item["energy-shield-mk3-equipment"].icon_size = 64
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].max_shield_value = 500
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].energy_source.input_flow_limit = "16MW"
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].sprite.filename = "__space-exploration-graphics__/graphics/equipment/energy-shield-green.png"
data_util.replace_or_add_ingredient("energy-shield-mk3-equipment", nil, data_util.mod_prefix .. 'forcefield-data', 10)

data_util.tech_add_prerequisites("energy-shield-mk4-equipment", { data_util.mod_prefix .. "superconductive-cable"})
data.raw.technology["energy-shield-mk4-equipment"].icon = "__space-exploration-graphics__/graphics/technology/energy-shield-cyan.png"
data.raw.item["energy-shield-mk4-equipment"].icon = "__space-exploration-graphics__/graphics/icons/energy-shield-cyan.png"
data.raw.item["energy-shield-mk4-equipment"].icon_size = 64
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].max_shield_value = 1000
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].energy_source.input_flow_limit = "64MW"
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].sprite.filename = "__space-exploration-graphics__/graphics/equipment/energy-shield-cyan.png"
data_util.replace_or_add_ingredient("energy-shield-mk4-equipment", nil, data_util.mod_prefix .. 'superconductive-cable', 50)

data_util.tech_add_prerequisites("energy-shield-mk5-equipment", { data_util.mod_prefix .. "space-catalogue-energy-4"})
data_util.tech_add_prerequisites("energy-shield-mk5-equipment", { data_util.mod_prefix .. "space-catalogue-material-4"})
data.raw.technology["energy-shield-mk5-equipment"].icon = "__space-exploration-graphics__/graphics/technology/energy-shield-blue.png"
data.raw.item["energy-shield-mk5-equipment"].icon = "__space-exploration-graphics__/graphics/icons/energy-shield-blue.png"
data.raw.item["energy-shield-mk5-equipment"].icon_size = 64
data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].max_shield_value = 2000
data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].energy_source.input_flow_limit = "250MW"
data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].sprite.filename = "__space-exploration-graphics__/graphics/equipment/energy-shield-blue.png"
data_util.replace_or_add_ingredient("energy-shield-mk5-equipment", nil, data_util.mod_prefix .. 'nano-material', 50)
data_util.replace_or_add_ingredient("energy-shield-mk5-equipment", nil, data_util.mod_prefix .. 'magnetic-monopole-data', 50)

data_util.tech_add_prerequisites("energy-shield-mk6-equipment", { data_util.mod_prefix .. "antimatter-production"})
data.raw.technology["energy-shield-mk6-equipment"].icon = "__space-exploration-graphics__/graphics/technology/energy-shield-magenta.png"
data.raw.item["energy-shield-mk6-equipment"].icon = "__space-exploration-graphics__/graphics/icons/energy-shield-magenta.png"
data.raw.item["energy-shield-mk6-equipment"].icon_size = 64
data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].max_shield_value = 4000
data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].energy_source.input_flow_limit = "1000MW"
data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].sprite.filename = "__space-exploration-graphics__/graphics/equipment/energy-shield-magenta.png"
data_util.replace_or_add_ingredient("energy-shield-mk6-equipment", nil, data_util.mod_prefix .. 'antimatter-canister', 50)

for _, proto in pairs(data.raw["energy-shield-equipment"]) do
  if not string.find(proto.name, "adaptive-armour", 1, true) then
    local max_shield = proto.max_shield_value
    proto.energy_per_shield = (20 + max_shield / 50) .. "kJ"
    local energy_per_shield = data_util.string_to_number(proto.energy_per_shield)
    local input_flow = data_util.string_to_number(proto.energy_source.input_flow_limit)
    local buffer_capacity = data_util.string_to_number(proto.energy_source.buffer_capacity)
    local drain = (input_flow / 20)
    --log("name " .. _)
    --log("max_shield " .. max_shield)
    --log("energy_per_shield " .. energy_per_shield)
    --log("input_flow " .. input_flow)
    --log("buffer_capacity " .. buffer_capacity)
    --log("drain " .. drain)
    -- mk1 = 10 * 50 * (240000 + 120000/4) / 20000 = 6750
    -- mk2 = 10 * 150 * (360000 + 180000/4) / 30000 = 20250
    proto.energy_source.drain = drain.."W"
  end
end
--log( serpent.block( data.raw["energy-shield-equipment"], {comment = false, numformat = '%1.8g' } ) )


-- stop rails from being destroyed by meteors
for _, rail_type in pairs({"straight-rail", "curved-rail"}) do
  for _, rail in pairs(data.raw[rail_type]) do
    rail.selection_priority = 1
    rail.resistances = rail.resistances or {}
    table.insert(rail.resistances, {type = "meteor", percent = 99.75})
  end
end
for _, type in pairs({"locomotive", "cargo-wagon", "fluid-wagon"}) do
  for _, prototype in pairs(data.raw[type]) do
    prototype.selection_priority = 51
  end
end

data.raw["god-controller"]["default"].item_pickup_distance = 0
data.raw["god-controller"]["default"].loot_pickup_distance = 0
data.raw["god-controller"]["default"].mining_speed = 0.0000001
data.raw["god-controller"]["default"].movement_speed = 1
data.raw["spectator-controller"]["default"].movement_speed = 1

-- needs to be after compatability changes, here is safest place
data_util.tech_remove_ingredients_recursive ("space-science-pack", {"space-science-pack", "utility-science-pack"})

-- this won't work, the furnace recipes are hidden
if data.raw["recipe-category"]["recycle"] then
  table.insert(data.raw["assembling-machine"][data_util.mod_prefix .. "space-recycling-facility"].crafting_categories, "recycle")
end
if data.raw["recipe-category"]["recycle-with-fluids"] then
  table.insert(data.raw["assembling-machine"][data_util.mod_prefix .. "space-recycling-facility"].crafting_categories, "recycle-with-fluids")
end

for i=4,9 do
  data.raw.module["productivity-module-" .. i].limitation = data.raw.module["productivity-module-3"].limitation
end

--find_orphaned_recipes()


--log( serpent.block( data.raw, {comment = false, numformat = '%1.8g' } ) )

--log( serpent.block( data.raw.fluid, {comment = false, numformat = '%1.8g' } ) )
--log( serpent.block( data.raw.item, {comment = false, numformat = '%1.8g' } ) )
--log( serpent.block( data.raw.recipe, {comment = false, numformat = '%1.8g' } ) )
--log( serpent.block( data.raw.tile.asteroid, {comment = false, numformat = '%1.8g' } ) )
--log( serpent.block( data.raw.item, {comment = false, numformat = '%1.8g' } ) )
--log( serpent.block( data.raw.pipe, {comment = false, numformat = '%1.8g' } ) )
--log( serpent.block( data.raw["splitter"][data_util.mod_prefix .. "space-splitter"], {comment = false, numformat = '%1.8g' } ) )
