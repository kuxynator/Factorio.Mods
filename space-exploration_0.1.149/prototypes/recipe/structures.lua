local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({
  {
    type = "recipe",
    name = data_util.mod_prefix .. "fuel-refinery",
    result = data_util.mod_prefix .. "fuel-refinery",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "glass", 20 },
      { "steel-plate", 20 },
      { "stone-brick", 20 },
      { "pipe", 20 },
      { "iron-gear-wheel", 20 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "fluid-burner-generator",
    result = data_util.mod_prefix .. "fluid-burner-generator",
    enabled = false,
    energy_required = 5,
    ingredients = {
      { "steel-plate", 10 },
      { "copper-plate", 30 },
      { "pipe", 30 },
      { "iron-gear-wheel", 20 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "antimatter-reactor",
    result = data_util.mod_prefix .. "antimatter-reactor",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { data_util.mod_prefix .. "energy-catalogue-4", 5 },
      { data_util.mod_prefix .. "heat-shielding", 500 },
      { "low-density-structure", 500 },
      { "processing-unit", 500 },
      { data_util.mod_prefix .. "superconductive-cable", 500 }
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "meteor-point-defence",
    result = data_util.mod_prefix .. "meteor-point-defence",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "electronic-circuit", 40 },
      { "steel-plate", 40 },
      { "concrete", 40 },
      { "glass", 20 },
      { "iron-gear-wheel", 20 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "meteor-point-defence-ammo",
    result = data_util.mod_prefix .. "meteor-point-defence-ammo",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 8 },
      { "coal", 4 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "meteor-defence",
    result = data_util.mod_prefix .. "meteor-defence",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "processing-unit", 100 },
      { "copper-cable", 100 },
      { "steel-plate", 100 },
      { "concrete", 100 },
      { "glass", 50 },
      { "battery", 50 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "meteor-defence-ammo",
    result = data_util.mod_prefix .. "meteor-defence-ammo",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 10 },
      { "electronic-circuit", 10 },
      { "battery", 10 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-assembling-machine",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"assembling-machine-2", 1},
      {data_util.mod_prefix .. "heat-shielding", 4},
      {"low-density-structure", 4},
      {"electric-engine-unit", 4},
      {"processing-unit", 4},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-assembling-machine", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/assembling-machine.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-assembling-machine",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-astrometrics-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 40},
      {"electric-engine-unit", 8},
      {"advanced-circuit", 40},
      {"processing-unit", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-astrometrics-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/astrometrics-laboratory.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-astrometrics",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-biochemical-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"chemical-plant", 3},
      {"low-density-structure", 60},
      {"glass", 100},
      {"pump", 4},
      {"pipe", 100},
      {"electric-engine-unit", 6},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-biochemical-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/biochemical-laboratory.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-biochemical-laboratory",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-decontamination-facility",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"chemical-plant", 1},
      {"low-density-structure", 40},
      {"pipe", 40},
      {"electric-engine-unit", 6},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-decontamination-facility", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/decontamination-facility.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-decontamination-facility",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-electromagnetics-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 2},
      {"low-density-structure", 60},
      {"accumulator", 20},
      {"processing-unit", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-electromagnetics-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/electromagnetics-laboratory.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-electromagnetics-laboratory",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-genetics-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 80},
      {"glass", 80},
      {"electric-engine-unit", 20},
      {"processing-unit", 20},
      {data_util.mod_prefix .. "nutrient-vat", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-genetics-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/genetics-laboratory.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-genetics-laboratory",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-gravimetrics-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 40},
      {"electric-engine-unit", 8},
      {"advanced-circuit", 40},
      {"processing-unit", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-gravimetrics-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/gravimetrics-laboratory.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-gravimetrics-laboratory",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-growth-facility",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 40},
      {"pump", 4},
      {"pipe", 40},
      {"small-lamp", 100},
      {"glass", 400},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-growth-facility", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/growth-facility.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-growth-facility",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-hypercooler",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"storage-tank", 1},
      {"pump", 4},
      {"electric-engine-unit", 4},
      {"low-density-structure", 20},
      {"pipe", 100},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-hypercooler", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/hypercooler.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-hypercooler",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-laser-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 60},
      {"glass", 80},
      {"pipe", 40},
      {"accumulator", 20},
      {"processing-unit", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-laser-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/laser-laboratory.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-laser-laboratory",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-lifesupport-facility",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"assembling-machine-2", 1},
      {"low-density-structure", 40},
      {"pump", 1},
      {"pipe", 40},
      {"electric-engine-unit", 6},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-lifesupport-facility", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/lifesupport-facility.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-lifesupport-facility",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-manufactory",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 4},
      {"fast-inserter", 8},
      {data_util.mod_prefix .. "heat-shielding", 8},
      {"electric-engine-unit", 32},
      {"low-density-structure", 80},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-manufactory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/manufactory.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-manufactory",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-mechanical-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 4},
      {"low-density-structure", 60},
      {"steel-plate", 100},
      {"concrete", 100},
      {"electric-engine-unit", 40},
      {"gun-turret", 10},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-mechanical-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/mechanical-laboratory.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-mechanical-laboratory",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-particle-accelerator",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 60},
      {"laser-turret", 6},
      {"accumulator", 20},
      {"processing-unit", 20},
      {"pipe", 100},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-particle-accelerator", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/particle-accelerator.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-particle-accelerator",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-particle-collider",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 60},
      {"laser-turret", 6},
      {"accumulator", 20},
      {data_util.mod_prefix .. "heat-shielding", 20},
      {"pipe", 100},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-particle-collider", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/particle-collider.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-particle-collider",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-plasma-generator",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"chemical-plant", 1},
      {"low-density-structure", 60},
      {"electric-furnace", 4},
      {data_util.mod_prefix .. "heat-shielding", 20},
      {"pipe", 100},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-plasma-generator", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/plasma-generator.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-plasma-generator",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-radiation-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"uranium-fuel-cell", 4},
      {"chemical-plant", 4},
      {"low-density-structure", 60},
      {data_util.mod_prefix .. "heat-shielding", 20},
      {"steel-plate", 100},
      {"glass", 80},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-radiation-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/radiation-laboratory.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-radiation-laboratory",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-radiator",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"pump", 4},
      {"electric-engine-unit", 4},
      {"steel-plate", 20},
      {"pipe", 40},
      {"copper-cable", 200},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-radiator", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/radiator.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-radiator",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-recycling-facility",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"steel-plate", 20},
      {"advanced-circuit", 10},
      {"electric-engine-unit", 10},
      {"concrete", 20},
      {data_util.mod_prefix .. "heat-shielding", 10},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-recycling-facility", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/recycling-facility.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-recycling-facility",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-spectrometry-facility",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 60},
      {"laser-turret", 6},
      {"accumulator", 20},
      {"processing-unit", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-spectrometry-facility", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/spectrometry-facility.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-spectrometry-facility",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-material-fabricator",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"chemical-plant", 1},
      {"electric-furnace", 1},
      {"low-density-structure", 60},
      {"laser-turret", 6},
      {"accumulator", 20},
      {data_util.mod_prefix .. "heat-shielding", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-material-fabricator", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/material-fabricator.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-material-fabricator",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-supercomputer-1",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 40},
      {"processing-unit", 500},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-supercomputer-1", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-1.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-supercomputer-1",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-supercomputer-2",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-supercomputer-1", 1},
      {"processing-unit", 1000},
      {data_util.mod_prefix .. "quantum-phenomenon-data", 50},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-supercomputer-2", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-2.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-supercomputer-2",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-supercomputer-3",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-supercomputer-2", 1},
      {"processing-unit", 5000},
      {data_util.mod_prefix .. "superconductive-cable", 100},
      {type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 1000},
      {data_util.mod_prefix .. "bioelectrics-data", 100},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-supercomputer-3", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-3.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-supercomputer-3",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-telescope",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {data_util.mod_prefix .. "space-mirror", 2},
      {"low-density-structure", 40},
      {"glass", 40},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-telescope", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/telescope.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-telescope",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-telescope-radio",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"radar", 10},
      {data_util.mod_prefix .. "space-mirror", 10},
      {"low-density-structure", 120},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-telescope-radio", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/telescope-radio.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-telescope-radio",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-telescope-microwave",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {data_util.mod_prefix .. "space-mirror", 6},
      {"low-density-structure", 80},
      {"glass", 80},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-telescope-microwave", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/telescope-microwave.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-telescope-microwave",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-telescope-xray",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {data_util.mod_prefix .. "space-mirror", 6},
      {data_util.mod_prefix .. "heat-shielding", 6},
      {"low-density-structure", 60},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-telescope-xray", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/telescope-xray.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-telescope-xray",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-telescope-gammaray",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {data_util.mod_prefix .. "heat-shielding", 6},
      {data_util.mod_prefix .. "space-mirror", 24},
      {"low-density-structure", 60},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-telescope-gammaray", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/telescope-gammaray.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-telescope-gammaray",
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-thermodynamics-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"chemical-plant", 1},
      {"electric-furnace", 1},
      {"low-density-structure", 60},
      {data_util.mod_prefix .. "heat-shielding", 60},
      {"steel-plate", 100},
      {"storage-tank", 8},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-thermodynamics-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/thermodynamics-laboratory.png",
    icon_size = 32,
    subgroup = "space-structures",
    order = "a-a-".."space-thermodynamics-laboratory",
    enabled = false,
    always_show_made_in = true,
  },
})
