local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "bio-spectral-data",
  ingredients = {
    { name = data_util.mod_prefix .. "specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "bio-spectral-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "bio-spectral-data",
  category = "space-spectrometry",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "experimental-material-spectral-data",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-material", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "experimental-material-spectral-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "experimental-material-spectral-data",
  category = "space-spectrometry",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "ion-spectrometry-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 40},
  },
  results = {
    { name = data_util.mod_prefix .. "ion-spectrometry-data", amount = 1},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "ion-spectrometry-data",
  category = "space-spectrometry",
  enabled = false,
  always_show_made_in = true,
})


make_recipe({
  name = data_util.mod_prefix .. "material-spectral-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "material-spectral-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "material-spectral-data",
  category = "space-spectrometry",
  enabled = false,
  always_show_made_in = true,
})
