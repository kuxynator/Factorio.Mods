data:extend(
	{
		{
			type = "boiler",
			name = "y-boiler-iv",
			icon_size = 32,
			icon = "__Yuoki__/graphics/icons/boiler-3m-icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {hardness = 0.3, mining_time = 0.5, result = "y-boiler-iv"},
			max_health = 350,
			corpse = "small-remnants",
			resistances = {{type = "fire", percent = 80}},
			mode = "output-to-separate-pipe",
			collision_box = {{-1.25, -1.25}, {1.25, 1.25}},
			selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
			target_temperature = 250,
			fluid_box = {
				base_area = 3,
				height = 2,
				base_level = -1,
				pipe_connections = {
					--{ type = "input-output", position = { 0, -2.0} },
					{type = "input-output", position = {2, 0}},
					{type = "input", position = {0, 2}},
					{type = "input-output", position = {-2, 0}}
				},
				production_type = "input-output",
				filter = "water"
			},
			output_fluid_box = {
				base_area = 3,
				height = 2,
				pipe_connections = {
					{type = "output", position = {0, -2}}
				},
				production_type = "output",
				filter = "steam"
			},
			energy_consumption = "5.4MW",
			energy_source = {
				type = "burner",
				fuel_category = "chemical",
				effectivity = 0.75,
				fuel_inventory_size = 2,
				emissions = 0.1 / 10,
				smoke = {
					{
						name = "smoke",
						deviation = {0.1, 0.1},
						frequency = 1.5
					}
				}
			},
			structure = {
				north = {
					filename = "__Yuoki__/graphics/entity/big_boiler_r18.png",
					priority = "extra-high",
					width = 256,
					height = 256,
					shift = {0.375, -0.25},
					scale = 0.5
				},
				east = {
					filename = "__Yuoki__/graphics/entity/big_boiler_r18.png",
					priority = "extra-high",
					width = 256,
					height = 256,
					shift = {0.375, -0.25},
					scale = 0.5
				},
				south = {
					filename = "__Yuoki__/graphics/entity/big_boiler_r18.png",
					priority = "extra-high",
					width = 256,
					height = 256,
					shift = {0.375, -0.25},
					scale = 0.5
				},
				west = {
					filename = "__Yuoki__/graphics/entity/big_boiler_r18.png",
					priority = "extra-high",
					width = 256,
					height = 256,
					shift = {0.375, -0.25},
					scale = 0.5
				}
			},
			fire = {},
			fire_glow = {},
			burning_cooldown = 20
		},
  
		-- big steam-turbine
		{
			type = "generator",
			name = "y-steam-turbine",
			icon_size = 32,
			icon = "__Yuoki__/graphics/entity/steam_turbine_n3_icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 1, result = "y-steam-turbine"},
			max_health = 300,
			corpse = "big-remnants",
			effectivity = 1.075,
			fluid_usage_per_tick = 1.25,
			maximum_temperature = 250,
			resistances = {
				{
					type = "fire",
					percent = 70
				}
			},
			collision_box = {{-1.3, -1.7}, {1.3, 1.7}},
			selection_box = {{-1.5, -2.0}, {1.5, 2.0}},
			fluid_box = {
				base_area = 3,
				height = 2,
				base_level = -1,
				pipe_connections = {
					{type = "input-output", position = {0, 2.5}},
					{type = "input-output", position = {0, -2.5}}
				},
				production_type = "input-output",
				filter = "steam"
			},
			fluid_input = {
				name = "steam",
				amount = 0.0,
				minimum_temperature = 100.0
				--{ name = "y-mechanical-force", amount = 0.0, minimum_temperature = 100.0 },
				--{ name = "y_water_mix", amount = 0.0, minimum_temperature = 100.0 },
			},
			energy_source = {
				type = "electric",
				usage_priority = "secondary-output"
			},
			horizontal_animation = {
				filename = "__Yuoki__/graphics/entity/steam_turb_v3_sheet.png",
				width = 320,
				height = 320,
				frame_count = 10,
				line_length = 5,
				shift = {0.475, -0.95},
				scale = 0.5
			},
			vertical_animation = {
				filename = "__Yuoki__/graphics/entity/steam_turb_h3_sheet.png",
				width = 320,
				height = 320,
				frame_count = 10,
				line_length = 5,
				shift = {1.0, -0.25},
				scale = 0.5
			},
			smoke = {
				{
					name = "smoke",
					north_position = {-1.1, -2.2},
					east_position = {1.7, -1},
					height = 0.3,
					deviation = {0.1, 0.1},
					frequency = 0.4,
					height_deviation = 0.2,
					starting_vertical_speed = 0.2,
					starting_vertical_speed_deviation = 0.06
				},
				{
					name = "smoke",
					north_position = {1.1, -2.2},
					east_position = {1.7, 0},
					height = 0.3,
					deviation = {0.1, 0.1},
					frequency = 0.4,
					height_deviation = 0.2,
					starting_vertical_speed = 0.2,
					starting_vertical_speed_deviation = 0.06
				}
			}
		},
		-- rensuir/obninsk-turbine
		{
			type = "generator",
			name = "y-obninsk-turbine",
			icon_size = 32,
			icon = "__Yuoki__/graphics/icons/rensuir-turbine_icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 1, result = "y-obninsk-turbine"},
			max_health = 500,
			corpse = "big-remnants",
			effectivity = 1.34,
			fluid_usage_per_tick = 1.66667,
			maximum_temperature = 500,
			collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
			selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
			fluid_box = {
				base_area = 4,
				height = 2,
				base_level = -1,
				pipe_connections = {
					{type = "input-output", position = {0, 2}},
					{type = "input-output", position = {0, -2}}
				},
				production_type = "input-output",
				filter = "steam"
			},
			fluid_input = {name = "steam", amount = 0.0, minimum_temperature = 100.0},
			energy_source = {
				type = "electric",
				--usage_priority = "secondary-output"
				usage_priority = "primary-output"
			},
			horizontal_animation = {
				filename = "__Yuoki__/graphics/entity/rens_ah.png",
				width = 120,
				height = 96,
				frame_count = 18,
				line_length = 9,
				shift = {0.0, 0.0}
			},
			vertical_animation = {
				filename = "__Yuoki__/graphics/entity/rens_av.png",
				width = 96,
				height = 128,
				frame_count = 18,
				line_length = 18,
				shift = {0.0, 0.0}
			},
			pipes_horizontal = {
				filename = "__Yuoki__/graphics/entity/pipes_h96.png",
				priority = "high",
				width = 96,
				height = 44,
				shift = {0, 0}
			},
			pipes_vertical = {
				filename = "__Yuoki__/graphics/entity/pipes_v96.png",
				priority = "high",
				width = 44,
				height = 96
			}
		},
		{
			type = "generator",
			name = "y-notfall-generator-s2",
			icon_size = 32,
			icon = "__Yuoki__/graphics/entity/energy-t2/lt-v2p-icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 1, result = "y-notfall-generator-s2"},
			max_health = 300,
			corpse = "small-remnants",
			effectivity = 1.04,
			fluid_usage_per_tick = 0.41667,
			resistances = {
				{
					type = "fire",
					percent = 70
				}
			},
			collision_box = {{-1.3, -0.9}, {1.3, 0.9}},
			selection_box = {{-1.5, -1.0}, {1.5, 1.0}},
			maximum_temperature = 250,
			fluid_box = {
				base_area = 1,
				height = 2,
				base_level = -1,
				pipe_connections = {
					{type = "input-output", position = {0, 1.5}},
					{type = "input-output", position = {0, -1.5}}
				},
				production_type = "input-output",
				filter = "steam"
			},
			fluid_input = {name = "steam", amount = 0.0, minimum_temperature = 100.0},
			energy_source = {
				type = "electric",
				usage_priority = "secondary-output"
			},
			horizontal_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/ss800h_sheet.png",
				width = 256,
				height = 256,
				frame_count = 16,
				line_length = 4,
				shift = {1.0, 0.325},
				scale = 0.5
			},
			vertical_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/ss800v_sheet.png",
				width = 256,
				height = 256,
				frame_count = 16,
				line_length = 4,
				shift = {0.5, 0.0},
				scale = 0.5
			}
		},
		-- MF Consumer
		-- small electric generator
		{
			type = "generator",
			name = "y-seg",
			icon_size = 32,
			icon = "__Yuoki__/graphics/entity/energy-t2/seg-s_icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 1, result = "y-seg"},
			max_health = 300,
			corpse = "small-remnants",
			effectivity = 0.95,
			fluid_usage_per_tick = 0.0668,
			resistances = {{type = "fire", percent = 70}},
			collision_box = {{-1.3, -0.9}, {1.3, 0.9}},
			selection_box = {{-1.5, -1.0}, {1.5, 1.0}},
			maximum_temperature = 150,
			fluid_box = {
				base_area = 1,
				height = 2,
				base_level = -1,
				pipe_connections = {
					{type = "input-output", position = {0, 1.5}},
					{type = "input-output", position = {0, -1.5}}
				},
				production_type = "input-output",
				filter = "y-mechanical-force"
			},
			fluid_input = {name = "y-mechanical-force", amount = 0.0, minimum_temperature = 70.0},
			energy_source = {
				type = "electric",
				usage_priority = "secondary-output"
			},
			horizontal_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/seg-ha-s2.png",
				width = 80,
				height = 90,
				frame_count = 18,
				line_length = 18,
				shift = {0.1, 0.1875}
			},
			vertical_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/seg-va-s.png",
				width = 112,
				height = 96,
				frame_count = 18,
				line_length = 18,
				shift = {0.4, 0.25}
			}
		},
		-- small electric generator - primary reduced continuance
		{
			type = "generator",
			name = "y-seg-p",
			icon_size = 32,
			icon = "__Yuoki__/graphics/entity/energy-t2/seg-p_icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 1, result = "y-seg-p"},
			max_health = 300,
			corpse = "small-remnants",
			effectivity = 0.95,
			fluid_usage_per_tick = 0.0668,
			resistances = {{type = "fire", percent = 70}},
			collision_box = {{-1.3, -0.9}, {1.3, 0.9}},
			selection_box = {{-1.5, -1.0}, {1.5, 1.0}},
			maximum_temperature = 150,
			fluid_box = {
				base_area = 1,
				height = 2,
				base_level = -1,
				pipe_connections = {
					{type = "input-output", position = {0, 1.5}},
					{type = "input-output", position = {0, -1.5}}
				},
				production_type = "input-output",
				filter = "y-mechanical-force"
			},
			fluid_input = {name = "y-mechanical-force", amount = 0.0, minimum_temperature = 70.0},
			energy_source = {
				type = "electric",
				usage_priority = "primary-output"
			},
			horizontal_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/segn_we_sheet.png",
				width = 256,
				height = 256,
				frame_count = 4,
				line_length = 4,
				shift = {1, 0.125},
				scale = 0.5,
				animation_speed = 0.5
			},
			vertical_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/segn_ns_sheet.png",
				width = 256,
				height = 256,
				frame_count = 4,
				line_length = 4,
				shift = {0.5, 0.1875},
				scale = 0.5,
				animation_speed = 0.5
			}
		},
		-- medium second electric generator
		{
			type = "generator",
			name = "y-meg-s",
			icon_size = 32,
			icon = "__Yuoki__/graphics/entity/energy-t2/meg-s-icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 1, result = "y-meg-s"},
			max_health = 400,
			corpse = "small-remnants",
			effectivity = 0.95,
			fluid_usage_per_tick = 0.1333334,
			collision_box = {{-2.3, -1.25}, {2.3, 1.25}},
			selection_box = {{-2.5, -1.5 }, {2.5, 1.50}},
			maximum_temperature = 150,
			fluid_box = {
				base_area = 1,
				height = 2,
				base_level = -1,
				pipe_connections = {
					{type = "input-output", position = {0, 2}},
					{type = "input-output", position = {0,-2}}
				},
				production_type = "input-output",
				filter = "y-mechanical-force"
			},
			fluid_input = {name = "y-mechanical-force", amount = 0.0, minimum_temperature = 50.0},
			energy_source = {
				type = "electric",
				usage_priority = "secondary-output"
			},
			horizontal_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/meg_219_ew_sheet.png",
				width = 192,
				height = 192,
				frame_count = 16,
				line_length = 4,
				shift = {0.46875, 0.34375}
			},
			vertical_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/meg_219_ns_sheet.png",
				width = 192,
				height = 192,
				frame_count = 16,
				line_length = 4,
				shift = {0.46875, -0.46875}
			}
		},
		-- big electric generator
		{
			type = "generator",
			name = "y-beg",
			icon_size = 32,
			icon = "__Yuoki__/graphics/entity/energy-t2/beg_icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 1, result = "y-beg"},
			max_health = 300,
			corpse = "big-remnants",
			effectivity = 0.92,
			fluid_usage_per_tick = 0.25,
			resistances = {{type = "fire", percent = 70}},
			collision_box = {{-2.3, -1.3}, {2.3, 1.3}},
			selection_box = {{-2.5, -1.5}, {2.5, 1.5}},
			maximum_temperature = 150,
			fluid_box = {
				base_area = 1,
				height = 2,
				base_level = -1,
				pipe_connections = {
					{type = "input-output", position = {0, 2}},
					{type = "input-output", position = {0, -2}}
				},
				production_type = "input-output",
				filter = "y-mechanical-force"
			},
			fluid_input = {name = "y-mechanical-force", amount = 0.0, minimum_temperature = 70.0},
			energy_source = {type = "electric", usage_priority = "secondary-output"},
			horizontal_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/beg-hac.png",
				width = 96,
				height = 160,
				frame_count = 18,
				line_length = 18,
				shift = {0.0, 0.0}
			},
			vertical_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/beg-vac.png",
				width = 160,
				height = 120,
				frame_count = 18,
				line_length = 9,
				shift = {0.015, 0.0}
			}
		},
		-- huge electric generator
		{
			type = "generator",
			name = "y-heg",
			icon_size = 32,
			icon = "__Yuoki__/graphics/entity/energy-t2/heg-icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 1, result = "y-heg"},
			max_health = 500,
			corpse = "big-remnants",
			effectivity = 0.88,
			fluid_usage_per_tick = 0.375,
			resistances = {{type = "fire", percent = 70}},
			collision_box = {{-3.3, -1.3}, {3.3, 1.3}},
			selection_box = {{-3.5, -1.5}, {3.5, 1.5}},
			maximum_temperature = 150,
			fluid_box = {
				base_area = 1,
				height = 2,
				base_level = -1,
				pipe_connections = {
					{type = "input-output", position = {0, 2}},
					{type = "input-output", position = {0, -2}}
				},
				production_type = "input-output",
				filter = "y-mechanical-force"
			},
			fluid_input = {name = "y-mechanical-force", amount = 0.0, minimum_temperature = 70.0},
			energy_source = {type = "electric", usage_priority = "secondary-output"},
			horizontal_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/heg-ha.png",
				width = 100,
				height = 224,
				frame_count = 18,
				line_length = 18,
				shift = {0.0, 0.0}
			},
			vertical_animation = {
				filename = "__Yuoki__/graphics/entity/energy-t2/heg-va.png",
				width = 224,
				height = 146,
				frame_count = 18,
				line_length = 9,
				shift = {0.00, -0.35}
			}
		},
		-- stirling solar-dish
		{
			type = "solar-panel",
			name = "y-stirling-solar-dish",
			icon_size = 32,
			icon = "__Yuoki__/graphics/icons/stir-solar-dish-icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {hardness = 0.2, mining_time = 0.5, result = "y-stirling-solar-dish"},
			max_health = 150,
			corpse = "medium-remnants",
			collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
			selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
			energy_source = {
				type = "electric",
				usage_priority = "solar"
			},
			picture = {
				filename = "__Yuoki__/graphics/entity/stir-solar-dish.png",
				priority = "high",
				width = 64,
				height = 64,
				shift = {0, 0}
			},
			production = "75kW"
		},
		-- Alien-Solar 1
		{
			type = "solar-panel",
			name = "y_alien_solar",
			icon_size = 32,
			icon = "__Yuoki__/graphics/entity/yi_alien_solar_icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 1.0, result = "y_alien_solar"},
			max_health = 500,
			corpse = "medium-remnants",
			collision_box = {{-3.7, -3.7}, {3.7, 3.7}},
			selection_box = {{-4, -4}, {4, 4}},
			energy_source = {
				type = "electric",
				usage_priority = "solar"
			},
			picture = {
				filename = "__Yuoki__/graphics/entity/solar_1_r21.png",
				priority = "high",
				width = 320,
				height = 320,
				shift = {1.0, -0.75}
			},
			production = "1600kW"
		},
		-- Alien-Solar 2
		{
			type = "solar-panel",
			name = "y_alien_solar2",
			icon_size = 32,
			icon = "__Yuoki__/graphics/entity/yi_alien_solar2_icon.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {hardness = 0.5, mining_time = 1.0, result = "y_alien_solar2"},
			max_health = 500,
			corpse = "medium-remnants",
			collision_box = {{-4.7, -4.7}, {4.7, 4.7}},
			selection_box = {{-5, -5}, {5, 5}},
			energy_source = {
				type = "electric",
				usage_priority = "solar"
			},
			picture = {
				filename = "__Yuoki__/graphics/entity/yi_alien_solar2.png",
				priority = "high",
				width = 448,
				height = 448,
				shift = {2, 0}
			},
			production = "3750kW"
		}
	}
)
