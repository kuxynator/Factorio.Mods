data:extend(
{
	-- signal conncetor
	{
		type = "electric-pole",
		name = "y_signal_pole",
		 icon_size = 32, icon =  "__Yuoki__/graphics/entity/signal_pole_icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y_signal_pole"},
		max_health = 250,
		corpse = "medium-remnants", resistances = {{type = "fire",percent = 90}},
		collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		drawing_box = {{-0.5, -1.5}, {0.5, 0.5}},
		maximum_wire_distance = 48,
		supply_area_distance = 1.5,
		pictures =
		{
			filename = "__Yuoki__/graphics/entity/signal_pole.png",
			priority = "high",
			width = 160,
			height = 160,
			axially_symmetrical = false,
			direction_count = 1,
			shift = {1.5, -1.625}
		},
		connection_points =
		{
			{
				shadow =
				{
					copper = {3.5, 0.30},
					green = {3.5, 0.30},
					red = {3.5, 0.30}
				},
				wire =
				{
					copper = {0, -3.125},
					green = {-0.2,-3.125},
					red = {0.2,-3.125}
				}
			},
		},
		copper_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		green_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		
		radius_visualisation_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
			width = 12,
			height = 12,
		},
		
		red_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		wire_shadow_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
			priority = "high",
			width = 224,
			height = 46
		}
	},
	
	
	
	{
		type = "electric-pole",
		name = "y-substation-m",
		 icon_size = 32, icon =  "__Yuoki__/graphics/icons/substation-icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-substation-m"},
		max_health = 250,
		corpse = "medium-remnants", resistances = {{type = "fire",percent = 90}},
		collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
		selection_box = {{-1, -1}, {1, 1}},
		drawing_box = {{-1, -1.5}, {1, 1}},
		maximum_wire_distance = 48,
		supply_area_distance = 16,
		pictures =
		{
			filename = "__Yuoki__/graphics/entity/substation-mn.png",
			priority = "high",
			width = 192,
			height = 192,
			axially_symmetrical = false,
			direction_count = 1,
			shift = {1.9375, -2}
		},
		connection_points =
		{
			{
				shadow =
				{
					copper = {3.5, 0.30},
					green = {3.5, 0.30},
					red = {3.5, 0.30}
				},
				wire =
				{
					copper = {0, -4.5},
					green = {-0.2,-4.5},
					red = {0.2,-4.5}
				}
			},
		},
		copper_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		green_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		radius_visualisation_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
			width = 12,
			height = 12,
			priority = "extra-high-no-scale",
		},
		red_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		wire_shadow_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
			priority = "high",
			width = 224,
			height = 46
		}
	},

	{
		type = "electric-pole",
		name = "y-substation-h",
		 icon_size = 32, icon =  "__Yuoki__/graphics/entity/substation-h-icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-substation-h"},
		max_health = 250,
		corpse = "medium-remnants", resistances = {{type = "fire",percent = 90}},
		collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
		selection_box = {{-1, -1}, {1, 1}},
		drawing_box = {{-1, -1.5}, {1, 1}},
		maximum_wire_distance = 64,
		supply_area_distance = 32,
		pictures =
		{
			filename = "__Yuoki__/graphics/entity/substation-h.png",
			priority = "high",
			width = 192,
			height = 192,
			axially_symmetrical = false,
			direction_count = 1,
			shift = {1.9375, -2}
		},
		connection_points =
		{
			{
				shadow =
				{
					copper = {3.5, 0.30},
					green = {3.5, 0.30},
					red = {3.5, 0.30}
				},
				wire =
				{
					copper = {0, -4.5},
					green = {-0.2,-4.5},
					red = {0.2,-4.5}
				}
			},
		},
		copper_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		green_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		radius_visualisation_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
			width = 12,
			height = 12,
			priority = "extra-high-no-scale",
		},
		red_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		wire_shadow_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
			priority = "high",
			width = 224,
			height = 46
		}
	},
	
	{
		type = "accumulator",
		name = "y-accumulator-m",
		 icon_size = 32, icon =  "__Yuoki__/graphics/gfx/medium_accu_icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-accumulator-m"},
		max_health = 250,
		corpse = "medium-remnants",
		collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
		selection_box = {{-1, -1}, {1, 1}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "8MJ",
			usage_priority = "tertiary",
			input_flow_limit = "400kW",
			output_flow_limit = "400kW"
		},
		picture =
		{
			filename = "__Yuoki__/graphics/gfx/accu_m1n_idle.png",
			priority = "extra-high",
			width = 256,
			height = 256,
			shift = {0, 0},
			scale = 0.5,
		},
		charge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/accu_m_green_sheet.png",
			width = 256,
			height = 256,
			line_length = 6,
			frame_count = 6,
			shift = {0, 0},
			animation_speed = 0.25,
			scale = 0.5, 
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0.3, size = 11},
		discharge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/accu_m_red_sheet.png",
			width = 256,
			height = 256,
			line_length = 6,
			frame_count = 6,
			shift = {0, 0},
			animation_speed = 0.25,
			scale = 0.5, 
		},
		discharge_cooldown = 60,
		discharge_light = {intensity = 0.7, size = 11},		
		circuit_wire_connection_point =
		{
			shadow =
			{
				red = {0.984375, 1.10938},
				green = {0.890625, 1.10938}
			},
			wire =
			{
				red = {0.6875, 0.59375},
				green = {0.6875, 0.71875}
			}
		},
		--circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
		circuit_wire_max_distance = 15.5,
		default_output_signal = {type = "virtual", name = "signal-A"},
	},  
	{
		type = "accumulator",
		name = "y-accumulator-b",
		 icon_size = 32, icon =  "__Yuoki__/graphics/gfx/accu_b_icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-accumulator-b"},
		max_health = 300,
		corpse = "medium-remnants",
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "30MJ",
			usage_priority = "tertiary",
			input_flow_limit = "1000kW",
			output_flow_limit = "1000kW"
		},
		picture =
		{
			filename = "__Yuoki__/graphics/gfx/accu_b_idle_r18.png",
			priority = "extra-high",
			width = 256, height = 256, shift = {0.375, -0.375}, scale = 0.5,
		},
		charge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/acc_big_load_sheet.png",
			width = 256, height = 256, shift = {0.375, -0.375}, scale = 0.5, 
			frame_count=16, line_length=4, animation_speed = 0.5,
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0.5, size = 35, color={0.7,1.0,1.0}},
		discharge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/acc_big_unload_sheet.png",
			width = 256, height = 256, shift = {0.375, -0.375}, scale = 0.5, 
			frame_count=16, line_length=4, animation_speed = 0.5,
		},
		discharge_cooldown = 60,
		discharge_light = {intensity = 0.7, size = 35},		
		circuit_wire_connection_point =
		{
			shadow =
			{
				red = {0.984375, 1.10938},
				green = {0.890625, 1.10938}
			},
			wire =
			{
				red = {0.6875, 0.59375},
				green = {0.6875, 0.71875}
			}
		},
		--circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
		circuit_wire_max_distance = 22.5,
		default_output_signal = {type = "virtual", name = "signal-A"},
		
	},  

	-- tier 1.5		
	{
		type = "accumulator",
		name = "y-ups-flywheel-b",
		icon_size = 32, icon =  "__Yuoki__/graphics/gfx/accflywheel_b_icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-ups-flywheel-b"},
		max_health = 250,
		corpse = "medium-remnants",
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "15MJ",
			usage_priority = "tertiary",
			input_flow_limit = "300kW",
			output_flow_limit = "1500kW",
		},
		picture =
		{
			filename = "__Yuoki__/graphics/gfx/accflywheel_bn_idle.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = {0.5, -0.5}
		},
		charge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/accflywheel_bn_load.png",
			width = 128,
			height = 128,
			frame_count=1,
			shift = {0.5, -0.5}
			--animation_speed = 0.2,
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0.3, size = 15},
		discharge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/accflywheel_bn_unload.png",
			width = 128,
			height = 128,
			frame_count=1,
			shift = {0.5, -0.5}
			--animation_speed = 0.2,
		},
		discharge_cooldown = 60,
		discharge_light = {intensity = 0.7, size = 15},
		circuit_wire_connection_point =
		{
			shadow =
			{
				red = {0.984375, 1.10938},
				green = {0.890625, 1.10938}
			},
			wire =
			{
				red = {0.6875, 0.59375},
				green = {0.6875, 0.71875}
			}
		},
		--circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
		circuit_wire_max_distance = 15.5,
		default_output_signal = {type = "virtual", name = "signal-A"},
		
	},  
		
	{
		type = "accumulator",
		name = "y-accumulator-m-t2",
		 icon_size = 32, icon =  "__Yuoki__/graphics/gfx/mcd-icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-accumulator-m-t2"},
		max_health = 250,
		corpse = "medium-remnants",
		collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
		selection_box = {{-1, -1}, {1, 1}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "15MJ",
			usage_priority = "tertiary",
			input_flow_limit = "600kW",
			output_flow_limit = "600kW"
		},
		picture =
		{
			filename = "__Yuoki__/graphics/gfx/mcd-idle-e.png",
			priority = "extra-high",
			width = 100,
			height = 100,
			shift = {0.35, -0.4},
		},
		charge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/mcd-load-e.png",
			width = 100,
			height = 100,
			line_length = 1,
			frame_count = 1,
			shift = {0.35, -0.4},
			--animation_speed = 0.2,
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0.3, size = 11},
		discharge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/mcd-unload-e.png",
			width = 100,
			height = 100,
			line_length = 1,
			frame_count = 1,
			shift = {0.35, -0.4},
			--animation_speed = 0.2,
		},
		discharge_cooldown = 60,
		discharge_light = {intensity = 0.7, size = 11},
		circuit_wire_connection_point =
		{
			shadow =
			{
				red = {0.984375, 1.10938},
				green = {0.890625, 1.10938}
			},
			wire =
			{
				red = {0.6875, 0.59375},
				green = {0.6875, 0.71875}
			}
		},
		--circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
		circuit_wire_max_distance = 15.5,
		default_output_signal = {type = "virtual", name = "signal-A"},
		
	},  
	{
		type = "accumulator",
		name = "y-accumulator-b-t2",
		 icon_size = 32, icon =  "__Yuoki__/graphics/gfx/bcd-icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-accumulator-b-t2"},
		max_health = 300,
		corpse = "medium-remnants",
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "45MJ",
			usage_priority = "tertiary",
			input_flow_limit = "1500kW",
			output_flow_limit = "1500kW"
		},
		picture =
		{
			filename = "__Yuoki__/graphics/gfx/bcd-idle-e.png",
			priority = "extra-high",
			width = 140,
			height = 122,
			shift = {0.7, -0.3}
		},
		charge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/bcd-load-e.png",
			width = 140,
			height = 122,
			frame_count=1,
			shift = {0.7, -0.3},			
			--animation_speed = 0.2,
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0.3, size = 15},
		discharge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/bcd-unload-e.png",
			width = 140,
			height = 122,
			frame_count=1,
			shift = {0.7, -0.3},
			--animation_speed = 0.2,
		},
		discharge_cooldown = 60,
		discharge_light = {intensity = 0.7, size = 15},
		circuit_wire_connection_point =
		{
			shadow =
			{
				red = {0.984375, 1.10938},
				green = {0.890625, 1.10938}
			},
			wire =
			{
				red = {0.6875, 0.59375},
				green = {0.6875, 0.71875}
			}
		},
		--circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
		circuit_wire_max_distance = 15.5,
		default_output_signal = {type = "virtual", name = "signal-A"},
		
	},  
	{
		type = "accumulator",
		name = "y-accumulator-b-tx",
		icon_size = 32, icon =  "__Yuoki__/graphics/gfx/aqe-icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-accumulator-b-tx"},
		max_health = 300,
		corpse = "medium-remnants",
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "150MJ",
			usage_priority = "tertiary",
			input_flow_limit = "1500kW",
			output_flow_limit = "3000kW"
		},
		picture =
		{
			filename = "__Yuoki__/graphics/gfx/aqe-idle-e.png",
			priority = "extra-high",
			width = 140,
			height = 115,
			shift = {0.625, 0},
		},
		charge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/aqe-load-e.png",
			width = 140,
			height = 115,
			shift = {0.625, 0},
			frame_count=1,
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0.3, size = 15},
		discharge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/aqe-unload-e.png",
			width = 140,
			height = 115,
			shift = {0.625, 0},
			frame_count=1,
		},
		discharge_cooldown = 60,
		discharge_light = {intensity = 0.7, size = 15},
		circuit_wire_connection_point =
		{
			shadow =
			{
				red = {0.984375, 1.10938},
				green = {0.890625, 1.10938}
			},
			wire =
			{
				red = {0.6875, 0.59375},
				green = {0.6875, 0.71875}
			}
		},
		--circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
		circuit_wire_max_distance = 15.5,
		default_output_signal = {type = "virtual", name = "signal-A"},
		
	},  
	
	{
		type = "accumulator",
		name = "y-accumulator-crystal-m",
		icon_size = 32, icon =  "__Yuoki__/graphics/gfx/accu_crystal-m-icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y-accumulator-crystal-m"},
		max_health = 350,
		corpse = "medium-remnants",
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "250MJ",
			usage_priority = "tertiary",
			input_flow_limit = "2500kW",
			output_flow_limit = "5000kW"
		},
		picture =
		{
			filename = "__Yuoki__/graphics/gfx/accu_crystal-nidle.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = {0.5, -0.5},
		},
		charge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/accu_crystal-nload.png",
			width = 128,
			height = 128,
			shift = {0.5, -0.5},
			line_length = 1,
			frame_count = 1,			
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0.3, size = 25},
		discharge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/accu_crystal-nunload.png",
			width = 128,
			height = 128,
			shift = {0.5, -0.5},
			line_length = 1,
			frame_count = 1,			
		},
		discharge_cooldown = 60,
		discharge_light = {intensity = 0.7, size = 25},
		circuit_wire_connection_point =
		{
			shadow =
			{
				red = {0.984375, 1.10938},
				green = {0.890625, 1.10938}
			},
			wire =
			{
				red = {0.6875, 0.59375},
				green = {0.6875, 0.71875}
			}
		},
		--circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
		circuit_wire_max_distance = 15.5,
		default_output_signal = {type = "virtual", name = "signal-A"},
		
	},  	
	
	-- compensator
	{
		type = "accumulator",
		name = "y_compensator_25",
		 icon_size = 32, icon =  "__Yuoki__/graphics/gfx/compensator25-icon.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 1, result = "y_compensator_25"},
		max_health = 400,
		corpse = "medium-remnants",
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "20MJ",
			usage_priority = "tertiary",
			input_flow_limit = "1255kW",
			output_flow_limit = "1250kW"
		},
		picture =
		{
			filename = "__Yuoki__/graphics/gfx/compensator25_idle.png",
			priority = "extra-high",
			width = 160,
			height = 160,
			shift = {0, -0.875},
			line_length = 1,
			frame_count = 1,			
		},
		charge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/comp25c.png",
			width = 160,
			height = 160,
			shift = {0, -0.875},
			line_length = 7,
			frame_count = 7,			
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0.5, size = 25},
		discharge_animation =
		{
			filename = "__Yuoki__/graphics/gfx/comp25d.png",
			width = 160,
			height = 160,
			shift = {0, -0.875},
			line_length = 7,
			frame_count = 7,			
		},
		discharge_cooldown = 30,
		discharge_light = {intensity = 0.7, size = 25},
		circuit_wire_connection_point =
		{
			shadow =
			{
				red = {0.984375, 1.10938},
				green = {0.890625, 1.10938}
			},
			wire =
			{
				red = {0.6875, 0.59375},
				green = {0.6875, 0.71875}
			}
		},
		--circuit_connector_sprites = get_circuit_connector_sprites({0.46875, 0.5}, {0.46875, 0.8125}, 26),
		circuit_wire_max_distance = 15.5,
		default_output_signal = {type = "virtual", name = "signal-A"},
		
	},  	
	
	
	
})