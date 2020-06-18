require("technology.yi_core")



-- Yi Tweaks
--data.raw["item-subgroup"]["y_tiles"].group = "yuoki-energy"

-- List of Core techs
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
"yi-science-exchange",

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
"yi-power-armor"

}

if data.raw.recipe["ye_sturbine_recipe"] ~= nil then
	require("technology.yi_engines")

	-- List of Engines Techs
	local yi_engines_techs = {
	"yi-basic-mechanical-force",
	
	"yi-intermediate-mechanical-force",
	
	"yi-fluid-handling-mechanical-force",
	"yi-basic-farming",
	"yi-basic-transport",
	
	"yi-basic-ranching",
	"yi-advanced-mechanical-force",

	"yi-dna",
	
	"yi-advanced-transport",
	"yi-engines-trade",
	
	
	
	}

	-- Combine Tech list
	for k, tech in pairs(yi_engines_techs) do
		table.insert(yi_core_techs, tech)
	end
	
end

-- Loop over all techs
-- Turn off all enabled recipes now controlled by tech unlock
for k, tech in pairs(yi_core_techs) do
	for i, v in pairs(data.raw.technology[tech].effects) do
		if v.type == "unlock-recipe" then
			local checkRecipe = data.raw.recipe[v.recipe]
			if checkRecipe ~= nil then
				data.raw.recipe[v.recipe].enabled = false
			end
		end
	end
end





