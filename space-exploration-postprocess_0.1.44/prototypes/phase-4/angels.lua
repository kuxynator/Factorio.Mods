local data_util = require("data_util")



if data.raw.technology["angels-rocket-fuel"] then
  -- angels has more complicated recipe, use for normal rocket
  data_util.tech_remove_prerequisites("rocket-silo", {"rocket-fuel"}) -- new
  data_util.tech_add_prerequisites("rocket-silo", {"angels-rocket-fuel"})
  table.insert(data.raw.technology["angels-rocket-fuel"].effects,
     { type = "unlock-recipe", recipe = data_util.mod_prefix.."liquid-rocket-fuel"})
end

data_util.tech_remove_prerequisites("angels-advanced-chemistry-4", {"space-science-pack"})
data_util.tech_remove_ingredients("angels-advanced-chemistry-4", {"space-science-pack"})

data_util.tech_remove_prerequisites("angels-nitrogen-processing-4", {"space-science-pack"})
data_util.tech_remove_ingredients("angels-nitrogen-processing-4", {"space-science-pack"})
