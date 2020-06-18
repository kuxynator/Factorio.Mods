-- NOTE: fluids x100

local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "scrap-recycling",
  ingredients = {
    { data_util.mod_prefix .. "scrap", 1},
  },
  results = {
    { name = "iron-ore", amount_min = 1, amount_max = 1, probability = 0.1},
    { name = "copper-ore", amount_min = 1, amount_max = 1, probability = 0.1},
    { name = "stone", amount_min = 1, amount_max = 1, probability = 0.1},
    { type = "fluid", name = "heavy-oil", amount_min = 1, amount_max = 1, probability = 0.1},
  },
  category = "space-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    data.raw.item[data_util.mod_prefix .. "scrap"].icon,
    {
      data.raw.item["iron-ore"].icon,
      data.raw.item["copper-ore"].icon,
      data.raw.item["stone"].icon,
    }
  ),
  energy_required = 2,
  allow_as_intermediate = false,
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "broken-data-scrapping",
  ingredients = {
    { data_util.mod_prefix .. "broken-data", 1}
  },
  results = {
    { data_util.mod_prefix .. "scrap", 5},
  },
  icon = "__space-exploration-graphics__/graphics/icons/scrap.png",
  category = "space-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    data.raw.item[data_util.mod_prefix .. "broken-data"].icon,
    data.raw.item[data_util.mod_prefix .. "scrap"].icon
  ),
  energy_required = 5,
  allow_as_intermediate = false,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "broken-data-scrapping"},
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "empty-barrel-scrapping",
  ingredients = {
    { "empty-barrel", 1}
  },
  results = {
    { data_util.mod_prefix .. "scrap", 2},
  },
  icon = "__space-exploration-graphics__/graphics/icons/scrap.png",
  category = "space-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    data.raw.item["empty-barrel"].icon,
    data.raw.item[data_util.mod_prefix .. "scrap"].icon
  ),
  energy_required = 2,
  allow_as_intermediate = false,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "empty-barrel-scrapping"},
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "empty-barrel-reprocessing",
  ingredients = {
    { "empty-barrel", 1}
  },
  results = {
    { "steel-plate", 1},
  },
  icon = "__space-exploration-graphics__/graphics/icons/scrap.png",
  category = "space-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    data.raw.item["empty-barrel"].icon,
    data.raw.item["steel-plate"].icon
  ),
  energy_required = 2,
  allow_as_intermediate = false,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "empty-barrel-reprocessing"},
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "space-capsule-scrapping",
  ingredients = {
    { data_util.mod_prefix .. "space-capsule", 1}
  },
  results = {
    { "solar-panel", 45},
    { "accumulator", 45},
    { data_util.mod_prefix .. "heat-shielding", 90},
    { "low-density-structure", 90},
    { "rocket-control-unit", 90},
    { data_util.mod_prefix .. "scrap", 1000},
  },
  icon = "__space-exploration-graphics__/graphics/icons/scrap.png",
  category = "space-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    data.raw.item[data_util.mod_prefix .. "space-capsule"].icon,
    data.raw.item[data_util.mod_prefix .. "scrap"].icon
  ),
  energy_required = 2,
  allow_as_intermediate = false,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "space-capsule-scrapping"},
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "cargo-pod-scrapping",
  ingredients = {
    { data_util.mod_prefix .. "cargo-rocket-cargo-pod", 1}
  },
  results = {
    { data_util.mod_prefix .. "scrap", 100},
  },
  icon = "__space-exploration-graphics__/graphics/icons/scrap.png",
  category = "space-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    data.raw.item[data_util.mod_prefix .. "cargo-rocket-cargo-pod"].icon,
    data.raw.item[data_util.mod_prefix .. "scrap"].icon
  ),
  energy_required = 2,
  allow_as_intermediate = false,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "cargo-pod-scrapping"},
  enabled = false,
  always_show_made_in = true,
})
