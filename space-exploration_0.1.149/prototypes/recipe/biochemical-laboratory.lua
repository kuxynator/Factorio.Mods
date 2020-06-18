local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "bio-sludge-from-fish",
  ingredients = {
    { name = "raw-fish", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 7 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 1, icon_size = 32  },
    { icon = data.raw.capsule["raw-fish"].icon, scale = 0.75, icon_size = 32  },
  },
  energy_required = 5,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge-from-fish"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "space-bioculture",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "bio-sludge-from-wood",
  ingredients = {
    { name = "wood", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 1, icon_size = 32  },
    { icon = data.raw.item["wood"].icon, scale = 0.75, icon_size = 32  },
  },
  energy_required = 10,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge-from-wood"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "space-bioculture",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "bio-sludge",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 5 },
    { name = data_util.mod_prefix .. "specimen", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 25 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 5 },
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 1, icon_size = 32  },
    { icon = data.raw.item[data_util.mod_prefix .. "specimen"].icon, scale = 0.75, icon_size = 32  },
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "bio-sludge",
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "space-bioculture",
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "bio-sludge-crude-oil",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 5 },
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 20 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 5 },
    { type = "fluid", name = "crude-oil", amount = 100 },
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 1, icon_size = 32  },
    { icon = data.raw.fluid["crude-oil"].icon, scale = 0.75, icon_size = 32  },
  },
  energy_required = 10,
  category = "space-biochemical",
  enabled = false,
  subgroup = "space-bioculture",
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "biochemical-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = data_util.mod_prefix .. "specimen", amount = 1},
    { type="fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biochemical-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 10 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biochemical-data",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "cryogenics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "cryogenics-data", amount_min = 1, amount_max = 1, probability = 0.9},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.09},
    { type="fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "cryogenics-data",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "experimental-biochemical-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { type="fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "experimental-biochemical-data", amount_min = 1, amount_max = 1, probability = 0.9},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.09},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 10 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "experimental-biochemical-data",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "nutrient-gel",
  ingredients = {
    { name = "coal", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 20},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 50},
  },
  energy_required = 5,
  category = "space-biochemical",
  subgroup = "space-bioculture",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "nutrient-gel-methane",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 20},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 50},
  },
  energy_required = 10,
  category = "space-biochemical",
  subgroup = "space-bioculture",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "nutrient-vat",
  ingredients = {
    { name = "iron-plate", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "nutrient-vat", amount = 1},
  },
  energy_required = 5,
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "plague-bomb",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 100},
    { name = data_util.mod_prefix .. "biological-catalogue-4", amount = 10},
    { type="fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 1000},
    { type="fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 1000},
  },
  results = {
    { name = data_util.mod_prefix .. "plague-bomb", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 2000 },
  },
  energy_required = 60,
  main_product = data_util.mod_prefix .. "plague-bomb",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})


make_recipe({
  name = data_util.mod_prefix .. "melting-water-ice",
  ingredients = {
    { name = data_util.mod_prefix .. "water-ice", amount = 1},
  },
  results = {
    { type = "fluid", name = "water", amount = 100},
  },
  energy_required = 0.25,
  subgroup = "space-fluids",
  category = "chemistry",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "melting-methane-ice",
  ingredients = {
    { name = data_util.mod_prefix .. "methane-ice", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 10},
  },
  energy_required = 0.25,
  subgroup = "space-fluids",
  category = "chemistry",
  always_show_made_in = true,
})
