local data_util = require("data_util")
local make_recipe = data_util.make_recipe

-- making data cell
--[[make_recipe({
  name = data_util.mod_prefix .. "omega-tool",
  ingredients = {
    { data_util.mod_prefix .. "nano-material", 100 },
  },
  results = {
    { data_util.mod_prefix .. "omega-tool", 1},
  },
  category = "space-manufacturing"
})]]--

-- making data cell
make_recipe({
  name = data_util.mod_prefix .. "data-storage-substrate",
  ingredients = {
    { "glass", 2 },
    { "iron-plate", 4 }
  },
  results = {
    { data_util.mod_prefix .. "data-storage-substrate", 1},
    { name = data_util.mod_prefix .. "scrap", amount_min = 1, amount_max = 1, probability = 0.5 },
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "data-storage-substrate",
  category = "crafting",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "empty-data",
  ingredients = {
    { "advanced-circuit", 3 },
    { "copper-plate", 6 },
    { data_util.mod_prefix .. "data-storage-substrate-cleaned", 4 }
  },
  results = {
    { data_util.mod_prefix .. "empty-data", 1},
  },
  energy_required = 10,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
}, true)

make_recipe({
  name = data_util.mod_prefix .. "material-testing-pack",
  ingredients = {
    { "iron-plate", 1},
    { "copper-plate", 1},
    { "stone", 1},
    { "plastic-bar", 1},
  },
  results = {
    { data_util.mod_prefix .. "material-testing-pack", 1},
  },
  energy_required = 5,
  category = "crafting",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "canister",
  ingredients = {
    { "steel-plate", 5},
    { "copper-plate", 10},
    { "plastic-bar", 5},
    { "glass", 5},
    { data_util.mod_prefix .. "heat-shielding", 1},
  },
  results = {
    { data_util.mod_prefix .. "canister", 1},
  },
  energy_required = 10,
  category = "crafting",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "space-mirror",
  ingredients = {
    { name = "glass", amount = 6},
    { name = "steel-plate", amount = 3},
    { name = "low-density-structure", amount = 1},
    { name = data_util.mod_prefix .. "heat-shielding", amount = 1},
    { type = "fluid", name = "lubricant", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .."chemical-gel", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix.."space-mirror", amount = 1 },
    { name = data_util.mod_prefix.."scrap", amount = 1 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "space-mirror",
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/space-mirror.png",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "space-solar-panel",
  ingredients = {
    { name = "solar-panel", amount = 4},
    { name = data_util.mod_prefix .. "space-mirror", amount = 4},
  },
  results = {
    { name = data_util.mod_prefix .. "space-solar-panel", amount = 1 },
  },
  energy_required = 30,
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/solar-panel.png",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "space-solar-panel-2",
  ingredients = {
    { name = data_util.mod_prefix .. "space-solar-panel", amount = 1},
    { name = data_util.mod_prefix .. "space-mirror", amount = 16},
    { name = data_util.mod_prefix .. "superconductive-cable", amount = 4},
  },
  results = {
    { name = data_util.mod_prefix .. "space-solar-panel-2", amount = 1 },
  },
  energy_required = 60,
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/solar-panel-2.png",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "space-accumulator",
  ingredients = {
    { name = "accumulator", amount = 10},
    { name = data_util.mod_prefix .. "superconductive-cable", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-accumulator", amount = 1 },
  },
  energy_required = 30,
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/accumulator.png",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "observation-frame-blank",
  ingredients = {
    { name = "coal", amount = 1},
    { name = "glass", amount = 1},
    { name = "iron-plate", amount = 1},
    { type = "fluid", name = "light-oil", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix.."observation-frame-blank", amount = 10 },
  },
  energy_required = 10,
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/observation-frame-blank.png",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "gammaray-detector",
  ingredients = {
    { name = data_util.mod_prefix.."space-mirror", amount = 1 },
    { name = "copper-plate", amount = 1},
    { type = "fluid", name = "heavy-oil", amount = 50},
    { type = "fluid", name = data_util.mod_prefix.."chemical-gel", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix.."gammaray-detector", amount = 1 },
  },
  energy_required = 10,
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/gammaray-detector.png",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "chemical-gel",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10},
    { type = "fluid", name = "petroleum-gas", amount = 100},
  },
  results = {
    { type="fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 20},
  },
  energy_required = 10,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})

--[[
make_recipe({
  name = data_util.mod_prefix .. "space-rail",
  ingredients = {
    { name = "low-density-structure", amount = 1},
    { name = "steel-plate", amount = 2},
    { name = "copper-cable", amount = 4},
  },
  results = {
    { name = data_util.mod_prefix .. "space-rail", amount = 1},
  },
  energy_required = 10,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})
]]--

make_recipe({
  name = data_util.mod_prefix .. "space-rail",
  ingredients = {
    { name = "rail", amount = 100},
    { name = "steel-plate", amount = 100},
    { name = "copper-cable", amount = 100},
    { name = data_util.mod_prefix .. "energy-catalogue-1", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "space-rail", amount = 100},
  },
  energy_required = 100,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})
