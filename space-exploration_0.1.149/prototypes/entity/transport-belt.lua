local data_util = require("data_util")

local belt_span = 5

local collision_floor = {
  "item-layer", -- stops player from dropping items on belts.
  "floor-layer",
  "object-layer",
  "water-tile",
}
local collision_floor_platform = {
  "item-layer", -- stops player from dropping items on belts.
  "floor-layer",
  "object-layer",
  "water-tile",
}

local belt = table.deepcopy(data.raw["transport-belt"]["express-transport-belt"])
belt.name = data_util.mod_prefix .. "space-transport-belt"
belt.minable.result = data_util.mod_prefix .. "space-transport-belt"
belt.icon = "__space-exploration-graphics__/graphics/icons/transport-belt.png"
belt.icon_size = 32
belt.fast_replaceable_group = "space-transport-belt"
belt.next_upgrade = nil
local fields = {"animations", "belt_animation_set", "structure", "belt_horizontal", "belt_vertical",
  "ending_bottom", "ending_patch", "ending_side", "ending_top",
  "starting_bottom", "starting_patch", "starting_side", "starting_top"}
for _, field in pairs(fields) do
  data_util.replace_filenames_recursive(belt[field],
    "__base__",
    "__space-exploration-graphics__")
  data_util.replace_filenames_recursive(belt[field],
    "express-",
    "space-")
end
belt.collision_mask = collision_floor

local splitter = table.deepcopy(data.raw["splitter"]["express-splitter"])
splitter.name = data_util.mod_prefix .. "space-splitter"
splitter.minable.result = data_util.mod_prefix .. "space-splitter"
splitter.icon = "__space-exploration-graphics__/graphics/icons/splitter.png"
splitter.icon_size = 32
splitter.fast_replaceable_group = "space-transport-belt"
splitter.next_upgrade = nil
for _, field in pairs(fields) do
  data_util.replace_filenames_recursive(splitter[field],
    "__base__",
    "__space-exploration-graphics__")
  data_util.replace_filenames_recursive(splitter[field],
    "express-",
    "space-")
end
splitter.collision_mask = collision_floor

local ug_belt = table.deepcopy(data.raw["underground-belt"]["express-underground-belt"])
ug_belt.name = data_util.mod_prefix .. "space-underground-belt"
ug_belt.minable.result = data_util.mod_prefix .. "space-underground-belt"
ug_belt.icon = "__space-exploration-graphics__/graphics/icons/underground-belt.png"
ug_belt.icon_size = 32
ug_belt.fast_replaceable_group = "space-transport-belt"
ug_belt.next_upgrade = nil
for _, field in pairs(fields) do
  data_util.replace_filenames_recursive(ug_belt[field],
    "__base__",
    "__space-exploration-graphics__")
  data_util.replace_filenames_recursive(ug_belt[field],
    "express-",
    "space-")
end
ug_belt.max_distance = belt_span + 1
ug_belt.collision_mask = collision_floor_platform

data:extend({
  belt,
  ug_belt,
  splitter
})

--log( serpent.block( data.raw["transport-belt"], {comment = false, numformat = '%1.8g' } ) )
