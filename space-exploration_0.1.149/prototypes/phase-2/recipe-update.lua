local data_util = require("data_util")

if data.raw.item["stone-tablet"] then -- 0.5 stone
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "heat-shielding", "stone", "stone-tablet", 20)
end

if data.raw.item['electric-motor'] then
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "space-transport-belt", "iron-plate", 'electric-motor', 2)
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "core-fragment-processor", "iron-plate", 'electric-motor', 15)
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "meteor-point-defence", "iron-gear-wheel", 'electric-motor', 10)

  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "fluid-burner-generator", "iron-gear-wheel", 'electric-motor', 10)
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "fuel-refinery", "iron-gear-wheel", 'electric-motor', 20)
end


if data.raw.item["solid-sand"] and not data.raw.recipe["sand-to-solid-sand"]then -- angels sand
  data:extend({{
      type = "recipe",
      name = "sand-to-solid-sand",
      category = "washing-plant",
      normal = {
        energy_required = 0.5,
        enabled = false,
        ingredients = {
          {type="item", name="sand", amount=10},
          {type="fluid", name="water", amount=100},
        },
        results= { {type="item", name="solid-sand", amount=10} },
      },
      expensive = {
        energy_required = 0.5,
        enabled = false,
        ingredients = {
          {type="item", name="sand", amount=10},
          {type="fluid", name="water", amount=100},
        },
        results= { {type="item", name="solid-sand", amount=10} },
      },
  }})
end

data_util.replace_or_add_ingredient("small-lamp", "electronic-circuit", 'glass', 1)

data_util.replace_or_add_ingredient("solar-panel", nil, 'glass', 5)
data_util.replace_or_add_ingredient("laser-turret", nil, 'glass', 20)

data_util.replace_or_add_ingredient("electric-furnace", "stone-brick", data_util.mod_prefix .. "heat-shielding", 2)
data_util.replace_or_add_ingredient("electric-furnace", "concrete", data_util.mod_prefix .. "heat-shielding", 2)

data_util.replace_or_add_ingredient("fusion-reactor-equipment", nil, data_util.mod_prefix .. 'fusion-test-data', 50)
data_util.replace_or_add_ingredient("fusion-reactor-equipment", nil, data_util.mod_prefix .. 'superconductive-cable', 50)
data_util.replace_or_add_ingredient("fusion-reactor-equipment", nil, data_util.mod_prefix .. 'heat-shielding', 50)

data_util.replace_or_add_ingredient("satellite", "solar-panel", "solar-panel", 50)
data_util.replace_or_add_ingredient("satellite", "accumulator", "accumulator", 50)

data_util.replace_or_add_ingredient("atomic-bomb", "explosives", "explosives", 50)
data_util.replace_or_add_ingredient("atomic-bomb", "uranium-235", "uranium-235", 100)
data_util.replace_or_add_ingredient("atomic-bomb", "rocket-fuel", "rocket-fuel", 10)
