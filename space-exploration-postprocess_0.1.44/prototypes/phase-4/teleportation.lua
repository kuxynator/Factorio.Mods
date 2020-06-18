local data_util = require("data_util")

-- portals
if mods["Portals"] then
  data.raw.technology[data_util.mod_prefix .. "teleportation"].enabled = true

  data_util.tech_add_prerequisites("portals", { data_util.mod_prefix .. "teleportation" })
  data_util.tech_add_ingredients("portals", {
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

-- klonan's teleportation

if mods["Teleporters"] then
  data.raw.technology[data_util.mod_prefix .. "teleportation"].enabled = true

  data_util.tech_add_prerequisites("teleporter", { data_util.mod_prefix .. "teleportation" })
  data_util.tech_add_ingredients("teleporter", {
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


if mods["bulkteleport"] then
  data.raw.technology[data_util.mod_prefix .. "teleportation"].enabled = true

  data.raw.technology["bulkteleport-tech1"].unit.count = 1000
  data_util.tech_add_prerequisites("bulkteleport-tech1", { data_util.mod_prefix .. "teleportation" })
  data_util.tech_add_ingredients("teleporter", {
    "chemical-science-pack",
    "utility-science-pack",
    "production-science-pack",
    "space-science-pack",
    data_util.mod_prefix .."astronomic-science-pack",
    data_util.mod_prefix .."energy-science-pack",
    data_util.mod_prefix .."material-science-pack",
    data_util.mod_prefix .."deep-space-science-pack"
  }, true)

  data.raw.technology["bulkteleport-tech2"].unit.count = 2000
end
