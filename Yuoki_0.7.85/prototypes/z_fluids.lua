
--automatically generated file | fMT-Export (c)YT v0.04-216Mrz03
--export-date: 2020-Jan-04

data:extend({

    --ID:23
    {
		type = "fluid", 
		name = "y-con_water", 
		icon_size = "32", 
		icon = "__Yuoki__/graphics/icons/h2o_c2_icon.png", 
		default_temperature = 20, 
		max_temperature = 100, 
		heat_capacity = "1KJ", 
		base_color = { r=1.0, g=1.0, b=0.2 }, 
		flow_color = { r=0.9, g=0.9, b=0.2 }, 
		pressure_to_speed_ratio = 0.400, 
		flow_to_energy_ratio = 0.590, 
		order = "y", 
		subgroup = "y-ammo", 
    },
    --ID:22
    {
		type = "fluid", 
		name = "y-liquid-uc2", 
		icon_size = "32", 
		icon = "__Yuoki__/graphics/icons/liquid_a2.png", 
		default_temperature = 20, 
		max_temperature = 250, 
		heat_capacity = "1KJ", 
		base_color = { r=0.3, g=0.0, b=0.4 }, 
		flow_color = { r=0.4, g=0.0, b=0.5 }, 
		pressure_to_speed_ratio = 0.200, 
		flow_to_energy_ratio = 0.500, 
		order = "y", 
		subgroup = "y-fluid", 
    },
    --ID:14
    {
		type = "fluid", 
		name = "y-mechanical-force", 
		icon_size = "32", 
		icon = "__Yuoki__/graphics/icons/mf-1.png", 
		default_temperature = 10, 
		max_temperature = 500, 
		heat_capacity = "6KJ", 
		base_color = { r=1.0, g=1.0, b=1.0 }, 
		flow_color = { r=1.0, g=1.0, b=1.0 }, 
		pressure_to_speed_ratio = 0.125, 
		flow_to_energy_ratio = 0.025, 
		order = "a", 
		subgroup = "y-fluid", 
    },
    --ID:20
    {
		type = "fluid", 
		name = "y_hydrogen", 
		icon_size = "32", 
		icon = "__Yuoki__/graphics/icons/obs/hydrogen_i32.png", 
		default_temperature = 20, 
		max_temperature = 100, 
		heat_capacity = "1KJ", 
		base_color = { r=0.3, g=0.6, b=0.3 }, 
		flow_color = { r=0.2, g=0.7, b=0.4 }, 
		pressure_to_speed_ratio = 0.400, 
		flow_to_energy_ratio = 0.590, 
		order = "a", 
		subgroup = "y-fluid", 
    },
    --ID:19
    {
		type = "fluid", 
		name = "y_syngas_raw", 
		icon_size = "32", 
		icon = "__Yuoki__/graphics/icons/obs/h2o_c_icon.png", 
		default_temperature = 20, 
		max_temperature = 100, 
		heat_capacity = "1KJ", 
		base_color = { r=0.7, g=0.0, b=0.7 }, 
		flow_color = { r=0.6, g=0.0, b=0.6 }, 
		pressure_to_speed_ratio = 0.400, 
		flow_to_energy_ratio = 0.590, 
		order = "a", 
		subgroup = "y-fluid", 
    },

})