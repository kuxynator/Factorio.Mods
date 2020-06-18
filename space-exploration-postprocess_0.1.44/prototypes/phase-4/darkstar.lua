local data_util = require("data_util")

if mods["Darkstar_utilities"] or mods["Darkstar_utilities_Low_Spec-0_17-Port"] then
  local late_techs = {"laser-quarry", "dark-matter-reactor", "energy-liquid-D", "energy-liquid-2-D", "energy-liquid-3-D"}
  for _, tech in pairs(late_techs) do
    data_util.tech_add_prerequisites(tech, {data_util.mod_prefix .. "deep-space-science-pack" })
    data_util.tech_add_ingredients(tech, {
      "chemical-science-pack",
      "utility-science-pack",
      "production-science-pack",
      "space-science-pack",
      data_util.mod_prefix .."astronomic-science-pack",
      data_util.mod_prefix .."energy-science-pack",
      data_util.mod_prefix .."material-science-pack",
      data_util.mod_prefix .."deep-space-science-pack"
    }, true)
  end

  data.raw.technology[data_util.mod_prefix .. "teleportation"].enabled = true

  data_util.tech_add_prerequisites("item-teleportation", { data_util.mod_prefix .. "teleportation" })
  data_util.tech_add_ingredients("item-teleportation", {
    "chemical-science-pack",
    "utility-science-pack",
    "production-science-pack",
    "space-science-pack",
    data_util.mod_prefix .."astronomic-science-pack",
    data_util.mod_prefix .."energy-science-pack",
    data_util.mod_prefix .."material-science-pack",
    data_util.mod_prefix .."deep-space-science-pack"
  }, true)

  data_util.tech_add_prerequisites("black-hole-weapons", { data_util.mod_prefix .. "teleportation" })
  data_util.tech_add_ingredients("black-hole-weapons", {
    "chemical-science-pack",
    "utility-science-pack",
    "production-science-pack",
    "space-science-pack",
    data_util.mod_prefix .."astronomic-science-pack",
    data_util.mod_prefix .."energy-science-pack",
    data_util.mod_prefix .."material-science-pack",
    data_util.mod_prefix .."deep-space-science-pack"
  }, true)

end
