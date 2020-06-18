local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "compressive-strength-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1},
    { name = "concrete", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "compressive-strength-data", amount = 1},
    { name = data_util.mod_prefix .. "scrap", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "compressive-strength-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "tensile-strength-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1},
    { name = "steel-plate", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "tensile-strength-data", amount = 1},
    { name = data_util.mod_prefix .. "scrap", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "tensile-strength-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "nano-compressive-strength-data",
  ingredients = {
    { name = data_util.mod_prefix .. "nano-material", amount = 1},
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1},
    { name = "concrete", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "nano-compressive-strength-data", amount = 1},
    { name = data_util.mod_prefix .. "scrap", amount = 4},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "nano-compressive-strength-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "nano-tensile-strength-data",
  ingredients = {
    { name = data_util.mod_prefix .. "nano-material", amount = 1},
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1},
    { name = "steel-plate", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "nano-tensile-strength-data", amount = 1},
    { name = data_util.mod_prefix .. "scrap", amount = 6},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "nano-tensile-strength-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "biomechanical-data",
  ingredients = {
    { name = data_util.mod_prefix .. "specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "biomechanical-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biomechanical-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "biomechanical-resistance-data",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { name = data_util.mod_prefix .. "biomechanical-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "biomechanical-resistance-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biomechanical-resistance-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})


make_recipe({
  name = data_util.mod_prefix .. "decompression-data",
  ingredients = {
    { name = data_util.mod_prefix .. "specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "decompression-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount_min = 1, amount_max = 10, probability = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "decompression-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "decompression-resistance-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "decompression-resistance-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount_min = 1, amount_max = 10, probability = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "decompression-resistance-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})
