local data_util = require("data_util")

-- NOTE: some of this code is outdated, but don't delete carelessly, may be required after SE modules are split out to seperate mods.

--------------------------------------------------------------------------------
-- bobs

if data.raw.tool["advanced-logistic-science-pack"] then -- bobs
  data.raw.tool["advanced-logistic-science-pack"].icon = "__space-exploration-graphics__/graphics/icons/beaker/pink.png"
  data.raw.tool["advanced-logistic-science-pack"].icon_size = 64
end

if bobmods and bobmods.lib and bobmods.lib.recipe and bobmods.lib.tech then

  data_util.tech_add_prerequisites("bob-power-armor-3", {data_util.mod_prefix .. "material-science-pack" })
  data_util.tech_add_ingredients("bob-power-armor-3", { data_util.mod_prefix .. "material-science-pack" }, true)

  data_util.tech_add_prerequisites("bob-power-armor-4", {data_util.mod_prefix .. "superconductive-cable" })
  data_util.tech_add_ingredients("bob-power-armor-4", { data_util.mod_prefix .. "energy-science-pack" }, true)
  data_util.replace_or_add_ingredient("bob-power-armor-4", nil, data_util.mod_prefix .."superconductive-cable", 5)

  data_util.tech_add_prerequisites("bob-power-armor-5", {data_util.mod_prefix .."deep-space-science-pack" })
  data_util.tech_add_ingredients("bob-power-armor-5", { data_util.mod_prefix .. "deep-space-science-pack" }, true)



  -- Problem: Bobs mods is geared around the first rocket being around end game
  -- space exploration put it around mid game.

  -- step 1, make sure rocket silo is accessable without the entire tech tree as a prerequisite
  if data.raw.item["titanium-plate"] then
    bobmods.lib.recipe.replace_ingredient("low-density-structure", "steel-plate", "titanium-plate")
    bobmods.lib.tech.add_prerequisite("low-density-structure", "titanium-processing")
  end

  if data.raw.item["aluminium-plate"] then
    bobmods.lib.recipe.replace_ingredient("low-density-structure", "copper-plate", "aluminium-plate")
    if data.raw.technology["angels-aluminium-smelting-1"] then
      bobmods.lib.tech.add_prerequisite("low-density-structure", "angels-aluminium-smelting-1")
    else
      bobmods.lib.tech.add_prerequisite("low-density-structure", "aluminium-processing")
    end
  end

  -- heat shield tile
  --requires tungsten
  --make an upgrade of heat shielding.
  --make not required for initial rocket.
  --make required for space platform plating and a key component in spaceships
  if data.raw.item["heat-shield-tile"] then
    data.raw.item["heat-shield-tile"].subgroup = "rocket-intermediate-product"
    data.raw.item["heat-shield-tile"].order = "a-b"

    data_util.replace_or_add_ingredient("rocket-part", "heat-shield-tile", data_util.mod_prefix .. "heat-shielding", 5)

    -- make heat shieldind a part of the tile
    data_util.replace_or_add_ingredient ("heat-shield-tile", nil,  data_util.mod_prefix .. "heat-shielding", 2)

    -- make the tile required in the space platform plating
    data_util.tech_add_prerequisites(data_util.mod_prefix .. "space-platform-plating", { "heat-shield" })
    data_util.replace_or_add_ingredient(data_util.mod_prefix .. "space-platform-plating", data_util.mod_prefix .. "heat-shielding", "heat-shield-tile", 1)
    data_util.replace_or_add_ingredient(data_util.mod_prefix .. "spaceship-wall", data_util.mod_prefix .. "heat-shielding", "heat-shield-tile", 1)
    data_util.replace_or_add_ingredient(data_util.mod_prefix .. "spaceship-gate", data_util.mod_prefix .. "heat-shielding", "heat-shield-tile", 1)
    data_util.replace_or_add_ingredient(data_util.mod_prefix .. "spaceship-rocket-engine", data_util.mod_prefix .. "heat-shielding", "heat-shield-tile", 10)
    data_util.replace_or_add_ingredient(data_util.mod_prefix .. "spaceship-rocket-booster-tank", data_util.mod_prefix .. "heat-shielding", "heat-shield-tile", 4)
  end

  -- rocket fuel is ok

  data_util.replace_or_add_ingredient("satellite", "silver-zinc-battery", "battery", 100)


  -- rocket control unit:
  -- don't require speed module or utility science
  -- require adv electronigs 2 and battery
  -- swap battery for battery 2
  if data.raw.technology["battery-2"] and data.raw.item["lithium-ion-battery"] then
    data_util.tech_remove_prerequisites("rocket-control-unit", {"battery"})
    data_util.tech_add_prerequisites("rocket-control-unit", {"battery-2"})
    data_util.replace_or_add_ingredient("rocket-control-unit", "battery", "lithium-ion-battery", 5)

    data_util.replace_or_add_ingredient("satellite", "battery", "lithium-ion-battery", 50)
  end


  data_util.tech_remove_prerequisites("radars", {"military"})
  data_util.tech_remove_prerequisites("radars-2", {"military-2"})

  data_util.replace_or_add_ingredient("satellite", "radar", "radar", 5)
  data_util.replace_or_add_ingredient("satellite", "radar-4", "radar", 5)
  data_util.replace_or_add_ingredient("satellite", "radar-5", "radar", 5)

  data_util.tech_remove_prerequisites("rocket-silo", {"radars-4"})
  data_util.tech_remove_prerequisites("rocket-silo", {"radars-5"})

  data_util.tech_remove_prerequisites("space-science-pack", {"radars-4"})
  data_util.tech_remove_prerequisites("space-science-pack", {"radars-5"})

  if data.raw.technology["radars-3"] then
    data_util.tech_remove_prerequisites("radars-3", {"military-3"})
    data_util.tech_remove_prerequisites("rocket-silo", {"radar"})
    data_util.tech_add_prerequisites("rocket-silo", { "radars-3" })
    data_util.replace_or_add_ingredient("satellite", "radar", "radar-3", 5)
  end


  if data.raw.item["solar-panel-3"] then
    data_util.replace_or_add_ingredient("satellite", "solar-panel-3", "solar-panel", 50)
  end

  -- step 2, lock the upper tiers behind the relevant sciences
  local space_science_parents = data_util.tech_find_parent_names("space-science-pack")

  data_util.tech_add_prerequisites("automation-4", { "space-science-pack" })
  data_util.tech_add_ingredients("automation-4", { "space-science-pack" }, true)

  data_util.tech_add_prerequisites("robotics-2", { "space-science-pack" })
  data_util.tech_add_ingredients("robotics-2", { "space-science-pack" }, true)

  data_util.tech_add_prerequisites("modular-roboports-2", { "space-science-pack" })
  data_util.tech_add_ingredients("modular-roboports-2", { "space-science-pack" }, true)

  data_util.tech_add_prerequisites("electric-poles-4", { data_util.mod_prefix .. "energy-science-pack" })
  data_util.tech_add_ingredients("electric-poles-4", { data_util.mod_prefix .. "energy-science-pack"  }, true)

  data_util.tech_add_prerequisites("effect-transmission-2", { "space-science-pack" })
  data_util.tech_add_ingredients("effect-transmission-2", { "space-science-pack" }, true)

  if data.raw.technology["titanium-processing"] then
    -- can't lock titanium behind space science because it's required for low density structure
    -- but we can lock its descendants
    -- except ones that are prequistes of space science.
    local child_techs = data_util.tech_find_child_names(prototype_name)
    for _, child_tech in pairs(child_techs) do
      if not data_util.table_contains(space_science_parents, child_tech) then
        data_util.tech_add_prerequisites(child_tech, { "space-science-pack" })
        data_util.tech_add_ingredients(child_tech, {"space-science-pack" }, true)
      end
    end
  end

  data_util.tech_add_prerequisites("tungsten-processing", { data_util.mod_prefix .. "material-science-pack" })
  data_util.tech_add_ingredients("tungsten-processing", {  "space-science-pack", data_util.mod_prefix .. "material-science-pack" }, true)

  data_util.tech_remove_prerequisites("rocket-silo", {"nitinol-processing"})
  data_util.tech_add_prerequisites("nitinol-processing", { data_util.mod_prefix .. "space-catalogue-material-4"})

  data_util.tech_add_prerequisites("bob-laser-rifle", { data_util.mod_prefix .. "space-laser-laboratory"})

