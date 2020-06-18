
-- Add a tech with recipes that may not be in the game
function validateRecipes(techs)
	for ii, tech in pairs(techs) do
		local keepEffects = {}
		for iii, effect in pairs(tech.effects) do
			if effect.type == "unlock-recipe" then
				if data.raw.recipe[effect.recipe] ~= nil then
					table.insert(keepEffects, effect)
				else
					--Debug
					--error("Recipe does not exist: " .. effect.recipe)
				end
			else 
				table.insert(keepEffects, effect)
			end
		end
		tech.effects = keepEffects
	end
	return techs
end
