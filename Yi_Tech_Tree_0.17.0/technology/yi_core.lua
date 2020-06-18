require("utilValidate")
local tiers = {}

-- Tier 0
table.insert(tiers, 
	{
		{
			type = "technology",
			name = "yi-raw-materials",
			icon = "__Yuoki__/graphics/icons/richdust.png",
			icon_size = 32, prerequisites = {"steel-processing"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y_c11_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mining-drill-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-heat-form-press-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-coal-brikett-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-coal-stack-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-coaldust-mixing-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mixfuel-load-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-press-richdust-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-smelt-crush-res1-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-unicomp-raw-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-smelt-crush-res2-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-raw-fuelnium-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-mixing-rich-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-orange-stuff_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_slag_granulate_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_slag_brick_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_slag_brick_burn_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_tile_slagfilled_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_tile_slagpattern_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_tile_slagbricks_recipe"
			  },
			  
			},
			unit =
			{
			  count = 20,
			  ingredients =
			  {
				{"automation-science-pack", 1}
			  },
			  time = 30
			},
			order = "y"
		},
	}
)

-- Tier 1
table.insert(tiers, 
	{
		{
			type = "technology",
			name = "yi-intermediates",
			icon = "__Yuoki__/graphics/icons/bluegear-icon.png",
			icon_size = 32, prerequisites = {"yi-raw-materials"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y_c22_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_cg33_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_sc44_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-bluegear-recipe"
			  }, 
			  {
				type = "unlock-recipe",
				recipe = "y_structure_element_recipe"
			  }, 
			  {
				type = "unlock-recipe",
				recipe = "y_structure_vessel_recipe"
			  }, 
			  {
				type = "unlock-recipe",
				recipe = "y-heat-pipe-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-conductive-wire-1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-conductive-coil-1-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_structure_electric_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_dotzetron_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_chip_plate_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-chip1-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-chip2-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_magnetron_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-fuel-reactor-recipe"
			  },
			},
			unit =
			{
			  count = 10,
			  ingredients =
			  {
				{"automation-science-pack", 1}
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-ammo",
			icon = "__Yuoki__/graphics/icons/ammo_poison.png",
			icon_size = 32, prerequisites = {"military-2", "yi-raw-materials"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-bullet-case-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ammo-acid-medium-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ammo-hohlspitz-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ammo-explosiv-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ammo-poison-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ammo-biggun-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ammo-krakon-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_ammo_case_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_ammo_plasma_recipe"
			  },
			  --[[Removed in 4.60]]--
			  {
				type = "unlock-recipe",
				recipe = "y_ammo_flame_recipe"
			  },
			  
			},
			unit =
			{
			  count = 10,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"military-science-pack", 1}
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-ore-processing",
			icon = "__Yuoki__/graphics/icons/dw.png",
			icon_size = 32, prerequisites = {"yi-raw-materials"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-mining-drill-e2-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-dirtwasher-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-pure-iron-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-pure-copper-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-release-cwater"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-sulfuric-acid-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-pressed_dry_mud-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-filtering-dust-recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y_mud2solidfuel_recipe"
				},
				
			},
			unit =
			{
			  count = 10,
			  ingredients =
			  {
				{"automation-science-pack", 1}
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-fluid-handling",
			icon = "__Yuoki__/graphics/entity/special_tank3_icon.png",
			icon_size = 32, prerequisites = {"yi-raw-materials"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-valve-direction-buffer-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-tank-1000-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-tank-4500-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-tank-8000-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_buffer_station_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-pipe-hc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-pipe-to-ground-hc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-pipe-ec-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-pipe-to-ground-ec-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_flowcheck_10_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_gauge_analog_recipe"
			  },
			},
			unit =
			{
			  count = 30,
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

-- Tier 2
table.insert(tiers, 
	{
		{
			type = "technology",
			name = "yi-atomics",
			icon = "__Yuoki__/graphics/icons/cimota-icon.png",
			icon_size = 32, prerequisites = {"yi-intermediates"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-atomic-constructor-recipe"
			  },
			  
			  {
				type = "unlock-recipe",
				recipe = "y-ac-copper2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-iron2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-coal2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-stone2uc-recipe"
			  },
				{
				type = "unlock-recipe",
				recipe = "y_ac_uran2uc_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-wood2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-uc42uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-fuel2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-uc2copper-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-uc2iron-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-uc2coal-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-uc2stone-recipe"
			  },
				{
				type = "unlock-recipe",
				recipe = "y_ac_uc2uranore_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-uc2wood-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-uc2uc4-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-uc2fuel-recipe"
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
			name = "yi-lights",
			icon = "__Yuoki__/graphics/entity/lamps/hl2_icon.png",
			icon_size = 32, prerequisites = {"yi-intermediates"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y_basement_factory_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_lampe_corner_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_lampe_44basement_a_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_lampe_44basement_b_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_basement_5x5a_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_basement_5x5b_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_basement_5x5c_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_basement_5x5d_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_basement_5x5e_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_basement_5x5f_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_basement_5x5f2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_basement_4x4a_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_lampe_66basement_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-powerlamp-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_lamp_red_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_lamp_green_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_lamp_blue_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_lamp_yellow_recipe"
			  },
			 
			},
			unit =
			{
			  count = 10,
			  ingredients =
			  {
				{"automation-science-pack", 1},
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-inserters",
			icon = "__Yuoki__/graphics/entity/inserters/y_smart_ins_icon.png",
			icon_size = 32, prerequisites = {"yi-intermediates"},
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "y-inserter-fast-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_inserter_smart_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-inserter-smart-long_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-inserter-s4-recipe",
				},

			},
			unit =
			{
				count = 150,
				ingredients = {
					{ "automation-science-pack", 1},
					{ "logistic-science-pack", 1},

				},
				time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-walls",
			icon = "__Yuoki__/graphics/icons/wall-forcefield-icon.png",
			icon_size = 32, prerequisites = {"stone-walls", "yi-intermediates"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-mud-wall-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-rare-wall-basic-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-rare-wall-adv-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-wall-forcefield-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_wall22_hardic_recipe"
			  },
			},
			unit =
			{
			  count = 10,
			  ingredients =
			  {
				{"automation-science-pack", 1}
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-modules",
			icon = "__Yuoki__/graphics/icons/modul_pink_1.png",
			icon_size = 32, prerequisites = {"yi-intermediates"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y_modul_blue1-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_modul_green1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-pink-module-1-recipe"
			  },
			},
			unit =
			{
			  count = 20,
			  ingredients =
			  {
				{"automation-science-pack", 1},
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-basic-machines",
			icon = "__Yuoki__/graphics/icons/deep-drill-v1-icon.png",
			icon_size = 32, prerequisites = {"yi-intermediates", "yi-ore-processing", "engine"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-basic-st1-mf-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_crusher2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_formpress2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-underground-drill-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-digfdirt-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-wash-special-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-wash-dirt-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-solar-dish-recipe"
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
			name = "yi-tools",
			icon = "__Yuoki__/graphics/icons/hammer_std.png",
			icon_size = 32, prerequisites = {"yi-intermediates"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-repair-durotal-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-repair-krakon-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-axe-durotal-recipe"
			  },
			},
			unit =
			{
			  count = 20,
			  ingredients =
			  {
				{"automation-science-pack", 1},
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-power",
			icon = "__Yuoki__/graphics/icons/boiler3mw_icon2.png",
			icon_size = 32, prerequisites = {"yi-intermediates"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-substation-m-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_signal_pole_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-steam-turbine-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-boiler-t3-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-boiler-iv-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-battery-single-use3-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_blocked_capa_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-accumulator-m-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-accumulator-b-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ups-flywheel-b-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_compensator_25_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_alien_solar_recipe"
				},
				{
				type = "unlock-recipe",
				recipe = "y_mixedfuel2rocketfuel_recipe"
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
			name = "yi-advanced-inserters",
			icon = "__Yuoki__/graphics/entity/inserters/ins_diagonal.png",
			icon_size = 32, prerequisites = {"yi-inserters"},
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "y_inserter_smart_rightR2_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_inserter_smart_leftR2_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_inserter_smart_RR_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_inserter_smart_LL_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_inserter_evade_shortR_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_inserter_evade_shortL_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_inserter_diagonal_recipe",
				},
			},
			unit =
			{
				count = 250,
				ingredients = {
					{ "automation-science-pack", 1},
					{ "logistic-science-pack", 1},
				},
				time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-ammo-turrets",
			icon = "__Yuoki__/graphics/entity/defense/gun_1_icon.png",
			icon_size = 32, prerequisites = {"yi-walls", "yi-ammo", "engine"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-gun-turret-mk2-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-gun-turret-mk3-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_turret_flame_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_mine_plasma_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_mine_impact_recipe"
			  },
			 
			},
			unit =
			{
			  count = 20,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"military-science-pack", 1}				
			  },
			  time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-advanced-machines",
			icon = "__Yuoki__/graphics/entity/space-assembly-icon.png",
			icon_size = 32, prerequisites = {"yi-basic-machines", "yi-fluid-handling", "yi-power", "electric-engine"},
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "y-basic-st2-mf-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-atomic-quantum-composer-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_data_crystal_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-crystal-cnd-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-quantrinum-recipe",
				},
				
				{
					type = "unlock-recipe",
					recipe = "yi_beacon_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "yi_radar_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-accumulator-btx-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-accumulator-crystal-m-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-alien-infuser-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-infused-uca2-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-infused-mud-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_quantrinum_infusion_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-substation-h-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "yi-monument1-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-accumulator-mt2-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-accumulator-bt2-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_alien_solar2_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-lamp-alien-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-tank-24k-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "ye_wpump_m_recipe",
				},
				
				
			},
			unit =
			{
				count = 100,
				ingredients = {
					{ "automation-science-pack", 1},
					{ "logistic-science-pack", 1},

				},
				time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-oil-atomics",
			icon = "__Yuoki__/graphics/icons/atomics/uc2crudeoil.png",
			icon_size = 32, prerequisites = {"yi-atomics"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-heavyoil2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-lightoil2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-lubricant2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-petroleum-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-uc2crudeoil-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-uc2plastic-recipe"
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
			name = "yi-recycle-atomics",
			icon = "__Yuoki__/graphics/icons/atomics/crystal2uc.png",
			icon_size = 32, prerequisites = {"yi-atomics"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-ac-crystal2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-mud2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-toxic2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-ac-slag2uc-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_alien_artis1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-alien-artifact-recipe"
			  },
			  
			 --[[Removed in 4.60]]--
			  {
				type = "unlock-recipe",
				recipe = "y_alien_artis2_recipe"
			  }, 
			  
			  {
				type = "unlock-recipe",
				recipe = "y-battery-rip1-recipe"
			  },
			 
			  {
				type = "unlock-recipe",
				recipe = "y-battery-rip2-recipe"
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
			name = "yi-storage-atomics",
			icon = "__Yuoki__/graphics/icons/unicomp_stack.png",
			icon_size = 32, prerequisites = {"yi-atomics"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-uc2liquid-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-liquid2uc-recipe"
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
			name = "yi-science-exchange",
			icon = "__base__/graphics/icons/military-science-pack.png",
			icon_size = 32, prerequisites = {"yi-atomics"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y_military_science_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_chemical_science_recipe"
				},
				{
				type = "unlock-recipe",
				recipe = "y_production_science_recipe"
				},
				{
				type = "unlock-recipe",
				recipe = "y_high-tech_science_recipe"
				},
				{
				type = "unlock-recipe",
				recipe = "y_space_science_recipe"
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
			name = "yi-water-atomics",
			icon = "__Yuoki__/graphics/icons/alien_water_gen_icon.png",
			icon_size = 32, prerequisites = {"yi-atomics"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-water-gen-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-water-gen-recipe-e"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-water-gen-fluid-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_water_mixer_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_water_mix_recipe"
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
			name = "yi-electric-turrent",
			icon = "__Yuoki__/graphics/entity/defense/zzt-icon.png",
			icon_size = 32, prerequisites = {"yi-walls", "yi-advanced-machines", "military-2"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y_turret_plasma_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_laser_onhwall_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_laser_mk1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-weapon-ztt-recipe"
			  },
			},
			unit =
			{
			  count = 150,
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
			name = "yi-advanced-modules",
			icon = "__Yuoki__/graphics/icons/modul_pink_3.png",
			icon_size = 32, prerequisites = {"yi-modules", "yi-advanced-machines"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y_modul_blue2-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_modul_green2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-pink-module-2-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_modul_red1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_modul_red2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-pink-module-3-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_modul_science_recipe"
			  },
			},
			unit =
			{
			  count = 75,
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
			name = "yi-advanced-power",
			icon = "__Yuoki__/graphics/icons/obninsk-reactor-icon.png",
			icon_size = 32, prerequisites = {"yi-advanced-machines"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y-seg-p-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-seg-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-meg-s-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-beg-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-heg-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-obninsk-reactor-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y-obninsk-turbine-recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y_moxmixer_recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "yi_graphite_recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y_mox1mixed_recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y_mox2mixed_recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y_mox1fuel_recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y_mox2fuel_recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y_mox2fuel_recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y_reactor_mf1-recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y_reactor_mox1-recipe"
				},
				{
					type = "unlock-recipe",
					recipe = "y_reactor_mox2-recipe"
				},
			},
			unit =
			{
			  count = 50,
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
			name = "yi-logistics-research",
			icon = "__Yuoki__/graphics/entity/yi_roboport_icon.png",
			icon_size = 32, prerequisites = {"yi-advanced-machines", "construction-robotics", "logistic-robotics" },
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "y_pc22_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_rc22_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_cg33_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-rare-chest-log-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-rare-m1bunker-log-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "yi_roboport_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "yi_construction-robot_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "yi_logistic-robot_recipe",
				},
			},
			unit =
			{
				count = 50,
				ingredients = {
					{ "automation-science-pack", 1},
					{ "logistic-science-pack", 1},
					{ "chemical-science-pack", 1}
				},
				time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-reputation",
			icon = "__Yuoki__/graphics/entity/thanks-icon.png",
			icon_size = 32, prerequisites = {"yi-advanced-machines"},
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "y-stargate-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-fame-gen-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-fame-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_fame_tech_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "yi_slayerfame_recipe",
				},
				
				{
					type = "unlock-recipe",
					recipe = "y-sgtrade-ic1-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_exchange_a1_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_exchange_a2_recipe",
				},
				--[[Removed in 4.60]]--
				{
					type = "unlock-recipe",
					recipe = "y_exchange_a3_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_exchange_a4_recipe",
				},
			},
			unit =
			{
				count = 100,
				ingredients = {
					{ "automation-science-pack", 1},
					{ "logistic-science-pack", 1},
				},
				time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-advanced-tools",
			icon = "__Yuoki__/graphics/icons/hammer_quantrinum.png",
			icon_size = 32, prerequisites = {"yi-tools", "yi-advanced-machines"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y_repair_quantrinum-recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_quantrinum_hammer_recipe"
			  },

			},
			unit =
			{
			  count = 50,
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
			name = "yi-advanced-ore-processing",
			icon = "__Yuoki__/graphics/icons/maintance_workshop_icon.png",
			icon_size = 32, prerequisites = {"yi-ore-processing", "yi-advanced-machines", "yi-tools"},
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "y_maintance_workshop_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_drillhead_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_drillhead_repair_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_toolhead_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_toolhead_repair_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-digfdirt2-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-crush-blue_whead-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y-crush-green_whead-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_pure_copper_wtool_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_pure_iron_wtool_recipe",
				},
			},
			unit =
			{
				count = 150,
				ingredients = {
					{ "automation-science-pack", 1},
					{ "logistic-science-pack", 1},
				},
				time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-organic-oil-atomics",
			icon = "__Yuoki__/graphics/icons/atomics/buy_catbase.png",
			icon_size = 32, prerequisites = {"yi-oil-atomics"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "y_uc2catalyst"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_catalyst_ft_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_regcatft_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_catalyst_bp_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_regcatbp_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_coal2liquid"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_ft_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_rawsyngas1_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_rawsyngas2_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_refinehydrogen_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "y_granulate_wood_recipe"
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
			name = "yi-power-armor-equipment",
			icon = "__Yuoki__/graphics/armor/lfg13.png",
			icon_size = 32, prerequisites = {"yi-advanced-machines"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "yi_equip_shield_a_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_equip_shield_b_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_equip_battery_a_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_equip_roboport_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_equip_generator_a_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_equip_legs_a_recipe"
			  },
				{
				type = "unlock-recipe",
				recipe = "yi_equip_pld_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_minigun_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_lasergun_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_ammo_energie_recipe"
			  },
			},
			unit =
			{
			  count = 75,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"military-science-pack", 1},
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
			name = "yi-smelting",
			icon = "__Yuoki__/graphics/entity/smelter_icon.png",
			icon_size = 32, prerequisites = {"yi-advanced-ore-processing"},
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "y_charger_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_block_cold_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_block_heat_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_smelter_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_hps_steel_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_hps_pureiron_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_hps_purecopper_recipe",
				},

			},
			unit =
			{
				count = 200,
				ingredients = {
					{ "automation-science-pack", 2},
					{ "logistic-science-pack", 2},
				},
				time = 60
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-ultimate-reputation",
			icon = "__Yuoki__/graphics/entity/ultimate_science_icon.png",
			icon_size = 32, prerequisites = {"yi-reputation"},
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "ye_science_ultimate_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_trade_ultimate_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "ypfw_trader_sign_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_greensign_ulti-recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_modul_green_op_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_exchange_b1_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_exchange_b2_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_exchange_b3_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_exchange_b4_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "ye_pool_slurry_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "yi_bug1_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "yi_hny1_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "yi_hny2_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "yi_obelisk_A3_5X_recipe",
				},				
				
				
			},
			unit =
			{
				count = 100,
				ingredients = {
					{ "automation-science-pack", 1},
					{ "logistic-science-pack", 1},
				},
				time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-mastercraft",
			icon = "__Yuoki__/graphics/icons/tech-sign.png",
			icon_size = 32, prerequisites = {"yi-reputation"},
			effects =
			{
				--[[Removed in 4.60]]--
				{
					type = "unlock-recipe",
					recipe = "y_rwtechsign_recipe",
				},
				
				{
					type = "unlock-recipe",
					recipe = "y_obninsk_mc_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_steam_turbine_mc_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_mc_underground_drill_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_mc_dirtwasher_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_mc_e2_mining_drill_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_boiler4_mc_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_steam_turbine_gr_recipe",
				},
				{
					type = "unlock-recipe",
					recipe = "y_boiler4_tech_recipe",
				},
				
				
			},
			unit =
			{
				count = 100,
				ingredients = {
					{ "automation-science-pack", 1},
					{ "logistic-science-pack", 1},
				},
				time = 30
			},
			order = "y"
		},
		{
			type = "technology",
			name = "yi-power-armor",
			icon = "__Yuoki__/graphics/armor/neron_u3_32.png",
			icon_size = 32, prerequisites = {"yi-advanced-machines", "yi-reputation", "yi-power-armor-equipment"},
			effects =
			{
			  {
				type = "unlock-recipe",
				recipe = "yi_armor_gray_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_armor_red_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_armor_gold_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_walker_a_recipe"
			  },
			  {
				type = "unlock-recipe",
				recipe = "yi_walker_c_recipe"
			  },
			},
			unit =
			{
			  count = 100,
			  ingredients =
			  {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},			
				{"military-science-pack", 1}
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