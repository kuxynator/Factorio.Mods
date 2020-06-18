data:extend(
{
	{
		type = "item",
		name = "y-boiler-iv",
		 icon_size = 32, icon =  "__Yuoki__/graphics/icons/boiler-3m-icon.png",
		
		group="yuoki-energy", 
		subgroup = "y-boiler",
		order = "b[steam-power]-a3",
		place_result = "y-boiler-iv",
		stack_size = 10, default_request_amount = 5, 
	},	
	{
		type = "item",
		name = "y-obninsk-reactor",
		 icon_size = 32, icon =  "__Yuoki__/graphics/icons/obninsk-reactor-icon.png",
		
		group="yuoki-energy", 
		subgroup = "y-boiler",
		order = "b[steam-power]-a4",
		place_result = "y-obninsk-reactor",
		stack_size = 5,
	},
	{
		type = "item",
		name = "y-obninsk-turbine",
		 icon_size = 32, icon =  "__Yuoki__/graphics/icons/rensuir-turbine_icon.png",
		
		group = "yuoki-energy", subgroup = "y-boiler", order="s3",	
		place_result = "y-obninsk-turbine",
		stack_size = 5,
	},		
	{
		type = "item",
		name = "y-steam-turbine",
		icon_size = 32, icon =  "__Yuoki__/graphics/entity/steam_turbine_n3_icon.png",
		
		group = "yuoki-energy", subgroup = "y-boiler", order="s2",	
		place_result = "y-steam-turbine",
		stack_size = 20, default_request_amount = 5, 
	},
	{
		type = "item",
		name = "y-notfall-generator-s2",
		 icon_size = 32, icon =  "__Yuoki__/graphics/entity/energy-t2/lt-v2p-icon.png",
		
		group = "yuoki-energy", subgroup = "y-boiler", order="s1",	
		place_result = "y-notfall-generator-s2",
		stack_size = 25, default_request_amount = 5, 
	},

	
	-- small electric generator
	{
		type = "item",
		name = "y-seg", place_result = "y-seg", stack_size = 15, default_request_amount = 5, 
		icon_size = 32, icon =  "__Yuoki__/graphics/entity/energy-t2/seg-s_icon.png",		
		group = "yuoki-energy", subgroup = "y-boiler", order="g1",	
	},
	-- small electric generator
	{
		type = "item",
		name = "y-seg-p", place_result = "y-seg-p", stack_size = 15, default_request_amount = 5, 
		icon_size = 32, icon =  "__Yuoki__/graphics/entity/energy-t2/seg-p_icon.png",		
		group = "yuoki-energy", subgroup = "y-boiler", order="g2",	
	},
	
	-- medium-s electric generator
	{
		type = "item",
		name = "y-meg-s", place_result = "y-meg-s", stack_size = 15, default_request_amount = 5,
		icon_size = 32, icon =  "__Yuoki__/graphics/entity/energy-t2/meg-s-icon.png",		
		group = "yuoki-energy", subgroup = "y-boiler", order="g3",	
	},
	-- big electric generator
	{
		type = "item",
		name = "y-beg", place_result = "y-beg", stack_size = 15, default_request_amount = 5,
		icon_size = 32, icon =  "__Yuoki__/graphics/entity/energy-t2/beg_icon.png",		
		group = "yuoki-energy", subgroup = "y-boiler", order="g4",	
	},
	-- huge electric generator
	{
		type = "item",
		name = "y-heg", place_result = "y-heg", stack_size = 15, default_request_amount = 5,
		icon_size = 32, icon =  "__Yuoki__/graphics/entity/energy-t2/heg-icon.png",		
		group = "yuoki-energy", subgroup = "y-boiler", order="g5",	
	},


	
})