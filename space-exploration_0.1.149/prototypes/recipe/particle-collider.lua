local data_util = require("data_util")
local make_recipe = data_util.make_recipe

-- collider
make_recipe({
  name = data_util.mod_prefix .. "antimatter-canister",
  ingredients = {
    { data_util.mod_prefix .. "magnetic-canister", 1},
    { type = "fluid", name = data_util.mod_prefix .. "antimatter-stream", amount=500},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 100},
  },
  results = {
    { name = data_util.mod_prefix .. "antimatter-canister", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 100},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "antimatter-canister",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "antimatter-stream",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount=100},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 100},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "antimatter-stream", amount = 50}, -- 50 * 20MJ = 1000 MJ = 1GJ
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 100},
  },
  energy_required = 400, -- 400 * 5MW = 2000MJ
  main_product = data_util.mod_prefix .. "antimatter-stream",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "atomic-data",
  ingredients = {
    { data_util.mod_prefix .. "material-testing-pack", 1},
    { data_util.mod_prefix .. "empty-data", 4},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount=100},
  },
  results = {
    { name = data_util.mod_prefix .. "atomic-data", amount = 4},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 8},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "atomic-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "boson-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 15},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "boson-data", amount_min = 1, amount_max = 1, probability = 0.2},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.79},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "boson-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "entanglement-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "entanglement-data", amount_min = 1, amount_max = 1, probability = 0.3},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.69},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "entanglement-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "exotic-singularity-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "exotic-singularity-data", amount_min = 1, amount_max = 1, probability = 0.1},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.89},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "exotic-singularity-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "lepton-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "lepton-data", amount_min = 1, amount_max = 1, probability = 0.4},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.59},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "lepton-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "magnetic-monopole-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "proton-stream", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "magnetic-monopole-data", amount_min = 1, amount_max = 1, probability = 0.1},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.89},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "magnetic-monopole-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "micro-black-hole-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "micro-black-hole-data", amount_min = 1, amount_max = 1, probability = 0.2},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.79},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "micro-black-hole-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "quark-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "proton-stream", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "quark-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "quark-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "subatomic-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "proton-stream", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "subatomic-data", amount_min = 1, amount_max = 1, probability = 0.6},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.39},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "subatomic-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "fusion-test-data",
  ingredients = {
    { name = data_util.mod_prefix .. "plasma-electrodynamics-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "proton-stream", amount = 50},
  },
  results = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1},
  },
  energy_required = 5,
  category = "space-collider",
  always_show_made_in = true,
})
