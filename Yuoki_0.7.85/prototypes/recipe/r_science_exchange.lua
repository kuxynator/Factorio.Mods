data:extend(
{
	
	{
	  type = "recipe",
	  name = "y_military_science_recipe",
	  category = "yuoki-atomics-recipe", -- 
	  enabled = "true",
	  energy_required = 3.00,
	  ingredients = {
	  	{ type = "item", name = "y_wall22_hardic", amount = 1.0, },
	  	{ type = "item", name = "y-ammo-hohlspitz", amount = 5.0, },
	  },
	  results = {
		{ type = "item", name = "military-science-pack", amount = 1.0, },
	  },
	  main_product = "military-science-pack",
	  icon = "__base__/graphics/icons/military-science-pack.png",
	  icon_size = 32,  
	  order = "1", group = "yuoki-atomics", subgroup = "y-stargate-4",
	},		
	{
	  type = "recipe",
	  name = "y_chemical_science_recipe",
	  category = "yuoki-atomics-recipe", -- 
	  enabled = "true",
	  energy_required = 3.00,
	  ingredients = {
	  	{ type = "item", name = "y-fuel-reactor", amount = 2.0, },
	  	{ type = "item", name = "y-chip-1", amount = 3.0, },
	  	{ type = "item", name = "engine-unit", amount = 1.0, },
	  },
	  results = {
		{ type = "item", name = "chemical-science-pack", amount = 1.0, },
	  },
	  main_product = "chemical-science-pack",
	  icon = "__base__/graphics/icons/chemical-science-pack.png",
	  icon_size = 32,  
	  order = "2", group = "yuoki-atomics", subgroup = "y-stargate-4",
	},		

	{
	  type = "recipe",
	  name = "y_production_science_recipe",
	  category = "yuoki-atomics-recipe", -- 
	  enabled = "true",
	  energy_required = 4.00,
	  ingredients = {
	  	{ type = "item", name = "y_toolhead", amount = 1.0, },
	  	{ type = "item", name = "y-pink-module-1", amount = 2.0, },
	  	{ type = "item", name = "y-inserter-fast", amount = 2.0, },
	  	{ type = "item", name = "y_rwtechsign", amount = 2.0, },
	  },
	  results = {
		{ type = "item", name = "production-science-pack", amount = 1.0, },
	  },
	  main_product = "production-science-pack",
	  icon = "__base__/graphics/icons/production-science-pack.png",
	  icon_size = 32,  
	  order = "3", group = "yuoki-atomics", subgroup = "y-stargate-4",
	},		

	{
	  type = "recipe",
	  name = "y_high-tech_science_recipe",
	  category = "yuoki-atomics-recipe", -- 
	  enabled = "true",
	  energy_required = 6.00,
	  ingredients = {
	  	{ type = "item", name = "y-battery-single-use3", amount = 3.0, },
	  	{ type = "item", name = "y-chip-2", amount = 3.0, },
	  	{ type = "item", name = "y-basic-t2-mf", amount = 2.0, },
	  	{ type = "item", name = "y_rwtechsign", amount = 4.0, },	  
	  },
	  results = {
		{ type = "item", name = "utility-science-pack", amount = 1.0, },
	  },
	  main_product = "utility-science-pack",
	  icon = "__base__/graphics/icons/utility-science-pack.png",
	  icon_size = 32,  
	  order = "4", group = "yuoki-atomics", subgroup = "y-stargate-4",
	},		
	{
	  type = "recipe",
	  name = "y_space_science_recipe",
	  category = "yuoki-atomics-recipe", -- 
	  enabled = "true",
	  energy_required = 10.00,
	  ingredients = {
	  	{ type = "item", name = "ypfw_trader_sign", amount = 6000.0, },	  
	  },
	  results = {
		{ type = "item", name = "space-science-pack", amount = 3.0, },
	  },
	  main_product = "space-science-pack",
	  icon = "__base__/graphics/icons/space-science-pack.png",
	  icon_size = 32,  
	  order = "5", group = "yuoki-atomics", subgroup = "y-stargate-4",
	},		
	
})