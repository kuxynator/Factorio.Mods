require("utilValidate")

-- Yi-Core Overlap
if data.raw.recipe["ye_green_ultimate_recipe"] then
	table.insert(data.raw.technology["yi-ultimate-reputation"].effects, {type = "unlock-recipe", recipe = "ye_green_ultimate_recipe"})
end
if data.raw.recipe["y_unlimited_wood"] then
	table.insert(data.raw.technology["yi-ultimate-reputation"].effects, {type = "unlock-recipe", recipe = "y_unlimited_wood"})
end
if data.raw.recipe["ye_granulate_trifitan_recipe"] then
	table.insert(data.raw.technology["yi-organic-oil-atomics"].effects, {type = "unlock-recipe", recipe = "ye_granulate_trifitan_recipe"})
end
if data.raw.recipe["ye_granulate_vuger_recipe"] then
	table.insert(data.raw.technology["yi-organic-oil-atomics"].effects, {type = "unlock-recipe", recipe = "ye_granulate_vuger_recipe"})
end
if data.raw.recipe["ye_granulate_corn_recipe"] then
	table.insert(data.raw.technology["yi-organic-oil-atomics"].effects, {type = "unlock-recipe", recipe = "ye_granulate_corn_recipe"})
end
if data.raw.recipe["ye_biofuel_recipe"] then
	table.insert(data.raw.technology["yi-organic-oil-atomics"].effects, {type = "unlock-recipe", recipe = "ye_biofuel_recipe"})
end
if data.raw.recipe["ye_slurry2ethanol_recipe"] then
	table.insert(data.raw.technology["yi-organic-oil-atomics"].effects, {type = "unlock-recipe", recipe = "ye_slurry2ethanol_recipe"})
end

if data.raw.recipe["yie_import_sealing_recipe"] then
	table.insert(data.raw.technology["yi-ultimate-reputation"].effects, {type = "unlock-recipe", recipe = "yie_import_sealing_recipe"})
end

if data.raw.recipe["yie_import_blech_blau_recipe"] then
	table.insert(data.raw.technology["yi-ultimate-reputation"].effects, {type = "unlock-recipe", recipe = "yie_import_blech_blau_recipe"})
end

--table.insert(data.raw.technology["xxxx"].effects, {type = "unlock-recipe", recipe = "yyyy"})
local tiers = {}

-- Tier 2
table.insert(tiers, 
	{
		{
			type = "technology",
			name = "yi-basic-mechanical-force",
			icon = "__yi_engines__/graphics/entity/pump-icon.png",
			icon_size = 32, prerequisites = {"yi-intermediates", "engine"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-shaft-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-shaft-ground-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-shaft-r-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-shaft-ground-r-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yie_hard_metals_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-iron-case-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-winding-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mwater-pump-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mfwater-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-1stirling-engine-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-emotor-s-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf1c-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-electric-air-heater-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-rmvpol-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-waste-condense-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-gearbox-power-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf2b-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf2a-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_water2mf_recipe"
				},
				{
				type = "unlock-recipe",
				recipe = "ye_emotor_m_recipe"
				},
				{
				type = "unlock-recipe",
				recipe = "y_mpump_water_recipe"
				},
				{
				type = "unlock-recipe",
				recipe = "y_mpump_mf_recipe"
				},
				{
				type = "unlock-recipe",
				recipe = "ye_motorm_mf_recipe"
				},
				
				
			  
			},
			unit =
			{
			  count = 20,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
			  },
			  time = 30
			},
			order = "y"
		},
		
	}
)

-- Tier 3
table.insert(tiers, 
	{
		{
			type = "technology",
			name = "yi-intermediate-mechanical-force",
			icon = "__yi_engines__/graphics/entity/energy2/turbine_icon.png",
			icon_size = 32, prerequisites = {"yi-basic-mechanical-force", "yi-basic-machines", "circuit-network"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "yie_science_blue_gen_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_science_blue_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-sfe-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf1a-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf1a1-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_overheater_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_makesteam_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_sturbine_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_steam2mf_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_tfmw_generator-s-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_fassembly1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_fassembly2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_fassembly_sp_recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y-mf1f-recipe"
				},


			},
			unit =
			{
			  count = 20,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-basic-farming",
			icon = "__yi_engines__/graphics/entity/farm-icon.png",
			icon_size = 32, prerequisites = {"yi-basic-mechanical-force","yi-basic-machines"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "ye_farm_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye-seed_a1-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye-seed_a2-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye-growcorn-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye-growcorn_ws-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_seed_b_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_cornb_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_cornb_ws_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_celluose_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_sugar_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_biomixed_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_synwood_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye-corn2fluid-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye-cf2lubricant-recipe"
			  },

			},
			unit =
			{
			  count = 20,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-basic-transport",
			icon = "__yi_engines__/graphics/icons/ubo_icon.png",
			icon_size = 32, prerequisites = {"yi-basic-mechanical-force"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "ye_tranport_tube_orange_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_tranport_tube_orange_underground_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_tranport_tube_orange_splitter_recipe"
			  },
			},
			unit =
			{
			  count = 20,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
			  },
			  time = 30
			},
			order = "y"
		},
		
	}
)


