local data_util = require("data_util")
local make_recipe = data_util.make_recipe


make_recipe({
  name = data_util.mod_prefix .. "radiating-space-coolant-normal",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 100},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 99},
  },
  energy_required = 20,
  subgroup = "space-cooling",
  category = "space-radiator",
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "radiating-space-coolant-normal"},
  enabled = false,
  always_show_made_in = true,
  order = "b-a",
})

make_recipe({
  name = data_util.mod_prefix .. "radiating-space-coolant-slow",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 200},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 199},
  },
  energy_required = 50,
  subgroup = "space-cooling",
  category = "space-radiator",
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "radiating-space-coolant-slow"},
  enabled = false,
  always_show_made_in = true,
  order = "b-b",
})

make_recipe({
  name = data_util.mod_prefix .. "radiating-space-coolant-veryslow",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 300},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 299},
  },
  energy_required = 80,
  subgroup = "space-cooling",
  category = "space-radiator",
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "radiating-space-coolant-veryslow"},
  enabled = false,
  always_show_made_in = true,
  order = "b-c",
})