end

--------------------------------------------------
-- Bob's Warfare and alien research - thanks to Dullahan
--
-- This is only necessary when both mods are installed, as otherwise, the technologies are researchable
-- in normal labs, or don't exist at all

if mods["bobenemies"] and mods["bobwarfare"] then
  local remove_packs = {
    "space-science-pack",
    data_util.mod_prefix .. "material-science-pack",
  }

  local tech_names = {
    "alien-blue-research",
    "alien-orange-research",
    "alien-purple-research",
    "alien-yellow-research",
    "alien-green-research",
    "alien-red-research",
    "bob-shotgun-ap-shells",
    "bob-shotgun-ap-shells",
    "bob-shotgun-electric-shells",
    "bob-shotgun-acid-shells",
    "bob-shotgun-explosive-shells",
    "bob-shotgun-poison-shells",
    "bob-shotgun-flame-shells",
    "bob-ap-bullets",
    "bob-electric-bullets",
    "bob-acid-bullets",
    "bob-he-bullets",
    "bob-poison-bullets",
    "bob-flame-bullets",
    "bob-piercing-rocket",
    "bob-electric-rocket",
    "bob-acid-rocket",
    "bob-explosive-rocket",
    "bob-poison-rocket",
    "bob-flame-rocket",
  }
  for _, tech in pairs(data.raw.technology) do
    for _, name_part in pairs(tech_names) do
      if string.find(tech.name, name_part, 1, true) then
        -- remove special science packs
        data_util.tech_remove_ingredients(tech.name, remove_packs)
      end
    end
  end

  -- NOTE:
  -- * piercing ammo (all 3 types) are locked behind tungsten,
  --   and thus behind space and material science
  -- * all rockets are locked behind tungsten as well
  -- * This means that bullets and shells can be produced before going to space,
  --   which fits the theme of them being available with blue science in a normal game
