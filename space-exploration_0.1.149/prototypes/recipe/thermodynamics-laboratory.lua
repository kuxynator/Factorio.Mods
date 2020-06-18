local data_util = require("data_util")
local make_recipe = data_util.make_recipe

local recipe_multiplier = 4

make_recipe({
  name = data_util.mod_prefix .. "thermodynamics-coal",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 10},
  },
  results = {
    { name = "coal", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 20},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
  },
  energy_required = 5 * recipe_multiplier,
  subgroup = "space-components",
  category = "space-thermodynamics",
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "bio-combustion-data",
  ingredients = {
    { name = data_util.mod_prefix .. "specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "bio-combustion-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "bio-combustion-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "bio-combustion-resistance-data",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "bio-combustion-resistance-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "bio-combustion-resistance-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

--[[
-- removed
make_recipe({
  name = data_util.mod_prefix .. "bio-combustion-suppression-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "experimental-material", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 100},
  },
  results = {
    { name = data_util.mod_prefix .. "bio-combustion-suppression-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 100},
  },
  category = "space-thermodynamics",
})
]]--

make_recipe({
  name = data_util.mod_prefix .. "cold-thermodynamics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "cold-thermodynamics-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 8},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "cold-thermodynamics-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "nano-cold-thermodynamics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "nano-material", amount = 1},
    { name = data_util.mod_prefix .. "cold-thermodynamics-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "nano-cold-thermodynamics-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 8},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "nano-cold-thermodynamics-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "hot-thermodynamics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "hot-thermodynamics-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "hot-thermodynamics-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "nano-hot-thermodynamics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "nano-material", amount = 1},
    { name = data_util.mod_prefix .. "hot-thermodynamics-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "nano-hot-thermodynamics-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "nano-hot-thermodynamics-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})


make_recipe({
  name = data_util.mod_prefix .. "plasma-thermodynamics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 5},
    { name = data_util.mod_prefix .. "heat-shielding", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 50},
  },
  results = {
    { name = data_util.mod_prefix .. "plasma-thermodynamics-data", amount = 5},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 5},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "plasma-thermodynamics-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "pressure-containment-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 5},
    { name = "storage-tank", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 1000},
  },
  results = {
    { name = data_util.mod_prefix .. "pressure-containment-data", amount = 5},
    { name = data_util.mod_prefix .. "scrap", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 990},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "pressure-containment-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})
