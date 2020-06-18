local data_util = require("data_util")

data:extend({
  {
    type = "reactor",
    name = data_util.mod_prefix .. "antimatter-reactor",
    icon  = "__space-exploration-graphics__/graphics/icons/antimatter-reactor.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = data_util.mod_prefix .. "antimatter-reactor"},
    max_health = 500,
    corpse = "nuclear-reactor-remnants",
    consumption = "400MW",
    neighbour_bonus = 1,
    energy_source =
    {
      type = "burner",
      fuel_category = "antimatter",
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    --the collision box of a reactor is increased by this on the sides where it connects to another reactor:
    --neighbour_collision_increase = 0.25,
    lower_layer_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
      width = 156,
      height = 156,
      shift = util.by_pixel(-2, -4),
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes.png",
        width = 320,
        height = 316,
        scale = 0.5,
        shift = util.by_pixel(-1, -5),
      }
    },
    heat_lower_layer_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes-heated.png",
      width = 156,
      height = 156,
      shift = util.by_pixel(-3, -4),
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes-heated.png",
        width = 320,
        height = 316,
        scale = 0.5,
        shift = util.by_pixel(-0.5, -4.5),
      }
    },

    picture =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics__/graphics/entity/antimatter-reactor/reactor.png",
          width = 160,
          height = 160,
          shift = { -0.03125, -0.1875 },
          hr_version =
          {
            filename = "__space-exploration-graphics__/graphics/entity/antimatter-reactor/hr-reactor.png",
            width = 320,
            height = 320,
            scale = 0.5,
            shift = { -0.03125, -0.1875 }
          }
        },
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor-shadow.png",
          width = 263,
          height = 162,
          shift = { 1.625 , 0 },
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-shadow.png",
            width = 525,
            height = 323,
            scale = 0.5,
            shift = { 1.625, 0 },
            draw_as_shadow = true
          }
        }
      }
    },

    working_light_picture =
    {
      filename = "__space-exploration-graphics__/graphics/entity/antimatter-reactor/reactor-lights-color.png",
      width = 160,
      height = 160,
      shift = { -0.03125, -0.1875 },
      blend_mode = "additive",
      hr_version =
      {
        filename = "__space-exploration-graphics__/graphics/entity/antimatter-reactor/hr-reactor-lights-color.png",
        width = 320,
        height = 320,
        scale = 0.5,
        shift = { -0.03125, -0.1875 },
        blend_mode = "additive"
      }
    },

    light = {intensity = 1, size = 9.9, shift = {0.0, 0.0}, color = {r = 0.9, g = 0.0, b = 1.0}},

    heat_buffer =
    {
      max_temperature = 5000,
      specific_heat = "10MJ",
      max_transfer = "100GW",
      connections =
      {
        {
          position = {-2, -2},
          direction = defines.direction.north
        },
        {
          position = {0, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.east
        },
        {
          position = {2, 0},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.south
        },
        {
          position = {0, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.west
        },
        {
          position = {-2, 0},
          direction = defines.direction.west
        },
        {
          position = {-2, -2},
          direction = defines.direction.west
        }
      },

      heat_picture =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-heated.png",
        width = 108,
        height = 128,
        shift = util.by_pixel(1, -7),
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-heated.png",
          width = 216,
          height = 256,
          scale = 0.5,
          shift = util.by_pixel(3, -6.5),
        }
      },
      heat_glow =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-heat-glow.png",
        priority = "extra-high",
        width = 188,
        height = 190,
        tint = heat_glow_tint,
        shift = util.by_pixel(-2, -4)
      }
    },

    connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          scale = 0.5
        }
      }
    },

    connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5
        }
      }
    },

    connection_patches =
    {
      north =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-north.png",
        width = 160,
        height = 15,
        shift = util.by_pixel(0, -72.5)
      },
      east =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-east.png",
        width = 15,
        height = 160,
        shift = util.by_pixel(72.5, 0)
      },
      south =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-south.png",
        width = 160,
        height = 15,
        shift = util.by_pixel(0, 72.5)
      },
      west =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-west.png",
        width = 15,
        height = 160,
        shift = util.by_pixel(-72.5, 0)
      }
    },

    heat_connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        height = 32,
        variation_count = 12,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          width = 64,
          height = 64,
          variation_count = 12,
          scale = 0.5
        }
      }
    },

    heat_connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          width = 64,
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5
        }
      }
    },

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},

    meltdown_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
              repeat_count = 100,
              type = "create-trivial-smoke",
              smoke_name = "nuclear-smoke",
              offset_deviation = {{-1, -1}, {1, 1}},
              starting_frame = 3,
              starting_frame_deviation = 5,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.5
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = {amount = 400, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 2000,
              radius = 35,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.5
              }
            }
          }
        }
      }
    }
  },
})
