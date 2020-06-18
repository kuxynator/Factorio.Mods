local data_util = require("data_util")
local make_recipe = data_util.make_recipe

-- formating (junk)
make_recipe({
  name = data_util.mod_prefix .. "formatting-1",
  ingredients = {
    { name = data_util.mod_prefix .. "junk-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 0.7 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.29 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 1},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/junk.png", scale = 0.85, shift = {2, -4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "space-supercomputer-1"].icon, scale = 0.5, shift = {-12, 12}, icon_size = 32 },
  },
  energy_required = 1.5,
  subgroup = "data-generic",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "formatting-2",
  ingredients = {
    { name = data_util.mod_prefix .. "junk-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 0.8 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.19 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 1},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/junk.png", scale = 0.85, shift = {2, -4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "space-supercomputer-2"].icon, scale = 0.5, shift = {-12, 12}, icon_size = 32 },
  },
  energy_required = 4,
  subgroup = "data-generic",
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "formatting-3",
  ingredients = {
    { name = data_util.mod_prefix .. "junk-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 0.9 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.09 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 1},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/junk.png", scale = 0.85, shift = {2, -4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "space-supercomputer-3"].icon, scale = 0.5, shift = {-12, 12}, icon_size = 32 },
  },
  energy_required = 10,
  subgroup = "data-generic",
  category = "space-supercomputing-3",
  always_show_made_in = true,
})