-- Tier 4
table.insert(tiers, 
	{
		{
			type = "technology",
			name = "yi-fluid-handling-mechanical-force",
			icon = "__yi_engines__/graphics/canister.png",
			icon_size = 32, prerequisites = {"yi-basic-mechanical-force","yi-fluid-handling", "yi-basic-farming"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "ye_canmachine_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_sealing"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_canister_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_canister2plates_smelt"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_cw_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_unicomp_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_petrol_fill_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_co_fill_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_ho_fill_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_sa_fill_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_blood_fill_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_lub_fill"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_mf_fill"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_slurry_fill"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_veg_fill"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_eth_fill"
			  },
			  
			  {
				type = "unlock-recipe",
				recipe = "ye_can_uc_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_cw_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_eth_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_lub_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_veg_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_mf_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_slurry_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_blood_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_sa_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_ho_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_co_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_can_petrol_empty_recipe"
			  },
			},
			unit =
			{
			  count = 20,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-basic-ranching",
			icon = "__yi_engines__/graphics/entity/cage_empty_icon.png",
			icon_size = 32, prerequisites = {"yi-basic-farming"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "ye_meatfarm_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_grow_animal_a"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_dna_animal0_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_cooking_meat"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_pool_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_grow_fish1"
			  },
			},
			unit =
			{
			  count = 20,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-advanced-mechanical-force",
			icon = "__yi_engines__/graphics/entity/energy2/qr-icon.png",
			icon_size = 32, prerequisites = {"yi-intermediate-mechanical-force",  "yi-advanced-machines"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-ffe-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf1b-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf1d-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf1e-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-quantrinum-reactor_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_center_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_rheinsberg_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-quantrinum-charge-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf1-q1-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf1-q2-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mf1-q3-recipe"
			  },
			},
			unit =
			{
			  count = 100,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			  },
			  time = 30
			},
			order = "y"
		},
	}
)


-- Tier 5
table.insert(tiers, 
	{
		{
			type = "technology",
			name = "yi-dna",
			icon = "__yi_engines__/graphics/entity/dna_splicer_icon.png",
			icon_size = 32, prerequisites = {"yi-basic-ranching", "yi-advanced-machines"},
			effects =
			{
			
			  {
				type = "unlock-recipe",
				recipe = "ye_dnasplicer_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_dna_plant0_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_dna_plant1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_dna_plant3_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_dna_plant4_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_dna_animal1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_dna_animal2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_dna_animal3_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_dna_animal4_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_grow_plant1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_grow_plant2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_grow_animal2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_grow_animal3_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_grow_animal3fast_recipe"
			  },
			  
			  {
				type = "unlock-recipe",
				recipe = "ye_grow_animal4_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_fish2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_fish3_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_fish4_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_neutralisatzion_recipe"
			  },
			  
			  {
				type = "unlock-recipe",
				recipe = "ye_futtermittel_b_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_futtermittel_a_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_dna_fish2_recipe"
			  },
			  
			  {
				type = "unlock-recipe",
				recipe = "yie_bloodfrommeat_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_smoker_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_smoked_meat_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_smoked_fish_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_futtermittel_d_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_futtermittel_c_recipe"
			  },

			},
			unit =
			{
			  count = 100,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			  },
			  time = 30
			},
			order = "y"
		},
		
	}
)

-- Tier 6
table.insert(tiers, 
	{
		{
			type = "technology",
			name = "yi-engines-trade",
			icon = "__yi_engines__/graphics/icons/package_empty.png",
			icon_size = 32, prerequisites = {"yi-dna", "yi-reputation"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "ye_trade_node_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_icemaker_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_ice_container_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_ice_container_filled_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_export01_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_export02_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_export03_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_export04_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_export05_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_export06_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_trademeat1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_trademeat2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_tradeblood_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_export_fish1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_export_fish2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_weiss_export_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_rosa_export_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_fleisch_export_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_gelb_export_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_blau_export_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_carni_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_spliced_cells_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_verotin_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_omtrinit_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_organic_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_substratin_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_c_meat_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_r_meat_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_fish1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_package_fish2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_empty_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_white_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_rosa_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_braun_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_gelb_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_buechse_blau_recipe"
			  },
			  
			},
			unit =
			{
			  count = 100,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-advanced-transport",
			icon = "__yi_engines__/graphics/icons/ubg_icon.png",
			icon_size = 32, prerequisites = {"yi-dna", "yi-basic-transport"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "ye_buechsenblech_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_tranport_tube_green_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_tranport_tube_green_underground_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "ye_tranport_tube_green_splitter_recipe"
			  },
			  
			},
			unit =
			{
			  count = 100,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			  },
			  time = 30
			},
			order = "y"
		},
	}
)

for i,techs in pairs(tiers) do
	data:extend(validateRecipes(techs))
end