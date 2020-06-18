local data_util = require("data_util")
local heat = table.deepcopy(data.raw.fluid.steam)
heat.name = data_util.mod_prefix .. "decompressing-steam"
--heat.localised_name = {"fluid-name.steam"}
data:extend({
  heat,
  {
    type = "item",
    name = data_util.mod_prefix .. "condenser-turbine",
    icon = "__space-exploration-graphics__/graphics/icons/condenser-turbine.png",
    icon_size = 32,
    order = "b[steam-power]-c[steam-turbine]-b",
    place_result = data_util.mod_prefix .. "condenser-turbine",
    stack_size = 10,
    subgroup = "energy",
    --subgroup = "space-energy",
  },
})
