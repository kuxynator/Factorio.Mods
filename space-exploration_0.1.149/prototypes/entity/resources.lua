local data_util = require("data_util")
local noise = require("noise");
local tne = noise.to_noise_expression;
local resource_autoplace = require("resource-autoplace");

if data.raw.resource["iron-ore"].autoplace then
  data.raw.resource["iron-ore"].autoplace = resource_autoplace.resource_autoplace_settings{
    name = "iron-ore",
    order = "a-a",
    base_density = 10,
    has_starting_area_placement = true,
    resource_index = resource_autoplace.resource_indexes["iron-ore"],
    regular_rq_factor_multiplier = 1.1;
    starting_rq_factor_multiplier = 1.5;
  }
end

if data.raw.resource["copper-ore"].autoplace then
  data.raw.resource["copper-ore"].autoplace = resource_autoplace.resource_autoplace_settings{
    name = "copper-ore",
    order = "a-b",
    base_density = 8,
    has_starting_area_placement = true,
    resource_index = resource_autoplace.resource_indexes["copper-ore"],
    regular_rq_factor_multiplier = 1.10,
    starting_rq_factor_multiplier = 1.2
  }
end

if data.raw.resource["coal"].autoplace then
  data.raw.resource["coal"].autoplace = resource_autoplace.resource_autoplace_settings{
    name = "coal",
    order = "a-c",
    base_density = 8,
    has_starting_area_placement = true,
    resource_index = resource_autoplace.resource_indexes["coal"],
    regular_rq_factor_multiplier = 1,
    starting_rq_factor_multiplier = 1.1
  }
end

if data.raw.resource["stone"].autoplace then
  data.raw.resource["stone"].autoplace = resource_autoplace.resource_autoplace_settings{
    name = "stone",
    order = "a-d",
    base_density = 9,
    has_starting_area_placement = true,
    resource_index = resource_autoplace.resource_indexes["stone"],
    regular_rq_factor_multiplier = 1.1,
    starting_rq_factor_multiplier = 1.0
  }
end

if data.raw.resource["uranium-ore"].autoplace then
  data.raw.resource["uranium-ore"].autoplace = resource_autoplace.resource_autoplace_settings{
    name = "uranium-ore",
    order = "c-a",
    base_density = 0.9,
    base_spots_per_km2 = 1.25,
    has_starting_area_placement = false,
    random_spot_size_minimum = 2,
    random_spot_size_maximum = 4,
    resource_index = resource_autoplace.resource_indexes["uranium-ore"],
    regular_rq_factor_multiplier = 1
  }
end

if data.raw.resource["crude-oil"].autoplace then
  data.raw.resource["crude-oil"].autoplace = resource_autoplace.resource_autoplace_settings{
    name = "crude-oil",
    order = "c-b", -- Other resources are "b"; oil won't get placed if something else is already there.
    base_density = 8.2,
    base_spots_per_km2 = 1.8,
    random_probability = 1/48,
    random_spot_size_minimum = 1,
    random_spot_size_maximum = 1, -- don't randomize spot size
    additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
    has_starting_area_placement = false,
    resource_index = resource_autoplace.resource_indexes["crude-oil"],
    regular_rq_factor_multiplier = 1
  }
end


data:extend({
  {
    type = "resource",
    name = data_util.mod_prefix.."water-ice",
    icon = "__space-exploration-graphics__/graphics/icons/water-ice.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    order="a-b-e",
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 1,
      result = data_util.mod_prefix.."water-ice",
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = data_util.mod_prefix.."water-ice",
      order = "e",
      base_density = 10,
      has_starting_area_placement = true,
      resource_index = resource_autoplace.resource_indexes["se-water-ice"],
      regular_rq_factor_multiplier = 1.1;
      starting_rq_factor_multiplier = 1.5;
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__space-exploration-graphics__/graphics/entity/water-ice/water-ice.png",
        priority = "extra-high",
        size = 64,
        frame_count = 8,
        variation_count = 8,
        hr_version =
        {
          filename = "__space-exploration-graphics__/graphics/entity/water-ice/hr-water-ice.png",
          priority = "extra-high",
          size = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
        }
      }
    },
    map_color = {r = 198/255, g = 241/255, b = 245/255}
  },
  {
    type = "resource",
    name = data_util.mod_prefix.."methane-ice",
    icon = "__space-exploration-graphics__/graphics/icons/methane-ice.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    order="a-b-e",
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 1,
      result = data_util.mod_prefix.."methane-ice",
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = data_util.mod_prefix.."methane-ice",
      order = "f",
      base_density = 10,
      has_starting_area_placement = true,
      resource_index = resource_autoplace.resource_indexes["se-methane-ice"],
      regular_rq_factor_multiplier = 1.1;
      starting_rq_factor_multiplier = 1.5;
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__space-exploration-graphics__/graphics/entity/methane-ice/methane-ice.png",
        priority = "extra-high",
        size = 64,
        frame_count = 8,
        variation_count = 8,
        hr_version =
        {
          filename = "__space-exploration-graphics__/graphics/entity/methane-ice/hr-methane-ice.png",
          priority = "extra-high",
          size = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
        }
      }
    },
    map_color = {r = 245/255, g = 231/255, b = 198/255}
  }

})

data.raw.resource[data_util.mod_prefix.."water-ice"].autoplace.tile_restriction = {data_util.mod_prefix.."asteroid"}
data.raw.resource[data_util.mod_prefix.."methane-ice"].autoplace.tile_restriction = {data_util.mod_prefix.."asteroid"}
