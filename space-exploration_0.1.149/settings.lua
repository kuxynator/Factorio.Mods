data:extend{
  {
      type = "int-setting",
      name = "se-meteor-interval",
      setting_type = "runtime-global",
      default_value = 20,
      minimum_value = 1,
      maximum_value = 2880,
  },
  {
      type = "int-setting",
      name = "se-plage-max-runtime",
      setting_type = "runtime-global",
      default_value = 15,
      minimum_value = 1,
      maximum_value = 1000,
  },
  {
      type = "bool-setting",
      name = "se-skip-experimental-warning",
      setting_type = "runtime-global",
      default_value = false,
  },
  {
      type = "bool-setting",
      name = "se-print-meteor-info",
      setting_type = "runtime-per-user",
      default_value = false,
  },
  {
      type = "int-setting",
      name = "se-space-pipe-capacity",
      setting_type = "startup",
      default_value = 100,
      minimum_value = 50,
      maximum_value = 200,
  },
  {
      type = "bool-setting",
      name = "se-electric-boiler",
      setting_type = "startup",
      default_value = true,
  }
--[[
    {
        type = "int-setting",
        name = "se-planets",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 100,
        maximum_value = 500,
    },{
        type = "int-setting",
        name = "se-planet-size",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 1,
        maximum_value = 10000,
    },
    {
        type = "int-setting",
        name = "se-seed",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 1,
        maximum_value = 5000,
    }]]--
}
