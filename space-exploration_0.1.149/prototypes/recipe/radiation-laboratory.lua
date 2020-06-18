local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "exotic-fission-data",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-material", amount = 2 },
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "exotic-fission-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "exotic-fission-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "experimental-material-decay-data",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-material", amount = 1 },
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "experimental-material-decay-data", amount_min = 1, amount_max = 1, probability = 0.4},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.59},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "experimental-material-decay-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "gammaray-test-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 2 },
    { name = data_util.mod_prefix .. "gammaray-detector", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "gammaray-test-data", amount = 2},
  },
  energy_required = 10,
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "material-decay-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "material-decay-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "material-decay-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "radiation-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = "uranium-238", amount = 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "radiation-data", amount = 1},
    { name = "uranium-238", amount_min = 1, amount_max = 1, probability = 0.9 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "radiation-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "radiation-exposure-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = data_util.mod_prefix .. "specimen", amount = 1 },
    { name = "uranium-238", amount = 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "radiation-exposure-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
    { name = "uranium-238", amount_min = 1, amount_max = 1, probability = 0.9 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "radiation-exposure-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "radiation-exposure-resistance-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1 },
    { name = "uranium-238", amount = 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "radiation-exposure-resistance-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
    { name = "uranium-238", amount_min = 1, amount_max = 1, probability = 0.9 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "radiation-exposure-resistance-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "radiation-shielding-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = data_util.mod_prefix .. "specimen", amount = 1 },
    { name = data_util.mod_prefix .. "experimental-material", amount = 1 },
    { name = "uranium-238", amount = 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "radiation-shielding-data", amount = 1},
    { type = "fluid",  name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
    { name = "uranium-238", amount_min = 1, amount_max = 1, probability = 0.9 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "radiation-shielding-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})
