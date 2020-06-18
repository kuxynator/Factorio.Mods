local data_util = require("data_util")
data.raw.item["rocket-silo"].subgroup = "rocket-logistics"
data.raw.item["rocket-silo"].order = "a"

data.raw.item["rocket-control-unit"].subgroup = "rocket-intermediate-product"
data.raw.item["low-density-structure"].subgroup = "rocket-intermediate-product"
data.raw.item["low-density-structure"].order = "b"
data.raw.item["low-density-structure"].stack_size = 50
data.raw.item["rocket-fuel"].subgroup = "rocket-intermediate-product"

data.raw.capsule["raw-fish"].capsule_action = {
  attack_parameters = {
    ammo_category = "capsule",
    ammo_type = {
      action = {
        action_delivery = {
          target_effects = {
            damage = {
              amount = -10,
              type = "poison"
            },
            type = "damage"
          },
          type = "instant"
        },
        type = "direct"
      },
      category = "capsule",
      target_type = "position"
    },
    cooldown = 30,
    range = 0,
    type = "projectile"
  },
  type = "use-on-self"
}


if not data.raw.item["sand"] then
  data:extend({
    {
      icon = "__space-exploration-graphics__/graphics/icons/sand.png",
      icon_size = 64,
      name = "sand",
      order = "a[wood]-b-b",
      stack_size = 200,
      subgroup = "raw-material",
      type = "item"
    }
  })
end

if not data.raw.item["glass"] then
  data:extend({
    {
      icon = "__space-exploration-graphics__/graphics/icons/glass.png",
      icon_size = 64,
      name = "glass",
      order = "a[wood]-b-c",
      stack_size = 100,
      subgroup = "raw-material",
      type = "item"
    }
  })
end

-- item_group, sequence
--[[
data:extend({
  {
      action = {
        action_delivery = {
          target_effects = {
            damage = {
              amount = 50, -- 8,
              type = "physical"
            },
            type = "damage"
          },
          type = "instant"
        },
        type = "direct"
      },
      durability = 10000, -- 5000
      icon = "__space-exploration-graphics__/graphics/icons/omega-tool.png",
      icon_size = 32,
      name = data_util.mod_prefix .. "omega-tool",
      order = "a[mining]-b[steel-axe]",
      speed = 100, --4,
      stack_size = 5,
      subgroup = "tool",
      type = "mining-tool"
    },
})]]--

