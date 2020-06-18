data:extend(
{

	{
		type = "fluid",
		name = "y-con_water",
		default_temperature = 20,
		heat_capacity = "1KJ",
		base_color = {r=1.0, g=1.0, b=0.2},
		flow_color = {r=0.9, g=0.9, b=0.2},
		max_temperature = 150,
		icon_size = 32, icon =  "__Yuoki__/graphics/icons/h2o_c2_icon.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.6,
		group = "yuoki",
		subgroup = "yuoki-archaeology",
		order = "y"
	},

	{
		type = "fluid",
		name = "y-liquid-uc2",
		default_temperature = 20,
		heat_capacity = "1KJ",
		base_color = {r=0.3, g=0.0, b=0.4},
		flow_color = {r=0.4, g=0.0, b=0.5},
		max_temperature = 250,
		-- icon_size = 32, icon =  "__Yuoki__/graphics/gfx/water-clean1.png",
		icon_size = 32, icon =  "__Yuoki__/graphics/icons/liquid_a2.png",
		pressure_to_speed_ratio = 0.2,
		flow_to_energy_ratio = 0.5,
		order = "y",
		group = "yuoki",
		subgroup = "y-energy",		
	},

	
	--mechanical force
	{
		type = "fluid", 
		name = "y-mechanical-force", 
		icon_size = 32, icon =  "__Yuoki__/graphics/icons/mf-1.png", 
		default_temperature = 15, 
		max_temperature = 500, 
		heat_capacity = "6KJ", 
		base_color = { r=1.0, g=1.0, b=1.0 }, 
		flow_color = { r=1.0, g=1.0, b=1.0 }, 
		pressure_to_speed_ratio = 0.125, 
		flow_to_energy_ratio = 0.025, 
		order = "y",
		group = "yuoki",
		subgroup = "y-energy",		
	},
	
	
})