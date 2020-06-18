local data_util = require("data_util")

if mods["NPUtils"] then

  data_util.tech_add_prerequisites("n16", {data_util.mod_prefix .. "astronomic-science-pack" })
  data_util.tech_add_ingredients(tech, {"space-science-pack",data_util.mod_prefix .."astronomic-science-pack" }, true)

  -- Chunk excavator is similar to core miner but does not work with planet resources.
  -- remove to use core miner instead
  -- can be put back if it can be made planet-resource specific.
  data.raw.technology["n27"] = nil -- nothing has it as a prerequiste
  data.raw.item["n-mining-tool"] = nil
  data.raw.recipe["n-mining-tool"] = nil

  data.raw.item["n-excavator"] = nil
  data.raw.recipe["n-excavator"] = nil
  data.raw.recipe["n-mineral-chunk"] = nil
  data.raw["assembling-machine"]["n-excavator"] = nil
end
