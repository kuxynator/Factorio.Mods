local data_util = require("data_util")

data_util.replace_or_add_ingredient("low-density-structure", "steel-plate", "steel-plate", 5)
data_util.replace_or_add_ingredient("low-density-structure", "copper-plate", "copper-plate", 10)
if data.raw.item.glass then
  data_util.replace_or_add_ingredient("low-density-structure", nil, "glass", 10)
else
  data_util.replace_or_add_ingredient("low-density-structure", nil, "stone", 10)
end
data_util.replace_or_add_ingredient("low-density-structure", "plastic-bar", "plastic-bar", 10)

data_util.replace_or_add_ingredient("rocket-control-unit", nil, "iron-plate", 5)
data_util.replace_or_add_ingredient("rocket-control-unit", nil, "glass", 5)
data_util.replace_or_add_ingredient("rocket-control-unit", "speed-module", "battery", 5)
data_util.replace_or_add_ingredient("rocket-control-unit", "advanced-circuit", "advanced-circuit", 5)
data_util.replace_or_add_ingredient("rocket-control-unit", "processing-unit", "processing-unit", 1)

data_util.replace_or_add_ingredient("rocket-part", "low-density-structure", "low-density-structure", 5)
data_util.replace_or_add_ingredient("rocket-part", "rocket-control-unit", "rocket-control-unit", 5)
data_util.replace_or_add_ingredient("rocket-part", nil, data_util.mod_prefix .. "heat-shielding", 5)

data.raw.recipe["solid-fuel-from-heavy-oil"].category = "fuel-refining"
data.raw.recipe["solid-fuel-from-heavy-oil"].energy_required = 0.5
data.raw.recipe["solid-fuel-from-light-oil"].category = "fuel-refining"
data.raw.recipe["solid-fuel-from-light-oil"].energy_required = 0.5
data.raw.recipe["solid-fuel-from-petroleum-gas"].category = "fuel-refining"
data.raw.recipe["solid-fuel-from-petroleum-gas"].energy_required = 0.5

data.raw.recipe["rocket-fuel"].crafting_machine_tint =
{
  primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
  secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
  tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
}
data.raw.recipe["rocket-fuel"].category = "fuel-refining"
data.raw.recipe["rocket-fuel"].subgroup = "rocket-intermediate-product"
data.raw.recipe["rocket-fuel"].order = "zz"
data.raw.recipe["rocket-fuel"].energy_required = 1

data:extend({
  {
    type = "recipe",
    name = data_util.mod_prefix .. "liquid-rocket-fuel",
    ingredients = {
      { name = "rocket-fuel", amount = 1 },
    },
    results = {
      {name = data_util.mod_prefix.."liquid-rocket-fuel", type="fluid", amount=data_util.liquid_rocket_fuel_per_solid}
    },
    energy_required = 1,
    enabled = false,
    category = "fuel-refining",
    subgroup = "rocket-intermediate-product",
    order = "zz",
    crafting_machine_tint =
    {
      primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
      secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
      tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
    }
  },
})

data:extend({
  {
    type = "recipe",
    name = data_util.mod_prefix .. "rocket-fuel-from-water-copper",
    ingredients = {
      { type = "fluid", name = "water", amount = 1000 },
      { name = "copper-plate", amount = 1 },
    },
    results = {
      {name = "rocket-fuel", amount = 1 },
      {name = data_util.mod_prefix .. "scrap", probability = 0.1, amount_min = 1, amount_max = 1 },
    },
    icons = data_util.transition_icons(
        data.raw.fluid["water"].icon,
        data.raw.item["rocket-fuel"].icon
    ),
    energy_required = 500,
    enabled = false,
    category = "fuel-refining",
    subgroup = "rocket-intermediate-product",
    order = "zz",
    crafting_machine_tint =
    {
      primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
      secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
      tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
    }
  },
})
data_util.allow_productivity(data_util.mod_prefix .. "liquid-rocket-fuel")
data_util.allow_productivity(data_util.mod_prefix .. "rocket-fuel-from-water-copper")
data_util.allow_productivity("sand-from-stone")
data_util.allow_productivity("glass-from-sand")
data_util.allow_productivity("sand-to-solid-sand")
data_util.allow_productivity(data_util.mod_prefix .. "heat-shielding")
data_util.allow_productivity("space-science-pack")
data_util.allow_productivity(data_util.mod_prefix .. "data-storage-substrate")
data_util.allow_productivity(data_util.mod_prefix .. "material-testing-pack")

data_util.disallow_productivity("empty-barrel")
data.raw.recipe["empty-barrel"].normal = nil
data.raw.recipe["empty-barrel"].expensive = nil
data.raw.recipe["empty-barrel"].result = nil
data.raw.recipe["empty-barrel"].ingredients = { { name = "steel-plate", amount = 1 } }
data.raw.recipe["empty-barrel"].results = { { name = "empty-barrel", amount = 1 } }
