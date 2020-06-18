local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "neural-gel",
  ingredients = {
    { name = data_util.mod_prefix .. "specimen", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 10 }
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10 },
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "neural-gel",
  category = "space-growth",
  subgroup = "space-bioculture",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "neural-gel-2",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 10 },
    { name = data_util.mod_prefix .. "bioelectrics-data", amount = 1 },

  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 10 },
    { data_util.mod_prefix .. "junk-data", 2 },
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10 },
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "neural-gel-2",
  category = "space-growth",
  subgroup = "space-bioculture",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "specimen",
  ingredients = {
    { name = data_util.mod_prefix .. "bioculture", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 100 },
  },
  results = {
    { name = data_util.mod_prefix .. "specimen", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 40 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 40 },
  },
  energy_required = 100,
  main_product = data_util.mod_prefix .. "specimen",
  category = "space-growth",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "experimental-specimen",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-bioculture", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 100 },
  },
  results = {
    { name = data_util.mod_prefix .. "experimental-specimen", amount_min = 2, amount_max = 8, probability = 1 },
    { name = data_util.mod_prefix .. "specimen", amount_min = 2, amount_max = 8, probability = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 40 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 40 },
  },
  energy_required = 100,
  main_product = data_util.mod_prefix .. "experimental-specimen",
  category = "space-growth",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "specimen-fish",
  ingredients = {
    { name = data_util.mod_prefix .. "bioculture", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 100 },
  },
  results = {
    { name = "raw-fish", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 50 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 50 },
  },
  energy_required = 100,
  category = "space-growth",
  subgroup = "space-bioculture",
  icons = {
    { icon = "__space-exploration-graphics__/graphics/blank.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "bioculture"].icon, scale = 0.75, shift = {8, -8}, icon_size = 32 },
    { icon = data.raw.capsule["raw-fish"].icon, scale = 0.75, shift = {-8, 8}, icon_size = 32 },
  },
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "specimen-wood",
  ingredients = {
    { name = data_util.mod_prefix .. "bioculture", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 100 },
  },
  results = {
    { name = "wood", amount = 100 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 250 },
  },
  energy_required = 100,
  category = "space-growth",
  subgroup = "space-bioculture",
  icons = {
    { icon = "__space-exploration-graphics__/graphics/blank.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "bioculture"].icon, scale = 0.75, shift = {8, -8}, icon_size = 32 },
    { icon = data.raw.item["wood"].icon, scale = 0.75, shift = {-8, 8}, icon_size = 32 },
  },
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "bio-methane-to-crude-oil",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 100 },
    { type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 1000 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 80 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10 },
    { type = "fluid", name = "crude-oil", amount = 1000 },
  },
  energy_required = 10,
  category = "space-growth",
  subgroup = "space-bioculture",
  icon = data.raw.fluid["crude-oil"].icon,
  icon_size = data.raw.fluid["crude-oil"].icon_size,
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})
