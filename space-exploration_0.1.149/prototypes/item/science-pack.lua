local data_util = require("data_util")

data:extend({
  --[[{
    type = "tool",
    name = data_util.mod_prefix .. "space-science-pack",
    subgroup = "science-pack",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    icon = "__space-exploration-graphics__/graphics/icons/beaker/space-science-pack.png",
    icon_size = 32,
    order = "h[space-platform-science-pack-1]",
    stack_size = 200,
  },]]--
  {
    type = "tool",
    name = data_util.mod_prefix .. "astronomic-science-pack",
    subgroup = "science-pack",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    icon = "__space-exploration-graphics__/graphics/icons/beaker/blue.png",
    icon_size = 64,
    order = "h[astronomic-science-pack-1]",
    stack_size = 200,
  },
  {
    type = "tool",
    name = data_util.mod_prefix .. "biological-science-pack",
    subgroup = "science-pack",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    icon = "__space-exploration-graphics__/graphics/icons/beaker/green.png",
    icon_size = 64,
    order = "h[biological-science-pack-1]",
    stack_size = 200,
  },
  {
    type = "tool",
    name = data_util.mod_prefix .. "energy-science-pack",
    subgroup = "science-pack",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    icon = "__space-exploration-graphics__/graphics/icons/beaker/magenta.png",
    icon_size = 64,
    order = "h[energy-science-pack-1]",
    stack_size = 200,
  },
  {
    type = "tool",
    name = data_util.mod_prefix .. "material-science-pack",
    subgroup = "science-pack",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    icon = "__space-exploration-graphics__/graphics/icons/beaker/orange.png",
    icon_size = 64,
    order = "h[material-science-pack-1]",
    stack_size = 200,
  },
  {
    type = "tool",
    name = data_util.mod_prefix .. "deep-space-science-pack",
    subgroup = "science-pack",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    icon = "__space-exploration-graphics__/graphics/icons/beaker/space.png",
    icon_size = 64,
    order = "i[space-platform-science-pack-2]",
    stack_size = 200,
  },
})

--[[
local function tint_science_pack(name, tint)
  if data.raw.tool[name] then
    data.raw.tool[name].icon = nil
    data.raw.tool[name].icons = {
      {
        icon = "__space-exploration-graphics__/graphics/icons/science-pack-base.png"
      },
      {
        icon = "__space-exploration-graphics__/graphics/icons/science-pack-mask.png",
        tint = tint
      }
    }
  end
end
tint_science_pack("science-pack-1", {r = 0.9, g = 0.7, b = 0})
tint_science_pack("science-pack-2", {r = 0, g = 0.6, b = 0})
tint_science_pack("science-pack-3", {r = 0.2, g = 0.4, b = 0.8})
tint_science_pack("military-science-pack", {r = 0.7, g = 0, b = 0})
tint_science_pack("production-science-pack", {r = 0.9, g = 0.4, b = 0})
tint_science_pack("high-tech-science-pack",  {r = 0.7, g = 0, b = 0.7})
tint_science_pack("space-science-pack", {r = 0, g = 1, b = 1})
tint_science_pack(data_util.mod_prefix .. "science-pack-1", {r = 1, g = 1, b = 1})
data.raw.tool[data_util.mod_prefix .. "science-pack-2"].icons = nil
data.raw.tool[data_util.mod_prefix .. "science-pack-2"].icon = "__space-exploration-graphics__/graphics/icons/science-pack-dark.png"
"space-science-pack"
]]--
--[[

[red] = science pack 1
[green] = science pack 2
[military] (grey)
[blue] = science pack 3
[tech] (gold) High Tech
[production] (purple)
[rocket] (orange ) - was white space science 1
[space] (white) - new space platform
[deep-space] - advanced space science

yellow = 1
green = 2
cyan = 3
red = military
purple = production
turquoise = tech
orange = rocketry
white = space
black = deep space
]]--
