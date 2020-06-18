local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "magnetic-canister",
  ingredients = {
    { data_util.mod_prefix .. "canister", 1},
    { "battery", 1},
    { data_util.mod_prefix .. "superconductive-cable", 1},
  },
  results = {
    { data_util.mod_prefix .. "magnetic-canister", 1},
  },
  energy_required = 10,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "bioelectrics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "bioelectrics-data", amount_min = 1, amount_max = 1, probability = 0.9},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.09},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "bioelectrics-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "conductivity-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = "copper-plate", amount = 3},
    { name = "electronic-circuit", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "conductivity-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "conductivity-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "superconductivity-data",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-superconductor", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "superconductivity-data", amount_min = 1, amount_max = 1, probability = 0.7},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.29},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "superconductivity-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "superconductive-cable",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-superconductor", amount = 1},
    { name = data_util.mod_prefix .. "superconductivity-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "superconductive-cable", amount = 1},
    { name = data_util.mod_prefix .. "junk-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "superconductive-cable",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "forcefield-data",
  ingredients = {
    { name = data_util.mod_prefix .. "polarisation-data", amount = 1},
    { name = data_util.mod_prefix .. "plasma-electrodynamics-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "forcefield-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 1},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "forcefield-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "neural-anomaly-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = "processing-unit", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 40},
  },
  results = {
    { name = data_util.mod_prefix .. "neural-anomaly-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { name = "processing-unit", amount_min = 1, amount_max = 1, probability = 0.49},
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 30},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "neural-anomaly-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "electromagnetic-field-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "electromagnetic-field-data", amount_min = 1, amount_max = 1, probability = 0.95},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.04},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "electromagnetic-field-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "plasma-electrodynamics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "plasma-electrodynamics-data", amount_min = 1, amount_max = 1, probability = 0.90},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.09},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "plasma-electrodynamics-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

data_util.make_recipe({
  name = "railgun",
  ingredients = {
    {"steel-plate", 10},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
    { "copper-cable", 1000},
  },
  results = {
    { "railgun", 1},
  },
  energy_required = 30,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

data_util.make_recipe({
  name = "railgun-dart",
  ingredients = {
    { "steel-plate", 10},
    { "battery", 10},
  },
  results = {
    { "railgun-dart", 1},
  },
  energy_required = 10,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

data_util.make_recipe({
  name = data_util.mod_prefix .. "tesla-gun",
  ingredients = {
    {"steel-plate", 10},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
    { data_util.mod_prefix .. "superconductive-cable", 10},
  },
  results = {
    { data_util.mod_prefix .. "tesla-gun", 1},
  },
  energy_required = 60,
  category = "space-electromagnetics",
  enabled = false,
})
data_util.make_recipe({
  name = data_util.mod_prefix .. "tesla-ammo",
  ingredients = {
    { "battery", 10},
  },
  results = {
    { data_util.mod_prefix .. "tesla-ammo", 1},
  },
  energy_required = 10,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})
