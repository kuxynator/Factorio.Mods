for i, force in pairs(game.forces) do 
	force.reset_recipes()
end

for i, force in pairs(game.forces) do 
	force.reset_technologies()
end


local yi_core_techs = {
"yi-raw-materials",

"yi-intermediates",
"yi-ammo",
"yi-ore-processing",

"yi-atomics",
"yi-inserters",
"yi-walls",
"yi-modules",
"yi-basic-machines",
"yi-tools",
"yi-power",
"yi-lights",
"yi-fluid-handling",

"yi-advanced-inserters",
"yi-electric-turrent",
"yi-ammo-turrets",
"yi-advanced-machines",
"yi-oil-atomics",
"yi-recycle-atomics",
"yi-storage-atomics",
"yi-water-atomics",

"yi-advanced-modules",
"yi-logistics-research",
"yi-reputation",
"yi-advanced-tools",
"yi-advanced-ore-processing",
"yi-advanced-power",
"yi-organic-oil-atomics",
"yi-power-armor-equipment",

"yi-smelting",
"yi-ultimate-reputation",
"yi-mastercraft",
"yi-power-armor",
"yi-basic-mechanical-force",

"yi-intermediate-mechanical-force",

"yi-fluid-handling-mechanical-force",
"yi-basic-farming",

"yi-basic-ranching",
"yi-advanced-mechanical-force",

"yi-dna",
"yi-engines-trade",

}

for index, force in pairs(game.forces) do 
	for x, tech in pairs (yi_core_techs) do
		if force.technologies[tech] ~= nil and force.technologies[tech].researched then 
			for i, v in pairs(force.technologies[tech].effects) do
				if v.type == "unlock-recipe" then
					local checkRecipe = force.recipes[v.recipe]
					if checkRecipe ~= nil then
						checkRecipe.enabled = true
					end
				end
			end
		end
	end
end
