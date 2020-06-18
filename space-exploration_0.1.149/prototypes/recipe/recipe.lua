local data_util = require("data_util")
local make_recipe = data_util.make_recipe

if not data.raw.recipe["sand-from-stone"] then
  data:extend({
    {
      ingredients = {
        { "stone", 1 }
      },
      name = "sand-from-stone",
      result = "sand",
      result_count = 2,
      type = "recipe",
      enabled = false,
      energy_required = 0.5,
    }
  })
end

if not data.raw.recipe["glass-from-sand"] then
  data:extend({
    {
      category = "smelting",
      enabled = true,
      energy_required = 4,
      ingredients = {
        { "sand", 4 }
      },
      name = "glass-from-sand",
      result = "glass",
      type = "recipe",
      enabled = false,
    },
  })
end

data:extend({
  {
      type = "recipe",
      name = data_util.mod_prefix .. "heat-shielding",
      result = data_util.mod_prefix .. "heat-shielding",
      energy_required = 10,
      ingredients = {
        { "stone", 20 },
        { "sulfur", 8 },
        { "steel-plate", 2 }
      },
      requester_paste_multiplier = 2,
      enabled = false,
      always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-pipe",
    expensive = {
      ingredients = {
        { name = "copper-cable", amount = 4 },
        { name = "steel-plate", amount = 2 },
        { name = "plastic-bar", amount = 2 },
        { name = "stone", amount = 4 },
      },
      result = data_util.mod_prefix .. "space-pipe",
      energy_required = 10,
      enabled = false,
    },
    normal = {
      ingredients = {
        { name = "copper-cable", amount = 2 },
        { name = "steel-plate", amount = 1 },
        { name = "plastic-bar", amount = 1 },
        { name = "glass", amount = 1 },
      },
      result = data_util.mod_prefix .. "space-pipe",
      energy_required = 10,
      enabled = false,
    },
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-pipe-to-ground",
    ingredients = {
      { data_util.mod_prefix .. "space-pipe", 10 },
    },
    result = data_util.mod_prefix .. "space-pipe-to-ground",
    energy_required = 10,
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-transport-belt",
    category = "crafting-with-fluid",
    expensive = {
      ingredients = {
        { type = "fluid", name = "lubricant", amount = 20},
        { name = "steel-plate", amount = 6 },
        { name = "iron-plate", amount = 6 },
        { name = "copper-plate", amount = 6 },
      },
      result = data_util.mod_prefix .. "space-transport-belt",
      energy_required = 10,
      result_count = 2,
      enabled = false,
    },
    normal = {
      ingredients = {
        { type = "fluid", name = "lubricant", amount = 20},
        { name = "steel-plate", amount = 6 },
        { name = "iron-plate", amount = 6 },
        { name = "copper-plate", amount = 6 },
      },
      result = data_util.mod_prefix .. "space-transport-belt",
      energy_required = 10,
      result_count = 1,
      enabled = false,
    },
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-underground-belt",
    category = "crafting-with-fluid",
    ingredients = {
      { name = "steel-plate", amount = 8 },
      { data_util.mod_prefix .. "space-transport-belt", 8 },
      {
        amount = 40,
        name = "lubricant",
        type = "fluid"
      }
    },
    energy_required = 10,
    result = data_util.mod_prefix .. "space-underground-belt",
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-splitter",
    category = "crafting-with-fluid",
    ingredients = {
      { name = "steel-plate", amount = 10 },
      { name = "advanced-circuit", amount = 10 },
      { data_util.mod_prefix .. "space-transport-belt", 4 },
      {
        amount = 40,
        name = "lubricant",
        type = "fluid"
      }
    },
    energy_required = 10,
    result = data_util.mod_prefix .. "space-splitter",
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "thruster-suit",
    result = data_util.mod_prefix .. "thruster-suit",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "rocket-control-unit", 10 },
      { data_util.mod_prefix .. "heat-shielding", 20 },
      { "low-density-structure", 20 },
      { "rocket-fuel", 20 },
      { "glass", 20 },
      { data_util.mod_prefix .. "lifesupport-canister", 20 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "thruster-suit-2",
    results = {
      { name=data_util.mod_prefix .. "thruster-suit-2", amount = 1},
      { name=data_util.mod_prefix .. "used-lifesupport-canister", amount = 20 },
    },
    main_product = data_util.mod_prefix .. "thruster-suit-2",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "processing-unit", 50 },
      { "rocket-fuel", 50 },
      { data_util.mod_prefix .. "lifesupport-canister", 20 },
      { data_util.mod_prefix .. "material-catalogue-1", 1 },
      { data_util.mod_prefix .. "thruster-suit", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "thruster-suit-3",
    results = {
      { name=data_util.mod_prefix .. "thruster-suit-3", amount = 1},
      { name=data_util.mod_prefix .. "used-lifesupport-canister", amount = 20 },
    },
    main_product = data_util.mod_prefix .. "thruster-suit-3",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "processing-unit", 100 },
      { "rocket-fuel", 50 },
      { data_util.mod_prefix .. "lifesupport-canister", 20 },
      { data_util.mod_prefix .. "superconductive-cable", 50 },
      { data_util.mod_prefix .. "astronomic-catalogue-1", 1 },
      { data_util.mod_prefix .. "biological-catalogue-1", 1 },
      { data_util.mod_prefix .. "energy-catalogue-3", 1 },
      { data_util.mod_prefix .. "material-catalogue-3", 1 },
      { data_util.mod_prefix .. "thruster-suit-2", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "thruster-suit-4",
    results = {
      { name=data_util.mod_prefix .. "thruster-suit-4", amount = 1},
      { name=data_util.mod_prefix .. "used-lifesupport-canister", amount = 20 },
    },
    main_product = data_util.mod_prefix .. "thruster-suit-4",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "processing-unit", 200 },
      { data_util.mod_prefix .. "lifesupport-canister", 20 },
      { data_util.mod_prefix .. "antimatter-canister", 10 },
      { data_util.mod_prefix .. "nano-material", 200 },
      { data_util.mod_prefix .. "superconductive-cable", 100 },
      { data_util.mod_prefix .. "astronomic-catalogue-4", 1 },
      { data_util.mod_prefix .. "biological-catalogue-4", 1 },
      { data_util.mod_prefix .. "energy-catalogue-4", 1 },
      { data_util.mod_prefix .. "material-catalogue-4", 1 },
      { data_util.mod_prefix .. "thruster-suit-3", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "rtg-equipment",
    result = data_util.mod_prefix .. "rtg-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "processing-unit", 50 },
      { "low-density-structure", 50 },
      { "uranium-fuel-cell", 4 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "rtg-equipment-2",
    result = data_util.mod_prefix .. "rtg-equipment-2",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "processing-unit", 100 },
      { "low-density-structure", 100 },
      { data_util.mod_prefix .."atomic-data", 1 },
      { data_util.mod_prefix .."radiation-data", 1 },
      { data_util.mod_prefix .. "rtg-equipment", 4 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "adaptive-armour-equipment-1",
    result = data_util.mod_prefix .. "adaptive-armour-equipment-1",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 20 },
      { "advanced-circuit", 10 },
      { "battery", 5 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "adaptive-armour-equipment-2",
    result = data_util.mod_prefix .. "adaptive-armour-equipment-2",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 30 },
      { "processing-unit", 10 },
      { "low-density-structure", 10 },
      { data_util.mod_prefix .. "adaptive-armour-equipment-1", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "adaptive-armour-equipment-3",
    result = data_util.mod_prefix .. "adaptive-armour-equipment-3",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 40 },
      { "processing-unit", 10 },
      { data_util.mod_prefix .. "heat-shielding", 10 },
      { data_util.mod_prefix .. "adaptive-armour-equipment-2", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "adaptive-armour-equipment-4",
    result = data_util.mod_prefix .. "adaptive-armour-equipment-4",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 50 },
      { "processing-unit", 20 },
      { data_util.mod_prefix .. "heat-shielding", 20 },
      { data_util.mod_prefix .. "adaptive-armour-equipment-3", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "adaptive-armour-equipment-5",
    result = data_util.mod_prefix .. "adaptive-armour-equipment-5",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 40 },
      { "processing-unit", 30 },
      { data_util.mod_prefix .. "nano-material", 10 },
      { data_util.mod_prefix .. "adaptive-armour-equipment-4", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = "energy-shield-mk3-equipment",
    result = "energy-shield-mk3-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "energy-shield-mk2-equipment", 5 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = "energy-shield-mk4-equipment",
    result = "energy-shield-mk4-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "energy-shield-mk3-equipment", 5 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = "energy-shield-mk5-equipment",
    result = "energy-shield-mk5-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "energy-shield-mk4-equipment", 5 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = "energy-shield-mk6-equipment",
    result = "energy-shield-mk6-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "energy-shield-mk5-equipment", 5 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
  },
})