data:extend({
  {
    icon = "__space-exploration-graphics__/graphics/icons/water-ice.png",
    icon_size = 64,
    name = data_util.mod_prefix .. "water-ice",
    subgroup = "raw-resource",
    order = "i-a",
    stack_size = 200,
    type = "item"
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/methane-ice.png",
    icon_size = 64,
    name = data_util.mod_prefix .. "methane-ice",
    order = "i-b",
    stack_size = 200,
    subgroup = "raw-material",
    type = "item"
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "heat-shielding",
    icon = "__space-exploration-graphics__/graphics/icons/heat-shielding.png",
    icon_size = 64,
    order = "a",
    stack_size = 50,
    subgroup = "rocket-intermediate-product",
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/accumulator.png",
    icon_size = 32,
    name = data_util.mod_prefix .. "space-accumulator",
    order = data.raw.item.accumulator.order,
    place_result = data_util.mod_prefix .. "space-accumulator",
    stack_size = data.raw.item.accumulator.stack_size,
    subgroup = "space-energy",
    type = "item"
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/solar-panel.png",
    icon_size = 32,
    name = data_util.mod_prefix .. "space-solar-panel",
    order = "d[solar-panel]-a[solar-panel]-b",
    place_result = data_util.mod_prefix .. "space-solar-panel",
    stack_size = 20,
    subgroup = "space-energy",
    type = "item"
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/solar-panel-2.png",
    icon_size = 32,
    name = data_util.mod_prefix .. "space-solar-panel-2",
    order = "d[solar-panel]-a[solar-panel]-b2",
    place_result = data_util.mod_prefix .. "space-solar-panel-2",
    stack_size = 20,
    subgroup = "space-energy",
    type = "item"
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/pipe.png",
    icon_size = 32,
    name = data_util.mod_prefix .. "space-pipe",
    order = "a[pipe]-a[pipe]",
    place_result = data_util.mod_prefix .. "space-pipe",
    stack_size = 100,
    subgroup = "space-logistics",
    type = "item"
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/pipe-to-ground.png",
    icon_size = 32,
    name = data_util.mod_prefix .. "space-pipe-to-ground",
    order = "a[pipe]-a[pipe]",
    place_result = data_util.mod_prefix .. "space-pipe-to-ground",
    stack_size = 50,
    subgroup = "space-logistics",
    type = "item"
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/transport-belt.png",
    icon_size = 32,
    name = data_util.mod_prefix .. "space-transport-belt",
    order = "a[transport-belt]-z[space-transport-belt]",
    place_result = data_util.mod_prefix .. "space-transport-belt",
    stack_size = 100,
    subgroup = "space-logistics",
    type = "item"
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/underground-belt.png",
    icon_size = 32,
    name = data_util.mod_prefix .. "space-underground-belt",
    order = "b[underground-belt]-z[space-underground-belt]",
    place_result = data_util.mod_prefix .. "space-underground-belt",
    stack_size = 50,
    subgroup = "space-logistics",
    type = "item"
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/splitter.png",
    icon_size = 32,
    name = data_util.mod_prefix .. "space-splitter",
    order = "c[splitter]-z[space-splitter]",
    place_result = data_util.mod_prefix .. "space-splitter",
    stack_size = 50,
    subgroup = "space-logistics",
    type = "item"
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/medpack-1.png",
    icon_size = 64,
    name = data_util.mod_prefix .. "medpack",
    order = "aa",
    stack_size = 20,
    subgroup = "capsule",
    type = "capsule",
    capsule_action = {
      attack_parameters = {
        ammo_category = "capsule",
        ammo_type = {
          action = {
            action_delivery = {
              target_effects = {
                damage = {
                  amount = -25,
                  type = "poison"
                },
                type = "damage"
              },
              type = "instant"
            },
            type = "direct"
          },
          category = "capsule",
          target_type = "position"
        },
        cooldown = 10,
        range = 0,
        type = "projectile"
      },
      type = "use-on-self"
    },
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/medpack-2.png",
    icon_size = 64,
    name = data_util.mod_prefix .. "medpack-2",
    order = "aa",
    stack_size = 20,
    subgroup = "capsule",
    type = "capsule",
    capsule_action = {
      attack_parameters = {
        ammo_category = "capsule",
        ammo_type = {
          action = {
            action_delivery = {
              target_effects = {
                damage = {
                  amount = -50,
                  type = "poison"
                },
                type = "damage"
              },
              type = "instant"
            },
            type = "direct"
          },
          category = "capsule",
          target_type = "position"
        },
        cooldown = 10,
        range = 0,
        type = "projectile"
      },
      type = "use-on-self"
    },
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/medpack-3.png",
    icon_size = 64,
    name = data_util.mod_prefix .. "medpack-3",
    order = "aa",
    stack_size = 20,
    subgroup = "capsule",
    type = "capsule",
    capsule_action = {
      attack_parameters = {
        ammo_category = "capsule",
        ammo_type = {
          action = {
            action_delivery = {
              target_effects = {
                damage = {
                  amount = -100,
                  type = "poison"
                },
                type = "damage"
              },
              type = "instant"
            },
            type = "direct"
          },
          category = "capsule",
          target_type = "position"
        },
        cooldown = 10,
        range = 0,
        type = "projectile"
      },
      type = "use-on-self"
    },
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/medpack-4.png",
    icon_size = 64,
    name = data_util.mod_prefix .. "medpack-4",
    order = "aa",
    stack_size = 20,
    subgroup = "capsule",
    type = "capsule",
    capsule_action = {
      attack_parameters = {
        ammo_category = "capsule",
        ammo_type = {
          action = {
            action_delivery = {
              target_effects = {
                damage = {
                  amount = -200,
                  type = "poison"
                },
                type = "damage"
              },
              type = "instant"
            },
            type = "direct"
          },
          category = "capsule",
          target_type = "position"
        },
        cooldown = 10,
        range = 0,
        type = "projectile"
      },
      type = "use-on-self"
    },
  },
})

local function make_item_sequence(item_group, items, set)
  for _, item in pairs(items) do
    local item = type(item) == "string" and {item, 50} or item
    local order = "a-" .. string.format("%02d", _)
    data:extend({{
      type = "item",
      name = data_util.mod_prefix .. item[1],
      icon = "__space-exploration-graphics__/graphics/icons/" .. (set == "catalogue" and "catalogue/" or "") .. item[1] .. ".png",
      icon_size = 32,
      subgroup = item_group,
      order = order,
      stack_size = item[2]
    }})
    --log(data_util.mod_prefix .. item[1])
  end
end

local function make_data_item_sequence(item_group, items, stack_size)
  local stack_size = stack_size or 100
  for _, item in pairs(items) do
    local item = type(item) == "string" and {item, 50} or item
    local order = "a-" .. string.format("%02d", _)
    data:extend({{
      type = "item",
      name = data_util.mod_prefix .. item[1] .. "-data",
      icon = "__space-exploration-graphics__/graphics/icons/data/" .. item[1] .. ".png",
      icon_size = 32,
      subgroup = item_group,
      order = order,
      stack_size = item[2]
    }})
    --log(data_util.mod_prefix .. item[1] .. "-data")
  end
end

make_item_sequence("data-catalogue-astronomic", {
  "astronomic-catalogue-1", "astronomic-catalogue-2", "astronomic-catalogue-3", "astronomic-catalogue-4", "astronomic-insight"}, "catalogue")
