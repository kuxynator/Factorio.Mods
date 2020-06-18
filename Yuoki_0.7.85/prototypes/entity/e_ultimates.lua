data:extend(
{  

	-- stargate object	
	{
		type = "assembling-machine",
		name = "y-stargate", minable = {hardness = 0.2,mining_time = 0.5,result = "y-stargate"},
		 icon_size = 32, icon =  "__Yuoki__/graphics/icons/laika-gate-icon.png",
		flags = {"placeable-neutral","player-creation"},		
		max_health = 200,
		resistances = {{type = "fire",percent = 70}},
		collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
		selection_box = {{-2.0, -2.0}, {2.0, 2.0}},
		animation = {
			filename = "__Yuoki__/graphics/entity/laika.png",
			priority = "medium",
			width = 160,
			height = 160,
			frame_count = 1,						
			shift = {0.5, -0.5}
		},					
		crafting_categories = {"yuoki-stargate-recipe"},
		crafting_speed = 1,
		energy_source = {type = "electric",input_priority = "secondary", usage_priority = "secondary-input", emissions = 0.0002},
		energy_usage = "25MW",
		ingredient_count = 4,
		order="laika-gate",
	},
	
	{
		type = "assembling-machine",
		name = "y-fame-gen", minable = {hardness = 0.2,mining_time = 0.5,result = "y-fame-gen"},
		 icon_size = 32, icon =  "__Yuoki__/graphics/entity/thanks-icon.png",
		flags = {"placeable-neutral","player-creation"},		
		max_health = 500,
		resistances = {{type = "fire",percent = 70}},
		collision_box = {{-2.6, -2.6}, {2.6, 2.6}},
		selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
		animation = {
			filename = "__Yuoki__/graphics/entity/thanks-sheet.png",
			priority = "medium",
			width = 192,
			height = 192,
			frame_count = 12,		
			line_length =6,
			shift = {0.0, -0.0},
			animation_speed=0.1,
		},					
		crafting_categories = {"yuoki-fame-recipe"},
		crafting_speed = 1,
		energy_source = {type = "electric",input_priority = "secondary", usage_priority = "secondary-input", emissions = 0.005},
		energy_usage = "2MW",
		ingredient_count = 1,		
	},	

	{
		type = "recipe",
		name = "ye_science_ultimate_recipe",
		ingredients = {{"ye_science_blue", 30000},},
		result = "ye_science_ultimate",
		group = "yuoki-energy", subgroup = "y_ultimate_products",					
		order="a0",
	},		
	
	{
		type="item", name="ye_science_ultimate",  icon_size = 32, icon = "__Yuoki__/graphics/entity/ultimate_science_icon.png",
		group="yuoki-energy", subgroup="y_ultimate_products", order="a0", place_result = "ye_science_ultimate", 
		stack_size = 1, default_request_amount = 1,
	},	
	
	{
		type = "radar",
		name = "ye_science_ultimate",
		 icon_size = 32, icon =  "__Yuoki__/graphics/entity/ultimate_science_icon.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "ye_science_ultimate"},
		max_health = 7000,
		corpse = "big-remnants",
		collision_box = {{-5.3, -6.2}, {5.3, 6.2}},
		selection_box = {{-5.5, -6.5}, {5.5, 6.5}},
		energy_per_sector = "5MJ",
		max_distance_of_sector_revealed = 60,
		max_distance_of_nearby_sector_revealed = 10,
		energy_per_nearby_scan = "500kJ",
		radius_minimap_visualisation_color = { r = 0.059, g = 0.092, b = 0.235, a = 0.275 },
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input"
		},
		energy_usage = "50MW",
					
		pictures = {
			filename = "__Yuoki__/graphics/entity/blue_ultimate_sheet.png",
			priority = "low",
			width = 480,
			height = 480,
			apply_projection = false,
			direction_count = 16,
			line_length = 4,
			shift = {2, -1},
			animation_speed = 0.5,			
		},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound = { sound = {{filename = "__base__/sound/radar.ogg"}},apparent_volume = 1.5,},
	},

	
	{
		type = "recipe",
		name = "y_trade_ultimate_recipe",
		ingredients = {{"ypfw_trader_sign", 50000},},
		--ingredients = {{"iron-plate", 1},},
		result = "y_trade_ultimate",
		group = "yuoki-energy", subgroup = "y_ultimate_products",					
		order="a2",
	},			
	{
		type="item", name="y_trade_ultimate",  icon_size = 32, icon = "__Yuoki__/graphics/entity/trade_ultimate_icon.png", 
		group="yuoki-energy", subgroup="y_ultimate_products", order="a2", place_result = "y_trade_ultimate", 
		stack_size = 1, default_request_amount = 1,
	},	
	{
		type = "assembling-machine",
		name = "y_trade_ultimate",
		 icon_size = 32, icon = "__Yuoki__/graphics/entity/trade_ultimate_icon.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "y_trade_ultimate"},
		max_health = 5000,
		corpse = "big-remnants",
		resistances = {{type = "physical",percent = 60},},
		collision_box = {{-5.2, -6.2}, {5.2, 5.2}},
		selection_box = {{-5.5, -6.5}, {5.5, 5.5}},
		--fast_replaceable_group = "assembling-machine",		
		animation =
		{			
			filename = "__Yuoki__/graphics/entity/trade_ultimate.png",			
			width = 416,
			height = 416,
			shift = {1, -1},
			frame_count = 1,
			line_length = 1,			
			--animation_speed = 0.25,
			--scale = 0.5,
		},		
		crafting_categories = {"yuoki_trader_ultimate",},
		crafting_speed = 1.0,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions = 0.0025
		},
		energy_usage = "50MW",
		ingredient_count = 6,				
		--module_specification = { module_slots = 0,},
		--allowed_effects = {"consumption", "speed", "productivity", "pollution"},				
		order="a2",
		subgroup = "y_ultimate_products",
	},	
})	