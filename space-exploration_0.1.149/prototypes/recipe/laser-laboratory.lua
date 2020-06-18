local data_util = require("data_util")
local make_recipe = data_util.make_recipe


make_recipe({
  name = data_util.mod_prefix .. "gravity-wave-observation-data",
  ingredients = {
    { name = data_util.mod_prefix .. "astrometric-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "gravity-wave-observation-data", amount_min = 1, amount_max = 1, probability = 0.3},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.69},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 2,
  main_product = data_util.mod_prefix .. "gravity-wave-observation-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})


make_recipe({
  name = data_util.mod_prefix .. "negative-pressure-data",
  ingredients = {
    { name = data_util.mod_prefix .. "astrometric-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "negative-pressure-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "negative-pressure-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "polarisation-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 10},
    { name = data_util.mod_prefix .. "space-mirror", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "polarisation-data", amount = 9},
    { name = data_util.mod_prefix .. "junk-data", amount = 1},
    { name = data_util.mod_prefix .. "scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "polarisation-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "quantum-phenomenon-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "quantum-phenomenon-data", amount_min = 1, amount_max = 1, probability = 0.8},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.19},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "quantum-phenomenon-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "zero-point-energy-data",
  ingredients = {
    { name = data_util.mod_prefix .. "negative-pressure-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "zero-point-energy-data", amount_min = 1, amount_max = 1, probability = 0.3},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.69},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "zero-point-energy-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})
