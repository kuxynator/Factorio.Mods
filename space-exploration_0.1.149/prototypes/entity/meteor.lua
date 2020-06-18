local data_util = require("data_util")
--[[
meteors
projectile falls from the sky
shadow moves sideways
projectile causes explosion and spawns a rock
]]--
local meteors = {
  ["meteor-01"] = {209, 138},
  ["meteor-02"] = {165,129},
  ["meteor-03"] = {151,139},
  ["meteor-04"] = {216,110},
  ["meteor-05"] = {154,147},
  ["meteor-06"] = {154,132},
  ["meteor-07"] = {193,120},
  ["meteor-08"] = {136,117},
  ["meteor-09"] = {157,115},
  ["meteor-10"] = {198,153},
  ["meteor-11"] = {190,115},
  ["meteor-12"] = {229,126},
  ["meteor-13"] = {151,125},
  ["meteor-14"] = {137,117},
  ["meteor-15"] = {201,141},
  ["meteor-16"] = {209,154},
}

local tint = {r = 0.5, g = 0.5, b = 0.5}

for name, meteor in pairs(meteors) do
  local width = meteor[1]
  local height = meteor[2]
  local shadow_width = meteor[1]
  local shadow_height = meteor[2]
  local scale = 0.75
  local picture_offset = width / 32 / 16
  data:extend({
    {
      type = "projectile",
      name = data_util.mod_prefix.."falling-" .. name,
      acceleration = 0,
      rotatable = false,
      animation = {
        filename = "__space-exploration-graphics__/graphics/entity/meteor/hr-"..name..".png",
        frame_count = 1,
        width = width,
        height = height,
        line_length = 1,
        priority = "high",
        shift = { picture_offset, 0 },
        tint=tint,
        scale = scale,
      },
      action = {
        action_delivery = {
          target_effects = {
            {
              action = {
                action_delivery = {
                  target_effects = {
                    {
                      damage = {
                        amount = 20,
                        type = "meteor"
                      },
                      type = "damage"
                    },
                  },
                  type = "instant"
                },
                radius = 10,
                type = "area"
              },
              type = "nested-result"
            },
            {
              action = {
                action_delivery = {
                  target_effects = {
                    {
                      damage = {
                        amount = 100,
                        type = "meteor"
                      },
                      type = "damage"
                    },
                  },
                  type = "instant"
                },
                radius = 4,
                type = "area"
              },
              type = "nested-result"
            },
            {
              action = {
                action_delivery = {
                  target_effects = {
                    {
                      damage = {
                        amount = 200,
                        type = "meteor"
                      },
                      type = "damage"
                    },
                  },
                  type = "instant"
                },
                radius = 2,
                type = "area"
              },
              type = "nested-result"
            },
            {
              action = {
                action_delivery = {
                  target_effects = {
                    {
                      damage = {
                        amount = 10000,
                        type = "meteor"
                      },
                      type = "damage"
                    },
                  },
                  type = "instant"
                },
                radius = 1,
                type = "area"
              },
              type = "nested-result"
            },
            {
              type = "create-entity",
              entity_name = data_util.mod_prefix.."meteor-explosion",
            },
            {
              type = "create-entity",
              check_buildability = false,
              entity_name = data_util.mod_prefix.."static-"..name,
            },
            {
              type = "create-entity",
              entity_name = data_util.mod_prefix .. "trigger-movable-debris",
              trigger_created_entity = true,
            },
          },
          type = "instant"
        },
        type = "direct"
      },
      flags = { "not-on-map" },
      light = { intensity = 1, size = 5, color={r=1,g=0.7,b=0.3}},
      smoke = {
        {
          deviation = {
            0.15,
            0.15
          },
          frequency = 1,
          --name = "smoke-fast",
          --name = "smoke-explosion-particle",
          name = "soft-fire-smoke", -- lasts longer
          position = {0,0},
          slow_down_factor = 1,
          starting_frame = 3,
          starting_frame_deviation = 5,
          starting_frame_speed = 0,
          starting_frame_speed_deviation = 5
        }
      },
    },
    {
      type = "projectile",
      name = data_util.mod_prefix.."shadow-" .. name,
      acceleration = 0,
      rotatable = false,
      animation = {
        draw_as_shadow = true,
        filename = "__space-exploration-graphics__/graphics/entity/meteor/shadows/hr-"..name..".png",
        frame_count = 1,
        width = shadow_width,
        height = shadow_height,
        line_length = 1,
        priority = "high",
        shift = { picture_offset, 0 },
        tint=tint,
        scale = scale,
      },
      flags = { "not-on-map" },
    },
    {
      type = "simple-entity",
      name = data_util.mod_prefix.."static-"..name,
      icon = "__base__/graphics/icons/ship-wreck/small-ship-wreck.png",
      icon_size = 32,
      flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
      subgroup = "wrecks",
      order = "d[remnants]-d[ship-wreck]-c[small]-a",
      max_health = 1000,
      minable = {
        mining_time = 1,
        results={
          {name = "stone", amount_min = 9, amount_max = 21},
          {name = "iron-ore", amount_min = 0, amount_max = 21},
          {name = "copper-ore", amount_min = 0, amount_max = 21},
        }
      },
      resistances =
      {
        { type = "fire", percent = 100 },
        { type = "poison", percent = 100 }
      },
      collision_box = {{-1, -1}, {1, 1}},
      collision_mask = {"not-colliding-with-itself"}, -- otherwise it kills the entity ghosts too
      selection_box = {{-1, -1}, {1, 1}},
      selection_priority = 2,
      count_as_rock_for_filtered_deconstruction = true,
      picture =
      {
        layers = {
          {
            filename = "__space-exploration-graphics__/graphics/entity/meteor/hr-"..name..".png",
            width = width,
            height = height,
            shift = { picture_offset, 0 },
            tint=tint,
            scale = scale,
          },
          {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics__/graphics/entity/meteor/shadows/hr-"..name..".png",
            width = shadow_width,
            height = shadow_height,
            shift = { picture_offset, 0 },
            tint=tint,
            scale = scale,
          }
        }
      },
      render_layer = "object",
      localised_name = {"entity-name.meteorite"}
    },

  })
end

data:extend({
  {
    animation = {
      direction_count = 1,
      filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png",
      frame_count = 1,
      height = 90,
      width = 110
    },
    collision_box = {
      {
        -1.5,
        -1.5
      },
      {
        1.5,
        1.5
      }
    },
    collision_mask = {
      "doodad-layer",
      "not-colliding-with-itself"
    },
    final_render_layer = "ground-patch-higher2",
    flags = {
      "placeable-neutral",
      "not-on-map",
      "placeable-off-grid"
    },
    ground_patch = {
      sheet = {
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png",
        frame_count = 1,
        height = 90,
        variation_count = 3,
        width = 110,
        x = 220,
        sacle = 2
      }
    },
    ground_patch_higher = {
      sheet = {
        filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png",
        frame_count = 1,
        height = 90,
        variation_count = 3,
        width = 110,
        x = 110,
        sacle = 2
      }
    },
    icon = "__base__/graphics/icons/small-scorchmark.png",
    icon_size = 32,
    name = data_util.mod_prefix.."meteor-scorchmark",
    order = "d[remnants]-b[scorchmark]-a[small]",
    remove_on_entity_placement = false,
    remove_on_tile_placement = true,
    selectable_in_game = false,
    selection_box = {
      {
        -1,
        -1
      },
      {
        1,
        1
      }
    },
    subgroup = "remnants",
    time_before_removed = 36000,
    type = "corpse"
  },

})
