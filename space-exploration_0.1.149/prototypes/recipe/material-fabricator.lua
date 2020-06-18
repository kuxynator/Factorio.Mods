local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "experimental-material",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "experimental-material", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 50},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "experimental-material",
  category = "space-materialisation",
  subgroup = "space-components",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "matter-fusion-dirty",
  ingredients = {
    { data_util.mod_prefix .. "fusion-test-data", 1},
    { data_util.mod_prefix .. "experimental-material", 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 8},
    { data_util.mod_prefix .. "junk-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 50},
  },
  energy_required = 10,
  category = "space-materialisation",
  subgroup = "space-components",
  icons = data_util.transition_icons(
    data.raw.item[data_util.mod_prefix .. "experimental-material"].icon,
    data.raw.item[data_util.mod_prefix .. "contaminated-scrap"].icon
  ),
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "matter-fusion-iron",
  ingredients = {
    { data_util.mod_prefix .. "fusion-test-data", 1},
    { data_util.mod_prefix .. "experimental-material", 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10},
  },
  results = {
    { name = "iron-ore", amount = 4},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 4},
    { data_util.mod_prefix .. "junk-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 50},
  },
  energy_required = 10,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    data.raw.item[data_util.mod_prefix .. "experimental-material"].icon,
    data.raw.item["iron-ore"].icon
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "matter-fusion-copper",
  ingredients = {
    { data_util.mod_prefix .. "fusion-test-data", 1},
    { data_util.mod_prefix .. "experimental-material", 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10},
  },
  results = {
    { name = "copper-ore", amount = 4},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 4},
    { data_util.mod_prefix .. "junk-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 50},
  },
  energy_required = 10,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    data.raw.item[data_util.mod_prefix .. "experimental-material"].icon,
    data.raw.item["copper-ore"].icon
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "matter-fusion-stone",
  ingredients = {
    { data_util.mod_prefix .. "fusion-test-data", 1},
    { data_util.mod_prefix .. "experimental-material", 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10},
  },
  results = {
    { name = "stone", amount = 4},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 4},
    { data_util.mod_prefix .. "junk-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 50},
  },
  energy_required = 10,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    data.raw.item[data_util.mod_prefix .. "experimental-material"].icon,
    data.raw.item["stone"].icon
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "matter-fusion-uranium",
  ingredients = {
    { data_util.mod_prefix .. "fusion-test-data", 1},
    { data_util.mod_prefix .. "experimental-material", 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10},
  },
  results = {
    { name = "uranium-ore", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 7},
    { data_util.mod_prefix .. "junk-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 50},
  },
  energy_required = 10,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    data.raw.item[data_util.mod_prefix .. "experimental-material"].icon,
    data.raw.item["uranium-ore"].icon
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})


make_recipe({
  name = data_util.mod_prefix .. "nano-material",
  ingredients = {
    { data_util.mod_prefix .. "fusion-test-data", 1},
    { data_util.mod_prefix .. "experimental-material", 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "nano-material", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 4},
    { data_util.mod_prefix .. "junk-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 50},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "nano-material",
  category = "space-materialisation",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "experimental-superconductor",
  ingredients = {
    { data_util.mod_prefix .. "fusion-test-data", 1},
    { data_util.mod_prefix .. "experimental-material", 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "experimental-superconductor", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 4},
    { data_util.mod_prefix .. "junk-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 50},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "experimental-superconductor",
  category = "space-materialisation",
  enabled = false,
  always_show_made_in = true,
})
