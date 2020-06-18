
data:extend({

	{
		type = "assembling-machine",
		name = "y_basement_factory",
		 icon_size = 32, icon =  "__Yuoki__/graphics/entity/base_factory_icon.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {hardness = 0.5, mining_time = 1, result = "y_basement_factory"},
		max_health = 400,
		resistances = {{type = "physical",percent = 50}},
		collision_box = {{-1.2,-1.2},{1.2,1.2}},
		selection_box = {{-1.5,-1.5},{1.5,1.5}},
		animation = {
			filename = "__Yuoki__/graphics/entity/base_factory_sheet.png",
			priority = "medium", width = 256, height = 256, frame_count = 6, shift = {0, 0}, scale=0.5, animation_speed=0.5,		
		},					
		crafting_categories = {"yrcat_basements"},
		crafting_speed = 1.0,
		energy_source = {type = "electric", input_priority = "secondary", usage_priority = "secondary-input", emissions = 0.005, },
		energy_usage = "1000kW",
		ingredient_count = 5,
		fluid_boxes =
		{
			off_when_no_fluid_recipe = true,			
			{
				production_type = "input",
				--pipe_covers = pipecoverspictures(),
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = { 0, 2} }}
			},
			{
				production_type = "output",
				--pipe_covers = pipecoverspictures(),				
				base_level = 1,
				pipe_connections = {{position = { 0, -2} }}
			},
		},
		module_specification =
		{
			module_slots = 1
		},
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
	},


})