end

--------------------------------------------------
-- MODULES

if mods["bobmodules"] then
  local remove_packs = {
    "production-science-pack",
    "utility-science-pack",
    "space-science-pack",
    data_util.mod_prefix .. "material-science-pack",
    data_util.mod_prefix .. "energy-science-pack",
    data_util.mod_prefix .. "biological-science-pack",
    data_util.mod_prefix .. "astronomic-science-pack",
    data_util.mod_prefix .. "deep-space-science-pack",
  }

  local techs_names = {
    "speed-module-",
    "effectivity-module-",
    "productivity-module-",
    "pollution-clean-module-",
    "pollution-create-module-",
    "effectivity-module-",
    --"raw-speed-module-",
    "green-module-",
    --"raw-productivity-module-",
    "god-module-",
  }
  for _, tech in pairs(data.raw.technology) do
    for _, name_part in pairs(techs_names) do
      if string.find(tech.name, name_part, 1, true) then
        -- remove special science packs
        data_util.tech_remove_ingredients(tech.name, remove_packs)
      end
    end
  end

  -- T1 just requires modules research

  -- T2 requires production science
  data_util.tech_add_prerequisites("speed-module-2", {"production-science-pack" })
  data_util.tech_add_prerequisites("effectivity-module-2", {"production-science-pack" })
  data_util.tech_add_prerequisites("productivity-module-2", {"production-science-pack" })
  data_util.tech_add_prerequisites("pollution-create-module-2", {"production-science-pack" })
  data_util.tech_add_prerequisites("pollution-clean-module-2", {"production-science-pack" })
  data_util.tech_add_prerequisites("green-module-1", {"production-science-pack" })
  data_util.tech_add_prerequisites("raw-speed-module-1", {"production-science-pack" })
  data_util.tech_add_prerequisites("raw-productivity-module-1", {"production-science-pack" })

  -- T3 requires space science
  data_util.tech_remove_prerequisites("speed-module-3", {data_util.mod_prefix .. "material-science-pack"})
  data_util.tech_remove_prerequisites("effectivity-module-3", {data_util.mod_prefix .. "energy-science-pack"})
  data_util.tech_remove_prerequisites("productivity-module-3", {data_util.mod_prefix .. "biological-science-pack"})

  data_util.tech_add_prerequisites("speed-module-3", {"space-science-pack" })
  data_util.tech_add_prerequisites("effectivity-module-3", {"space-science-pack" })
  data_util.tech_add_prerequisites("productivity-module-3", {"space-science-pack" })
  data_util.tech_add_prerequisites("pollution-create-module-3", {"space-science-pack" })
  data_util.tech_add_prerequisites("pollution-clean-module-3", {"space-science-pack" })
  data_util.tech_add_prerequisites("green-module-2", {"space-science-pack" })
  data_util.tech_add_prerequisites("raw-speed-module-2", {"space-science-pack" })
  data_util.tech_add_prerequisites("raw-productivity-module-2", {"space-science-pack" })

  -- T4 requires advanced science
  data_util.tech_add_prerequisites("speed-module-4", {data_util.mod_prefix .. "space-catalogue-material-1" })
  data_util.tech_add_prerequisites("productivity-module-4", {data_util.mod_prefix .. "space-catalogue-material-1" })

  data_util.tech_add_prerequisites("raw-speed-module-3", {data_util.mod_prefix .. "space-catalogue-material-1", data_util.mod_prefix .. "space-catalogue-energy-1" })
  data_util.tech_add_prerequisites("raw-productivity-module-3", {data_util.mod_prefix .. "space-catalogue-material-1", data_util.mod_prefix .. "space-catalogue-energy-1" })

  data_util.tech_add_prerequisites("effectivity-module-4", {data_util.mod_prefix .. "space-catalogue-energy-1" })
  data_util.tech_add_prerequisites("green-module-3", {data_util.mod_prefix .. "space-catalogue-energy-1", data_util.mod_prefix .. "space-catalogue-biological-1" })

  data_util.tech_add_prerequisites("pollution-create-module-4", {data_util.mod_prefix .. "space-catalogue-biological-1" })
  data_util.tech_add_prerequisites("pollution-clean-module-4", {data_util.mod_prefix .. "space-catalogue-biological-1" })

  data_util.tech_add_prerequisites("god-module-1", {
    data_util.mod_prefix .. "space-catalogue-material-1",
    data_util.mod_prefix .. "space-catalogue-biological-1",
    data_util.mod_prefix .. "space-catalogue-energy-1",
    data_util.mod_prefix .. "space-catalogue-astronomic-1" })

  -- T5
  data_util.tech_add_prerequisites("speed-module-5", {data_util.mod_prefix .. "space-catalogue-material-2" })
  data_util.tech_add_prerequisites("productivity-module-5", {data_util.mod_prefix .. "space-catalogue-material-2" })

  data_util.tech_add_prerequisites("raw-speed-module-4", {data_util.mod_prefix .. "space-catalogue-material-2", data_util.mod_prefix .. "space-catalogue-energy-2" })
  data_util.tech_add_prerequisites("raw-productivity-module-4", {data_util.mod_prefix .. "space-catalogue-material-2", data_util.mod_prefix .. "space-catalogue-energy-2" })

  data_util.tech_add_prerequisites("effectivity-module-5", {data_util.mod_prefix .. "space-catalogue-energy-2" })
  data_util.tech_add_prerequisites("green-module-4", {data_util.mod_prefix .. "space-catalogue-energy-2", data_util.mod_prefix .. "space-catalogue-biological-2" })

  data_util.tech_add_prerequisites("pollution-create-module-5", {data_util.mod_prefix .. "space-catalogue-biological-2" })
  data_util.tech_add_prerequisites("pollution-clean-module-5", {data_util.mod_prefix .. "space-catalogue-biological-2" })

  -- T6
  data_util.tech_add_prerequisites("speed-module-6", {data_util.mod_prefix .. "space-catalogue-material-3" })
  data_util.tech_add_prerequisites("productivity-module-6", {data_util.mod_prefix .. "space-catalogue-material-3" })

  data_util.tech_add_prerequisites("raw-speed-module-5", {data_util.mod_prefix .. "space-catalogue-material-3", data_util.mod_prefix .. "space-catalogue-energy-3" })
  data_util.tech_add_prerequisites("raw-productivity-module-5", {data_util.mod_prefix .. "space-catalogue-material-3", data_util.mod_prefix .. "space-catalogue-energy-3" })

  data_util.tech_add_prerequisites("effectivity-module-6", {data_util.mod_prefix .. "space-catalogue-energy-3" })
  data_util.tech_add_prerequisites("green-module-5", {data_util.mod_prefix .. "space-catalogue-energy-3", data_util.mod_prefix .. "space-catalogue-biological-3" })

  data_util.tech_add_prerequisites("pollution-create-module-6", {data_util.mod_prefix .. "space-catalogue-biological-3" })
  data_util.tech_add_prerequisites("pollution-clean-module-6", {data_util.mod_prefix .. "space-catalogue-biological-3" })

  data_util.tech_add_prerequisites("god-module-2", {
    data_util.mod_prefix .. "space-catalogue-material-3",
    data_util.mod_prefix .. "space-catalogue-biological-3",
    data_util.mod_prefix .. "space-catalogue-energy-3",
    data_util.mod_prefix .. "space-catalogue-astronomic-3" })

  -- T7
  data_util.tech_add_prerequisites("speed-module-7", {data_util.mod_prefix .. "space-catalogue-material-4" })
  data_util.tech_add_prerequisites("productivity-module-7", {data_util.mod_prefix .. "space-catalogue-material-4" })

  data_util.tech_add_prerequisites("raw-speed-module-6", {data_util.mod_prefix .. "space-catalogue-material-4", data_util.mod_prefix .. "space-catalogue-energy-4" })
  data_util.tech_add_prerequisites("raw-productivity-module-6", {data_util.mod_prefix .. "space-catalogue-material-4", data_util.mod_prefix .. "space-catalogue-energy-4" })

  data_util.tech_add_prerequisites("effectivity-module-7", {data_util.mod_prefix .. "space-catalogue-energy-4" })
  data_util.tech_add_prerequisites("green-module-6", {data_util.mod_prefix .. "space-catalogue-energy-4", data_util.mod_prefix .. "space-catalogue-biological-4" })

  data_util.tech_add_prerequisites("pollution-create-module-7", {data_util.mod_prefix .. "space-catalogue-biological-4" })
  data_util.tech_add_prerequisites("pollution-clean-module-7", {data_util.mod_prefix .. "space-catalogue-biological-4" })

  -- T8
  data_util.tech_add_prerequisites("speed-module-8", {data_util.mod_prefix .. "deep-space-science-pack" })
  data_util.tech_add_prerequisites("productivity-module-8", {data_util.mod_prefix .. "deep-space-science-pack" })

  data_util.tech_add_prerequisites("raw-speed-module-7", {data_util.mod_prefix .. "deep-space-science-pack" })
  data_util.tech_add_prerequisites("raw-productivity-module-7", {data_util.mod_prefix .. "deep-space-science-pack" })

  data_util.tech_add_prerequisites("effectivity-module-8", {data_util.mod_prefix .. "deep-space-science-pack" })
  data_util.tech_add_prerequisites("green-module-7", {data_util.mod_prefix .. "deep-space-science-pack" })

  data_util.tech_add_prerequisites("pollution-create-module-7", {data_util.mod_prefix .. "deep-space-science-pack" })
  data_util.tech_add_prerequisites("pollution-clean-module-7", {data_util.mod_prefix .. "deep-space-science-pack" })

  data_util.tech_add_prerequisites("god-module-3", {data_util.mod_prefix .. "deep-space-science-pack" })

end
