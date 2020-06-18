local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "darkmatter-data",
  ingredients = {
    { data_util.mod_prefix .. "gravimetric-observation-data", 1 },
    { data_util.mod_prefix .. "negative-pressure-data", 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "darkmatter-data", amount_min = 1, amount_max = 1, probability = 0.5 },
    { data_util.mod_prefix .. "junk-data", 1 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.49 },
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "darkmatter-data",
  icon = "__space-exploration-graphics__/graphics/icons/data/darkmatter.png",
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "gravimetric-observation-data",
  ingredients = {
    { data_util.mod_prefix .. "astrometric-data", 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "gravimetric-observation-data", amount_min = 1, amount_max = 1, probability = 0.95 },
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.04},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "gravimetric-observation-data",
  icon = "__space-exploration-graphics__/graphics/icons/data/gravimetric-observation.png",
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "gravimetric-test-data",
  ingredients = {
    { data_util.mod_prefix .. "gravimetric-observation-data", 1 },
    { data_util.mod_prefix .. "gravity-wave-observation-data", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "gravimetric-test-data", amount_min = 1, amount_max = 1, probability = 0.95 },
    { data_util.mod_prefix .. "junk-data", 1 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.04 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "gravimetric-test-data",
  icon = "__space-exploration-graphics__/graphics/icons/data/gravimetric-test.png",
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "timespace-anomaly-data",
  ingredients = {
    { data_util.mod_prefix .. "gravimetric-test-data", 1 },
    { data_util.mod_prefix .. "entanglement-data", 1 },
    { data_util.mod_prefix .. "exotic-singularity-data", 1 },
    { data_util.mod_prefix .. "forcefield-data", 1 },
    { data_util.mod_prefix .. "zero-point-energy-data", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "timespace-anomaly-data", amount_min = 1, amount_max = 1, probability = 0.2 },
    { name = data_util.mod_prefix .. "gravimetric-test-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "entanglement-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "exotic-singularity-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "forcefield-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "zero-point-energy-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "timespace-anomaly-data",
  icon = "__space-exploration-graphics__/graphics/icons/data/timespace-anomaly.png",
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "dark-energy-data",
  ingredients = {
    { name = data_util.mod_prefix .. "negative-pressure-data", amount = 1},
    { name = data_util.mod_prefix .. "astrometric-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "dark-energy-data", amount_min = 1, amount_max = 1, probability = 0.75},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.24},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "dark-energy-data",
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})