make_item_sequence("data-catalogue-energy", {
  "energy-catalogue-1", "energy-catalogue-2", "energy-catalogue-3", "energy-catalogue-4", "energy-insight"}, "catalogue")
make_item_sequence("data-catalogue-biological", {
  "biological-catalogue-1", "biological-catalogue-2", "biological-catalogue-3", "biological-catalogue-4", "biological-insight"}, "catalogue")
make_item_sequence("data-catalogue-material", {
  "material-catalogue-1", "material-catalogue-2", "material-catalogue-3", "material-catalogue-4", "material-insight"}, "catalogue")

make_data_item_sequence("data-significant", { "significant"})
make_data_item_sequence("data-generic", {"empty", "junk", "broken"})

make_data_item_sequence("data-astronomic", {
  "visible-observation",
  "infrared-observation",
  "uv-observation",
  "astrometric",
  "gravimetric-observation",

  "microwave-observation",
  "xray-observation",
  "gravity-wave-observation",
  "gravimetric-test",

  "radio-observation",
  "gammaray-observation",
  "darkmatter",
  "negative-pressure",

  "dark-energy",
  "micro-black-hole",
  "timespace-anomaly",
  "zero-point-energy",
})

make_data_item_sequence("data-energy", {
  "electromagnetic-field", -- misc

  "ion-spectrometry",
  "radiation",
  "plasma-electrodynamics",
  "polarisation",
  "quantum-phenomenon",

  "atomic",
  "subatomic",
  "fusion-test",
  "quark",

  "entanglement",
  "forcefield",
  "gammaray-test",
  "lepton",

  "boson",
  "exotic-fission",
  "exotic-singularity",
  "magnetic-monopole",
})

make_data_item_sequence("data-biological", {
  "bio-combustion",
  "bio-spectral",
  "biomechanical",
  "biochemical",
  "genetic",

  "bio-combustion-resistance",
  "experimental-genetic",
  "experimental-biochemical",
  "biomechanical-resistance",

  "bioelectrics",
  "cryogenics",
  "decompression",
  "radiation-exposure",

  "comparative-genetic",
  "decompression-resistance",
  "neural-anomaly",
  "radiation-exposure-resistance",
})

make_data_item_sequence("data-material", {
  "cold-thermodynamics",
  "hot-thermodynamics",
  "tensile-strength",
  "compressive-strength",
  "conductivity",

  "material-decay",
  "material-spectral",
  "plasma-thermodynamics",
  "pressure-containment",

  "experimental-material-decay",
  "experimental-material-spectral",
  "radiation-shielding",
  "superconductivity",

  "nano-cold-thermodynamics",
  "nano-hot-thermodynamics",
  "nano-compressive-strength",
  "nano-tensile-strength",
})

make_item_sequence("space-observation-frame", {
  {"observation-frame-blank", 200},
  {"observation-frame-radio", 200},
  {"observation-frame-microwave", 200},
  {"observation-frame-infrared", 200},
  {"observation-frame-visible", 200},
  {"observation-frame-uv", 200},
  {"observation-frame-xray", 200},
  {"observation-frame-gammaray", 200},
})

make_item_sequence("space-canisters", {
  {"canister", 20},
  {"magnetic-canister", 20},
  {"plasma-canister", 20},
  {"antimatter-canister", 20},
  {"empty-lifesupport-canister", 20},
  {"lifesupport-canister", 20},
  {"used-lifesupport-canister", 20},
})
data.raw.item[data_util.mod_prefix .. "antimatter-canister"].fuel_value = "10000MJ"
data.raw.item[data_util.mod_prefix .. "antimatter-canister"].fuel_category = "antimatter"
data.raw.item[data_util.mod_prefix .. "antimatter-canister"].burnt_result = data_util.mod_prefix .. "magnetic-canister"

make_item_sequence("space-bioculture", {
  {"nutrient-vat", 1},
  {"bioculture", 1},
  {"experimental-bioculture", 1},
  {"specimen", 1},
  {"experimental-specimen", 1},
  {"significant-specimen", 1},
})

make_item_sequence("space-components", {
  {"scrap", 50},
  {"contaminated-scrap", 50},
  "space-mirror",
  "gammaray-detector",
  {"material-testing-pack", 10},
  "experimental-material",
  "nano-material",
  "experimental-superconductor",
  "superconductive-cable",
})

make_item_sequence("data-generic", {
  {"data-storage-substrate", 100},
  {"data-storage-substrate-cleaned", 100},
})

data.raw.item[data_util.mod_prefix .. "material-testing-pack"].icon = nil
data.raw.item[data_util.mod_prefix .. "material-testing-pack"].icons =  {
    {
      icon = "__space-exploration-graphics__/graphics/icons/crate.png"
    },
    {
      icon = "__space-exploration-graphics__/graphics/icons/crate-mask.png",
      tint = {r = 255, g = 255, b = 255}
    }
}
