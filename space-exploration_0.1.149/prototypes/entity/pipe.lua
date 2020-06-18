local data_util = require("data_util")
--[[
original plan for space pipes and belts:
more of a spagetti problem.
underground distance for both is 2.
The can't span a void (space tiles or underlay) -- via script
pipes are floor layer
pipes have automatic flow control
All
straight: h, v,
corner: ne, nw, se, sw
t: n, s, w, e
X


]]--
local pipe_span = 5

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

data:extend({
  {
      name = data_util.mod_prefix .. "space-pipe",
      collision_box = {
        { -0.29, -0.29 },
        { 0.29, 0.29 }
      },
      collision_mask = collision_floor,
      corpse = "small-remnants",
      fast_replaceable_group = "pipe",
      flags = { "placeable-neutral", "player-creation" },
      fluid_box = {
        base_area = settings.startup["se-space-pipe-capacity"].value/100,
        pipe_connections = {
          { position = { 0, -1 } },
          { position = { 1, 0 } },
          { position = { 0, 1 } },
          { position = { -1, 0 } }
        }
      },
      horizontal_window_bounding_box = {
        { -0.25, -0.28125 },
        { 0.25, 0.15625 }
      },
      icon = "__space-exploration-graphics__/graphics/icons/pipe.png",
      icon_size = 32,
      max_health = 100,
      minable = {
        mining_time = 0.1,
        result = data_util.mod_prefix .. "space-pipe"
      },
      pictures = {
        corner_down_left = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-corner-down-left.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-corner-down-left.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        corner_down_right = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-corner-down-right.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-corner-down-right.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        corner_up_left = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-corner-up-left.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-corner-up-left.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        corner_up_right = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-corner-up-right.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-corner-up-right.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        cross = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-cross.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-cross.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        ending_down = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-ending-down.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-ending-down.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        ending_left = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-ending-left.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-ending-left.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        ending_right = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-ending-right.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-ending-right.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        ending_up = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-ending-up.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-ending-up.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        fluid_background = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/fluid-background.png",
          height = 20,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-fluid-background.png",
            height = 40,
            priority = "extra-high",
            scale = 0.5,
            width = 64
          },
          priority = "extra-high",
          width = 32
        },
        gas_flow = {
          axially_symmetrical = false,
          direction_count = 1,
          filename = "__space-exploration-graphics__/graphics/entity/pipe/steam.png",
          frame_count = 60,
          height = 15,
          hr_version = {
            axially_symmetrical = false,
            direction_count = 1,
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-steam.png",
            frame_count = 60,
            height = 30,
            line_length = 10,
            priority = "extra-high",
            width = 48
          },
          line_length = 10,
          priority = "extra-high",
          width = 24
        },
        high_temperature_flow = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/fluid-flow-high-temperature.png",
          height = 18,
          priority = "extra-high",
          width = 160
        },
        horizontal_window_background = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-horizontal-window-background.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-horizontal-window-background.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        low_temperature_flow = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/fluid-flow-low-temperature.png",
          height = 18,
          priority = "extra-high",
          width = 160
        },
        middle_temperature_flow = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
          height = 18,
          priority = "extra-high",
          width = 160
        },
        straight_horizontal = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-straight-horizontal.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-straight-horizontal.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        straight_horizontal_window = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-straight-horizontal-window.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-straight-horizontal-window.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        straight_vertical = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-straight-vertical.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-straight-vertical.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        straight_vertical_single = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-straight-vertical-single.png",
          height = 80,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-straight-vertical-single.png",
            height = 160,
            priority = "extra-high",
            scale = 0.5,
            width = 160
          },
          priority = "extra-high",
          width = 80
        },
        straight_vertical_window = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-straight-vertical-window.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-straight-vertical-window.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        t_down = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-t-down.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-t-down.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        t_left = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-t-left.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-t-left.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        t_right = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-t-right.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-t-right.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        t_up = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-t-up.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-t-up.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        },
        vertical_window_background = {
          filename = "__space-exploration-graphics__/graphics/entity/pipe/pipe-vertical-window-background.png",
          height = 64,
          hr_version = {
            filename = "__space-exploration-graphics__/graphics/entity/pipe/hr-pipe-vertical-window-background.png",
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          width = 64
        }
      },
      resistances = {
        {
          percent = 80,
          type = "fire"
        },
        {
          percent = 30,
          type = "impact"
        }
      },
      selection_box = {
        {
          -0.5,
          -0.5
        },
        {
          0.5,
          0.5
        }
      },
      type = "pipe",
      vehicle_impact_sound = {
        filename = "__base__/sound/car-metal-impact.ogg",
        volume = 0.65
      },
      vertical_window_bounding_box = {
        {
          -0.28125,
          -0.5
        },
        {
          0.03125,
          0.125
        }
      },
      working_sound = {
        match_volume_to_activity = true,
        max_sounds_per_type = 3,
        sound = {
          {
            filename = "__base__/sound/pipe.ogg",
            volume = 0.85
          }
        }
      }
    },
    {
      type = "pipe-to-ground",
      name = data_util.mod_prefix .. "space-pipe-to-ground",
      icon = "__space-exploration-graphics__/graphics/icons/pipe-to-ground.png",
      icon_size = 32,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = data_util.mod_prefix .. "space-pipe-to-ground"},
      max_health = 150,
      fast_replaceable_group = "pipe",
      corpse = "small-remnants",
      resistances =
      {
        {
          type = "fire",
          percent = 80
        },
        {
          type = "impact",
          percent = 40
        }

      },
      collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
      collision_mask = collision_floor_platform,
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      fluid_box =
      {
        base_area = settings.startup["se-space-pipe-capacity"].value/100,
        pipe_covers = pipecoverspictures(),
        pipe_connections =
        {
          { position = {0, -1} },
          {
            position = {0, 1},
            max_underground_distance = pipe_span + 1
          }
        }
      },
      underground_sprite =
      {
        filename = "__core__/graphics/arrows/underground-lines.png",
        priority = "extra-high-no-scale",
        width = 64,
        height = 64,
        scale = 0.5
      },
      vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      pictures =
      {
        up =
        {
          filename = "__space-exploration-graphics__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
          priority = "high",
          width = 64,
          height = 64, --, shift = {0.10, -0.04}
          hr_version =
          {
             filename = "__space-exploration-graphics__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-up.png",
             priority = "extra-high",
             width = 128,
             height = 128,
             scale = 0.5
          }
        },
        down =
        {
          filename = "__space-exploration-graphics__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
          priority = "high",
          width = 64,
          height = 64, --, shift = {0.05, 0}
          hr_version =
          {
             filename = "__space-exploration-graphics__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-down.png",
             priority = "extra-high",
             width = 128,
             height = 128,
             scale = 0.5
          }
        },
        left =
        {
          filename = "__space-exploration-graphics__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
          priority = "high",
          width = 64,
          height = 64, --, shift = {-0.12, 0.1}
          hr_version =
          {
             filename = "__space-exploration-graphics__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-left.png",
             priority = "extra-high",
             width = 128,
             height = 128,
             scale = 0.5
          }
        },
        right =
        {
          filename = "__space-exploration-graphics__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
          priority = "high",
          width = 64,
          height = 64, --, shift = {0.1, 0.1}
          hr_version =
          {
             filename = "__space-exploration-graphics__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-right.png",
             priority = "extra-high",
             width = 128,
             height = 128,
             scale = 0.5
          }
        }
      }
    },
})
