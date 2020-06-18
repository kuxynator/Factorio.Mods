local data_util = require("data_util")
data:extend({
  {
    type = "item",
    name = data_util.mod_prefix .. "space-science-lab",
    icon = "__space-exploration-graphics__/graphics/icons/space-science-lab.png",
    icon_size = 32,
    order = "space-science-lab",
    stack_size = 1,
    subgroup = "space-platform",
    place_result = data_util.mod_prefix .. "space-science-lab"
  },
})