-- simulation
make_recipe({
  name = data_util.mod_prefix .. "simulation-a",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 36 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 2 },
    { name = data_util.mod_prefix .. "empty-data", amount = 34 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4, shift = {0, -12}, icon_size = 32 },
  },
  energy_required = 30,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim1-a",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-s",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 36 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 2 },
    { name = data_util.mod_prefix .. "empty-data", amount = 34 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4, shift = {0, -12}, icon_size = 32 },
  },
  energy_required = 30,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim1-b",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-b",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 36 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 2 },
    { name = data_util.mod_prefix .. "empty-data", amount = 34 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4, shift = {0, -12}, icon_size = 32 },
  },
  energy_required = 30,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim1-c",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-m",
  ingredients = {
    { name = data_util.mod_prefix .. "material-insight", amount = 36 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 2 },
    { name = data_util.mod_prefix .. "empty-data", amount = 34 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4, shift = {0, -12}, icon_size = 32 },
  },
  energy_required = 30,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim1-d",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-as",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 18 },
    { name = data_util.mod_prefix .. "energy-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 3 },
    { name = data_util.mod_prefix .. "empty-data", amount = 33 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4, shift = {-10, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4, shift = {10, -12}, icon_size = 32 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-a",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-ab",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 18 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 3 },
    { name = data_util.mod_prefix .. "empty-data", amount = 33 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4, shift = {-10, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4, shift = {10, -12}, icon_size = 32 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-b",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-am",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 18 },
    { name = data_util.mod_prefix .. "material-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 3 },
    { name = data_util.mod_prefix .. "empty-data", amount = 33 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4, shift = {-10, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4, shift = {10, -12}, icon_size = 32 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-c",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-sb",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 18 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 3 },
    { name = data_util.mod_prefix .. "empty-data", amount = 33 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4, shift = {-10, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4, shift = {10, -12}, icon_size = 32 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-d",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-sm",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 18 },
    { name = data_util.mod_prefix .. "material-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 3 },
    { name = data_util.mod_prefix .. "empty-data", amount = 33 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4, shift = {-10, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4, shift = {10, -12}, icon_size = 32 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-e",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-bm",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 18 },
    { name = data_util.mod_prefix .. "material-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 3 },
    { name = data_util.mod_prefix .. "empty-data", amount = 33 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4, shift = {-10, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4, shift = {10, -12}, icon_size = 32 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-f",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-asb",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 12 },
    { name = data_util.mod_prefix .. "energy-insight", amount = 12 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 4 },
    { name = data_util.mod_prefix .. "empty-data", amount = 32 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4, shift = {-10, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4, shift = {0, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4, shift = {10, -12}, icon_size = 32 },
  },
  energy_required = 90,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim3-a",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-asm",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 12 },
    { name = data_util.mod_prefix .. "energy-insight", amount = 12 },
    { name = data_util.mod_prefix .. "material-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 4 },
    { name = data_util.mod_prefix .. "empty-data", amount = 32 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4, shift = {-10, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4, shift = {0, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4, shift = {10, -12}, icon_size = 32 },
  },
  energy_required = 90,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim3-b",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-abm",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 12 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 12 },
    { name = data_util.mod_prefix .. "material-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 4 },
    { name = data_util.mod_prefix .. "empty-data", amount = 32 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4, shift = {-10, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4, shift = {0, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4, shift = {10, -12}, icon_size = 32 },
  },
  energy_required = 90,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim3-c",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-sbm",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 12 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 12 },
    { name = data_util.mod_prefix .. "material-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 4 },
    { name = data_util.mod_prefix .. "empty-data", amount = 32 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4, shift = {-10, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4, shift = {0, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4, shift = {10, -12}, icon_size = 32 },
  },
  energy_required = 90,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim3-d",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "simulation-asbm",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 9 },
    { name = data_util.mod_prefix .. "energy-insight", amount = 9 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 9 },
    { name = data_util.mod_prefix .. "material-insight", amount = 9 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 5 },
    { name = data_util.mod_prefix .. "empty-data", amount = 31 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4, shift = {-15, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4, shift = {-5, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4, shift = {5, -12}, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4, shift = {15, -12}, icon_size = 32 },
  },
  energy_required = 120,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim4-a",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "astronomic-insight-1",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 1 },
    { name = data_util.mod_prefix .. "empty-data", amount = 4 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-catalogue-1"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 10,
  subgroup = "data-catalogue-astronomic",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "energy-insight-1",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 1 },
    { name = data_util.mod_prefix .. "empty-data", amount = 4 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-catalogue-1"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 10,
  subgroup = "data-catalogue-energy",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "biological-insight-1",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 1 },
    { name = data_util.mod_prefix .. "empty-data", amount = 4 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-catalogue-1"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 10,
  subgroup = "data-catalogue-biological",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "material-insight-1",
  ingredients = {
    { name = data_util.mod_prefix .. "material-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-insight", amount = 1 },
    { name = data_util.mod_prefix .. "empty-data", amount = 4 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-catalogue-1"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 10,
  subgroup = "data-catalogue-material",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "astronomic-insight-2",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 3 },
    { name = data_util.mod_prefix .. "empty-data", amount = 6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-catalogue-2"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 20,
  subgroup = "data-catalogue-astronomic",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "energy-insight-2",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 3 },
    { name = data_util.mod_prefix .. "empty-data", amount = 6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-catalogue-2"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 20,
  subgroup = "data-catalogue-energy",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "biological-insight-2",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 3 },
    { name = data_util.mod_prefix .. "empty-data", amount = 6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-catalogue-2"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 20,
  subgroup = "data-catalogue-biological",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "material-insight-2",
  ingredients = {
    { name = data_util.mod_prefix .. "material-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-insight", amount = 3 },
    { name = data_util.mod_prefix .. "empty-data", amount = 6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-catalogue-2"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 20,
  subgroup = "data-catalogue-material",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "astronomic-insight-3",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 8 },
    { name = data_util.mod_prefix .. "empty-data", amount = 5 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-catalogue-3"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 30,
  subgroup = "data-catalogue-astronomic",
  allow_as_intermediate = false,
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "energy-insight-3",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 8 },
    { name = data_util.mod_prefix .. "empty-data", amount = 5 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-catalogue-3"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 30,
  subgroup = "data-catalogue-energy",
  allow_as_intermediate = false,
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "biological-insight-3",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 8 },
    { name = data_util.mod_prefix .. "empty-data", amount = 5 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-catalogue-3"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 30,
  subgroup = "data-catalogue-biological",
  allow_as_intermediate = false,
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "material-insight-3",
  ingredients = {
    { name = data_util.mod_prefix .. "material-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-insight", amount = 8 },
    { name = data_util.mod_prefix .. "empty-data", amount = 5 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-catalogue-3"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 30,
  subgroup = "data-catalogue-material",
  allow_as_intermediate = false,
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "astronomic-insight-4",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 8 },
    { name = data_util.mod_prefix .. "astronomic-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 25 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-catalogue-4"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 40,
  subgroup = "data-catalogue-astronomic",
  allow_as_intermediate = false,
  category = "space-supercomputing-3",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "energy-insight-4",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 8 },
    { name = data_util.mod_prefix .. "energy-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 25 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-catalogue-4"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 40,
  subgroup = "data-catalogue-energy",
  allow_as_intermediate = false,
  category = "space-supercomputing-3",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "biological-insight-4",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 8 },
    { name = data_util.mod_prefix .. "biological-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 25 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-catalogue-4"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 40,
  subgroup = "data-catalogue-biological",
  allow_as_intermediate = false,
  category = "space-supercomputing-3",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "material-insight-4",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 8 },
    { name = data_util.mod_prefix .. "material-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-insight", amount = 25 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-insight.png", scale = 1, icon_size = 32 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-catalogue-4"].icon, scale = 0.7, shift = {-10, 8}, icon_size = 32 },
  },
  energy_required = 40,
  subgroup = "data-catalogue-material",
  allow_as_intermediate = false,
  category = "space-supercomputing-3",
  always_show_made_in = true,
})


make_recipe({
  name = data_util.mod_prefix .. "astronomic-catalogue-1",
  ingredients = {
    { name = data_util.mod_prefix .. "astrometric-data", amount = 1 },
    { name = data_util.mod_prefix .. "visible-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "infrared-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "uv-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "gravimetric-observation-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "astronomic-catalogue-1",
  subgroup = "data-catalogue-astronomic",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-catalogue-1.png",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "astronomic-catalogue-2",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "microwave-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "xray-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "gravity-wave-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "gravimetric-test-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "astronomic-catalogue-2",
  subgroup = "data-catalogue-astronomic",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-catalogue-2.png",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "astronomic-catalogue-3",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "radio-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "gammaray-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "darkmatter-data", amount = 1 },
    { name = data_util.mod_prefix .. "negative-pressure-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "astronomic-catalogue-3",
  subgroup = "data-catalogue-astronomic",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-catalogue-3.png",
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "astronomic-catalogue-4",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-3", amount = 1 },
    { name = data_util.mod_prefix .. "dark-energy-data", amount = 1 },
    { name = data_util.mod_prefix .. "micro-black-hole-data", amount = 1 },
    { name = data_util.mod_prefix .. "timespace-anomaly-data", amount = 1 },
    { name = data_util.mod_prefix .. "zero-point-energy-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "astronomic-catalogue-4",
  subgroup = "data-catalogue-astronomic",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-catalogue-4.png",
  category = "space-supercomputing-3",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "energy-catalogue-1",
  ingredients = {
    { name = data_util.mod_prefix .. "polarisation-data", amount = 1 },
    { name = data_util.mod_prefix .. "quantum-phenomenon-data", amount = 1 },
    { name = data_util.mod_prefix .. "ion-spectrometry-data", amount = 1 },
    { name = data_util.mod_prefix .. "radiation-data", amount = 1 },
    { name = data_util.mod_prefix .. "plasma-electrodynamics-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "energy-catalogue-1",
  subgroup = "data-catalogue-energy",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-catalogue-1.png",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "energy-catalogue-2",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "atomic-data", amount = 1 },
    { name = data_util.mod_prefix .. "subatomic-data", amount = 1 },
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1 },
    { name = data_util.mod_prefix .. "quark-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "energy-catalogue-2",
  subgroup = "data-catalogue-energy",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-catalogue-2.png",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "energy-catalogue-3",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "entanglement-data", amount = 1 },
    { name = data_util.mod_prefix .. "forcefield-data", amount = 1 },
    { name = data_util.mod_prefix .. "gammaray-test-data", amount = 1 },
    { name = data_util.mod_prefix .. "lepton-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "energy-catalogue-3",
  subgroup = "data-catalogue-energy",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-catalogue-3.png",
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "energy-catalogue-4",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-catalogue-3", amount = 1 },
    { name = data_util.mod_prefix .. "boson-data", amount = 1 },
    { name = data_util.mod_prefix .. "exotic-fission-data", amount = 1 },
    { name = data_util.mod_prefix .. "exotic-singularity-data", amount = 1 },
    { name = data_util.mod_prefix .. "magnetic-monopole-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "energy-catalogue-4",
  subgroup = "data-catalogue-energy",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-catalogue-4.png",
  category = "space-supercomputing-3",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "biological-catalogue-1",
  ingredients = {
    { name = data_util.mod_prefix .. "bio-combustion-data", amount = 1 },
    { name = data_util.mod_prefix .. "bio-spectral-data", amount = 1 },
    { name = data_util.mod_prefix .. "biomechanical-data", amount = 1 },
    { name = data_util.mod_prefix .. "biochemical-data", amount = 1 },
    { name = data_util.mod_prefix .. "genetic-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biological-catalogue-1",
  subgroup = "data-catalogue-biological",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-catalogue-1.png",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "biological-catalogue-2",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "bio-combustion-resistance-data", amount = 1 },
    { name = data_util.mod_prefix .. "experimental-genetic-data", amount = 1 },
    { name = data_util.mod_prefix .. "experimental-biochemical-data", amount = 1 },
    { name = data_util.mod_prefix .. "biomechanical-resistance-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "biological-catalogue-2",
  subgroup = "data-catalogue-biological",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-catalogue-2.png",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "biological-catalogue-3",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "bioelectrics-data", amount = 1 },
    { name = data_util.mod_prefix .. "cryogenics-data", amount = 1 },
    { name = data_util.mod_prefix .. "decompression-data", amount = 1 },
    { name = data_util.mod_prefix .. "radiation-exposure-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "biological-catalogue-3",
  subgroup = "data-catalogue-biological",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-catalogue-3.png",
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "biological-catalogue-4",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-catalogue-3", amount = 1 },
    { name = data_util.mod_prefix .. "comparative-genetic-data", amount = 1 },
    { name = data_util.mod_prefix .. "decompression-resistance-data", amount = 1 },
    { name = data_util.mod_prefix .. "neural-anomaly-data", amount = 1 },
    { name = data_util.mod_prefix .. "radiation-exposure-resistance-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "biological-catalogue-4",
  subgroup = "data-catalogue-biological",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-catalogue-4.png",
  category = "space-supercomputing-3",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "material-catalogue-1",
  ingredients = {
    { name = data_util.mod_prefix .. "cold-thermodynamics-data", amount = 1 },
    { name = data_util.mod_prefix .. "hot-thermodynamics-data", amount = 1 },
    { name = data_util.mod_prefix .. "tensile-strength-data", amount = 1 },
    { name = data_util.mod_prefix .. "compressive-strength-data", amount = 1 },
    { name = data_util.mod_prefix .. "plasma-thermodynamics-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "material-catalogue-1",
  subgroup = "data-catalogue-material",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-catalogue-1.png",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "material-catalogue-2",
  ingredients = {
    { name = data_util.mod_prefix .. "material-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "material-decay-data", amount = 1 },
    { name = data_util.mod_prefix .. "material-spectral-data", amount = 1 },
    { name = data_util.mod_prefix .. "conductivity-data", amount = 1 },
    { name = data_util.mod_prefix .. "pressure-containment-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "material-catalogue-2",
  subgroup = "data-catalogue-material",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-catalogue-2.png",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "material-catalogue-3",
  ingredients = {
    { name = data_util.mod_prefix .. "material-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "experimental-material-decay-data", amount = 1 },
    { name = data_util.mod_prefix .. "experimental-material-spectral-data", amount = 1 },
    { name = data_util.mod_prefix .. "radiation-shielding-data", amount = 1 },
    { name = data_util.mod_prefix .. "superconductivity-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "material-catalogue-3",
  subgroup = "data-catalogue-material",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-catalogue-3.png",
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "material-catalogue-4",
  ingredients = {
    { name = data_util.mod_prefix .. "material-catalogue-3", amount = 1 },
    { name = data_util.mod_prefix .. "nano-cold-thermodynamics-data", amount = 1 },
    { name = data_util.mod_prefix .. "nano-hot-thermodynamics-data", amount = 1 },
    { name = data_util.mod_prefix .. "nano-compressive-strength-data", amount = 1 },
    { name = data_util.mod_prefix .. "nano-tensile-strength-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "material-catalogue-4",
  subgroup = "data-catalogue-material",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-catalogue-4.png",
  category = "space-supercomputing-3",
  always_show_made_in = true,
})
