local util = require("util")

local Universe = {}

UniverseRaw = require("universe-raw")
-- stellar cluster inflation code
-- universe-data.lua has base stellar cluster model and unassigned data
-- the model gets inflated by assigning the unassigned data in a deterministic-pseudo-random pattern based on nauvis's map gen seed

-- the list is used in control.lua for space mechanics
-- resource picker selects which core fragments the planet generates
-- the data gets saved to global on init

-- A group of close in a stellar cluster, each with many planets, each with many moons

-- 30 ish stars
  -- 120-150 planets, min of 3 per star
    -- the rest are moons (350-380)

-- Nauvis is a planet
-- Nauvis orbits the star called... Calidus

-- general concepts:
--[[
star (inaccessable)
  star orbit
  asteroid belt
  planet
    planet orbit
    moon
      moon orbit
asteroid field
deep space

leaving a planet is hard
leaving a moon is less hard
leaving orbit is easy
leaving an asteroid belt is easy
leaving deep space / asteroid fields is free

travel from within a planetary system (planet-moon, moon-moon) is easy
travel from between a planetary systems (or to the star) is difficult
travel between solar systems is very hard
travel to-from deep space difficult

Of just have a generic asteroid field that is the deep space option and is the bridge between all.


it is easier to go from star to deep space to star than star to star
]]--


Universe.planet_max_radius = 10000
-- average is 4000
-- moon max_radius is 50% of it's own planet's actual radius
-- average is 1600

-- NOTE: there are limited numbers of names so more moons means less planets
Universe.average_moons_per_planet = 3
Universe.max_asteroid_belts = 2

Universe.temperature_tags = {"temperature_bland", "temperature_temperate", "temperature_balanced", "temperature_wild", "temperature_extreme",
  "temperature_cool", "temperature_cold", "temperature_vcold", "temperature_frozen",
  "temperature_warm", "temperature_hot", "temperature_vhot", "temperature_volcanic"}
Universe.water_tags = {"water_none", "water_low", "water_med", "water_high", "water_max"}
Universe.moisture_tags = {"moisture_none", "moisture_low", "moisture_med", "moisture_high", "moisture_max"}
Universe.trees_tags = {"trees_none", "trees_low", "trees_med", "trees_high", "trees_max"}
Universe.enemy_tags = {"enemy_none", "enemy_low", "enemy_med", "enemy_high", "enemy_max"}

Universe.guaranteed_resources_space = { "copper-ore", "iron-ore", "stone", "uranium-ore"}

-- exclude anything that required liquid water or biolgical processes
Universe.exclude_resource_words_space = {"oil", "gas", "coal", "bio", "wood", "vent", "water", "liquid", "hydro", "petro", "thermal",
  "imersite", "menarite" -- krastorio
}
Universe.include_resource_space = {mod_prefix.."water-ice"}

-- exclude things that are obiously space only
Universe.exclude_resource_words_planet = {"helium", "space", "asteroid", mod_prefix.."water-ice", mod_prefix.."methane-ice"}


Universe.planet_resource_primary_frequency_min = 0.6
Universe.planet_resource_primary_frequency_max = 1.5
Universe.planet_resource_primary_size_min = 1.5
Universe.planet_resource_primary_size_max = 4
Universe.planet_resource_primary_richness_min = 1.5
Universe.planet_resource_primary_richness_max = 4

Universe.planet_resource_other_frequency_min = 1
Universe.planet_resource_other_frequency_max = 1.5
Universe.planet_resource_other_size_min = 0.05
Universe.planet_resource_other_size_max = 1
Universe.planet_resource_other_richness_min = 0.05
Universe.planet_resource_other_richness_max = 1

Universe.space_resource_primary_frequency = 4
Universe.space_resource_primary_size_min = 3
Universe.space_resource_primary_size_max = 5
Universe.space_resource_primary_richness_min = 1
Universe.space_resource_primary_richness_max = 2

Universe.space_resource_other_frequency = 4
Universe.space_resource_other_size_min = 1.5
Universe.space_resource_other_size_max = 2
Universe.space_resource_other_richness_min = 0.8
Universe.space_resource_other_richness_max = 1.4


function Universe.load_resource_data()
  -- called during Universe.build() as part of initial setup
  -- calles as part of on_configuration_changed to see if resource settings have changed.
  -- load data and save to global for reuse and tracking changes

  local resource_controls = {}

  for _, control in pairs(game.autoplace_control_prototypes) do
    if control.category == "resource" then
      table.insert(resource_controls, control.name)
    end
  end

  -- all core fragments
  local core_fragments = {}

  -- always allow iron ore, copper ore, stone, and uranium ore in space even if not allowed on planets
  local space_resources = table.deepcopy(Universe.guaranteed_resources_space)

  --local planet_resources = {"coal", "copper-ore", "crude-oil", "iron-ore", "stone", "uranium-ore"}
  local planet_resources = {}

  for _, item_proto in pairs(game.item_prototypes ) do
    if item_proto.localised_name and item_proto.localised_name[1] and item_proto.localised_name[1] == "item-name.core-fragment" then
      table.insert(core_fragments, item_proto.name)
    end
  end

  for _, resource_proto in pairs(game.entity_prototypes) do
    if resource_proto.type == "resource" then
      if resource_proto.autoplace_specification
       and not Util.table_contains(Shared.resources_with_shared_controls, resource_proto.name) -- pretend it is not here if based on something else
        then -- not disabled

          if not game.autoplace_control_prototypes[resource_proto.name] then
            error("Error: autoplace_control not found for " .. resource_proto.name .. ".")
          end

          local allowed_in_space = true
          local allowed_on_planet = true
          if not Util.table_contains(Universe.include_resource_space, resource_proto.name) then
            for _, word in pairs(Universe.exclude_resource_words_space) do
              if string.find(resource_proto.name, word, 1, true) then
                allowed_in_space = false
                break
              end
            end
          end
          for _, word in pairs(Universe.exclude_resource_words_planet) do
            if string.find(resource_proto.name, word, 1, true) then
              allowed_on_planet = false
              break
            end
          end

          if allowed_in_space and not util.table_contains(space_resources, resource_proto.name) then
            table.insert(space_resources, resource_proto.name)
          end

          if allowed_on_planet and not util.table_contains(planet_resources, resource_proto.name) then
            table.insert(planet_resources, resource_proto.name)
          end
      end
    end
  end

  local resources_and_controls = {
    resource_controls = resource_controls,
    core_fragments = core_fragments,
    planet_resources = planet_resources,
    space_resources = space_resources,
  }
  local compare_string = util.table_to_string(resources_and_controls)

  local all_resources = {}
  for _, resource in pairs(resources_and_controls.planet_resources) do
    all_resources[resource] = resource
  end
  for _, resource in pairs(resources_and_controls.space_resources) do
    all_resources[resource] = resource
  end
  resources_and_controls.all_resources = all_resources

  if global.resources_and_controls and global.resources_and_controls_compare_string ~= compare_string then
      log( "Resource settings mismatch: ")
      log( "Old settings: " .. global.resources_and_controls_compare_string )
      log( "New settings: " .. compare_string)
    --TODO: Implement code that reassignes controls and core fragments
      --game.write_file("space-exploration.old_resources_and_controls_compare_string.lua",
      --  serpent.dump(global.resources_and_controls_compare_string, {comment=false, sparse=true, indent = "\t", nocode=true, name="old_resources_and_controls_compare_string"}), false)

      --game.write_file("space-exploration.new_resources_and_controls_compare_string.lua",
      --  serpent.dump(global.compare_string, {comment=false, sparse=true, indent = "\t", nocode=true, name="new_resources_and_controls_compare_string"}), false)

      local old_resources_and_controls = global.resources_and_controls
      local old_resources_and_controls_compare_string = global.compare_string

      global.resources_and_controls = resources_and_controls
      global.resources_and_controls_compare_string = compare_string

      --error("Changing resources and controls mid-game is currently not supported." )
      local planet_resources_added = {}
      local planet_resources_removed = {}
      local space_resources_added = {}
      local space_resources_removed = {}

      for _, old_resource in pairs(old_resources_and_controls.planet_resources) do
        if not Util.table_contains(resources_and_controls.planet_resources, old_resource) then
          table.insert(planet_resources_removed, old_resource)
        end
      end

      for _, new_resource in pairs(resources_and_controls.planet_resources) do
        if not Util.table_contains(old_resources_and_controls.planet_resources, new_resource) then
          table.insert(planet_resources_added, new_resource)
        end
      end

      for _, old_resource in pairs(old_resources_and_controls.space_resources) do
        if not Util.table_contains(resources_and_controls.space_resources, old_resource) then
          table.insert(space_resources_removed, old_resource)
        end
      end

      for _, new_resource in pairs(resources_and_controls.space_resources) do
        if not Util.table_contains(old_resources_and_controls.space_resources, new_resource) then
          table.insert(space_resources_added, new_resource)
        end
      end


      -- go through each planet
      -- check that primary resource and framgnets are supported
      -- if not overridee existing fragment and control settings with new random

      for _, zone in pairs(global.zone_index) do
        if (zone.inflated or zone.surface_index) and (zone.name ~= "Nauvis" and zone.is_homeworld ~= true) then

          local prototype = Universe.get_zone_prototype(zone.name)
          Log.trace("Universe.load_resource_data: Update resources for zone: ".. zone.name)

          if Zone.is_solid(zone) then

            zone.resources = zone.resources or {}
            zone.controls = zone.controls or {}

            local valid_resources = {}
            for _, resource in pairs(zone.resources) do
              if Util.table_contains(resources_and_controls.planet_resources, resource) then
                Log.trace("Universe.load_resource_data: ".. zone.name .. " "..resource.." still valid")
                table.insert(valid_resources, resource)
              end
            end
            if #valid_resources > 0 then
              zone.resources = valid_resources
            else
              Log.trace("Universe.load_resource_data: ".. zone.name .. " has no valid resources")
              if zone.resources and zone.resources[1] then Log.trace("Universe.load_resource_data: ".. zone.name .. " had primary resource: " .. zone.resources[1]) end
              -- return to prototype if able
              if prototype and prototype.resources and prototype.resources[1] and resources_and_controls.planet_resources[prototype.resources[1]] then
                Log.trace("Universe.load_resource_data: ".. zone.name .. " assigning resource from template: " .. prototype.resources[1] )
                zone.resources = { prototype.resources[1] }
              else
                zone.resources = { resources_and_controls.planet_resources[math.random(#resources_and_controls.planet_resources)] }
                Log.trace("Universe.load_resource_data: ".. zone.name .. " assigning random resource: " .. zone.resources[1] )
              end
              -- update control settings
              zone.controls[zone.resources[1]] = {
                frequency = Util.lerp(Universe.planet_resource_primary_frequency_min, Universe.planet_resource_primary_frequency_max, math.random()),
                size = Util.lerp(Universe.planet_resource_primary_size_min, Universe.planet_resource_primary_size_max, math.random()),
                richness = Util.lerp(Universe.planet_resource_primary_richness_min, Universe.planet_resource_primary_richness_max, math.random()),
              }
            end
            -- update fragment
            if not game.item_prototypes[zone.fragment_name] then
              Log.trace("Universe.load_resource_data: ".. zone.name .. " fragment is invalid")
              zone.fragment_name = nil
              for _, resource in pairs(zone.resources) do
                if game.item_prototypes[util.mod_prefix .. "core-fragment-" .. resource] then
                  zone.fragment_name = util.mod_prefix .. "core-fragment-" .. resource
                  break
                end
              end
              if zone.fragment_name == nil then
                zone.fragment_name = global.resources_and_controls.core_fragments[
                  math.random(#global.resources_and_controls.core_fragments)]
                log(zone.name .. " can't find fragment: ".. util.mod_prefix .. "core-fragment-" .. resource .. ". Resorting to random fragment.")
              end
              if zone.fragment_name then
                --
                local surface = Zone.get_surface(zone)
                if surface then
                  for _, entity in pairs(surface.find_entities_filtered{name = mod_prefix.."core-miner"}) do
                    local resources = surface.find_entities_filtered{type = "resource", area = Util.position_to_area(entity.position, 2)}
                    for _, resource in pairs(resources) do
                      resource.destroy()
                    end
                    local resource = entity.surface.create_entity{
                       name = zone.fragment_name,
                       position = entity.position,
                       direction = entity.direction,
                       amount = 1,
                    }
                  end
                  Coreminer.equalise(zone, surface)
                end
              end
            end

            -- other random resources that do not have controls
            for _, resource in pairs(resources_and_controls.planet_resources) do
              if not zone.controls[resource] then
                Log.trace("Universe.load_resource_data: ".. zone.name .. " " .. resource .. " does not have a control, assigning random low values")
                zone.controls[resource] = {
                  frequency = Util.lerp(Universe.planet_resource_other_frequency_min, Universe.planet_resource_other_frequency_max, math.random()),
                  size = Util.lerp(Universe.planet_resource_other_size_min, Universe.planet_resource_other_size_max, math.random()),
                  richness = Util.lerp(Universe.planet_resource_other_richness_min, Universe.planet_resource_other_richness_max, math.random()),
                }
              end
            end

            -- any removed resources
            for _, resource in pairs(planet_resources_removed) do
              Log.trace("Universe.load_resource_data: ".. zone.name .. " " .. resource .. " is removed, zeroing controls")
              zone.controls[resource] = {
                frequency = 1,
                size = 0,
                richness = 0,
              }
            end

          else -- any space zone

            zone.resources = zone.resources or {}
            zone.controls = zone.controls or {}

            if zone.type == "orbit" or zone.type == "asteroid-field" then -- these have primaries
              zone.resources = zone.resources or {}
              local valid_resources = {}
              for _, resource in pairs(zone.resources) do
                if Util.table_contains(resources_and_controls.space_resources, resource) then
                  Log.trace("Universe.load_resource_data: ".. zone.name .. " "..resource.." still valid")
                  table.insert(valid_resources, resource)
                end
              end
              if #valid_resources > 0 and prototype.resources and (prototype.resources[1] == mod_prefix.."water-ice" or prototype.resources[1] == mod_prefix.."methane-ice") then
                Log.trace("Universe.load_resource_data: ".. zone.name .. " has valid resources but should new be water or methane ice, reseting old primary")
                zone.controls[valid_resources[1]] = {
                  frequency = Universe.space_resource_primary_frequency, -- high frequency
                  size = Util.lerp(Universe.space_resource_primary_size_min, Universe.space_resource_primary_size_max, math.random()), -- high size
                  richness = Util.lerp(Universe.space_resource_primary_richness_min, Universe.space_resource_primary_richness_max, math.random()), -- low richness
                }
                valid_resources = {}
              end
              if #valid_resources > 0 then
                zone.resources = valid_resources
              else
                Log.trace("Universe.load_resource_data: ".. zone.name .. " has no valid resources")
                if zone.resources and zone.resources[1] then Log.trace("Universe.load_resource_data: ".. zone.name .. " had primary resource: " .. zone.resources[1]) end

                if prototype and prototype.resources and prototype.resources[1] and resources_and_controls.space_resources[prototype.resources[1]] then
                  Log.trace("Universe.load_resource_data: ".. zone.name .. " assigning resource from template: " .. prototype.resources[1] )
                  zone.resources = { prototype.resources[1] }
                else
                  zone.resources = { resources_and_controls.space_resources[math.random(#resources_and_controls.space_resources)] }
                  Log.trace("Universe.load_resource_data: ".. zone.name .. " assigning random resource: " .. zone.resources[1] )
                end
                -- update control settings
                if zone.type == "asteroid-field" then
                  local boost  = 1
                  zone.controls[zone.resources[1]] = {
                    frequency = Universe.space_resource_primary_frequency, -- high frequency
                    size = Util.lerp(Universe.space_resource_primary_size_min, Universe.space_resource_primary_size_max, math.random()), -- high size
                    richness = Util.lerp(Universe.space_resource_primary_richness_min, Universe.space_resource_primary_richness_max, math.random()), -- low richness
                  }
                else -- orbit
                  zone.controls[zone.resources[1]] = {
                    frequency = Universe.space_resource_other_frequency,
                    size = Util.lerp(Universe.space_resource_other_size_min , Universe.space_resource_other_size_max, math.random()),
                    richness = Util.lerp(Universe.space_resource_other_richness_min, Universe.space_resource_other_richness_max, math.random()),
                  }
                end
              end
            end

            -- other random resources that do not have controls
            for _, resource in pairs(resources_and_controls.space_resources) do
              local boost = zone.type == "asteroid-belt" and 1 or 0
              if not zone.controls[resource] then
                Log.trace("Universe.load_resource_data: ".. zone.name .. " " .. resource .. " does not have a control, assigning random low values")
                if boost >= 1 then
                  zone.controls[resource] = {
                    frequency = Universe.space_resource_primary_frequency, -- high frequency
                    size = Util.lerp(Universe.space_resource_primary_size_min, Universe.space_resource_primary_size_max, math.random()), -- high size
                    richness = Util.lerp(Universe.space_resource_primary_richness_min, Universe.space_resource_primary_richness_max, math.random()), -- low richness
                  }
                else
                  zone.controls[resource] = {
                    frequency = Universe.space_resource_other_frequency,
                    size = Util.lerp(Universe.space_resource_other_size_min , Universe.space_resource_other_size_max, math.random()),
                    richness = Util.lerp(Universe.space_resource_other_richness_min, Universe.space_resource_other_richness_max, math.random()),
                  }
                end
              end
            end

            -- any removed resources
            for _, resource in pairs(space_resources_removed) do
              Log.trace("Universe.load_resource_data: ".. zone.name .. " " .. resource .. " is removed, zeroing controls")
              zone.controls[resource] = {
                frequency = 1,
                size = 0,
                richness = 0,
              }
            end

          end

          -- fallback
          for _, control in pairs(game.autoplace_control_prototypes) do
            if control.category == "resource" and not zone.controls[control.name] then
              Log.trace("Universe.load_resource_data: ".. zone.name .. " control: " .. control.name .." has no settings, applying zeros")
              zone.controls[control.name] = {
                frequency = 1,
                size = 0,
                richness = 0,
              }
            end
          end

          local surface = Zone.get_surface(zone)
          if surface then
            Log.trace("Universe.load_resource_data: ".. zone.name .. " setting controls to mapgen")
            local map_gen_settings = surface.map_gen_settings
            for name, control in pairs(zone.controls) do
              if name ~= "enemy-base" and game.autoplace_control_prototypes[name] then
                map_gen_settings.autoplace_controls[name] = table.deepcopy(control)
              end
            end
            Log.debug_log(Util.table_to_string(map_gen_settings))
            surface.map_gen_settings = map_gen_settings
          end

        end

      end

  else
    global.resources_and_controls = resources_and_controls
    global.resources_and_controls_compare_string = compare_string
  end

end

function Universe.apply_control_tags(controls, tags)
  if not tags then return controls end
  for _, tag in pairs(tags) do

    if tag == "water_none" then
      controls.water = {size = 0}
    elseif tag == "water_low" then
      controls.water = {frequency=0.5, size = 0.3}
    elseif tag == "water_med" then
      controls.water = {frequency=1, size = 1}
    elseif tag == "water_high" then
      controls.water = {frequency=1, size = 4}
    elseif tag == "water_max" then
      controls.water = {frequency=0.5, size = 10}

    elseif tag == "moisture_none" then
      controls.moisture={frequency=2, bias=-1}
    elseif tag == "moisture_low" then
      controls.moisture={frequency=1, bias=-0.15}
    elseif tag == "moisture_med" then
      controls.moisture={frequency=1, bias=0}
    elseif tag == "moisture_high" then
      controls.moisture={frequency=1, bias=0.15}
    elseif tag == "moisture_max" then
      controls.moisture={frequency=2, bias=0.5}

    elseif tag == "aux_low" then
      controls.aux={frequency=1, bias=-0.5}
    elseif tag == "aux_med" then
      controls.aux={frequency=1, bias=0}
    elseif tag == "aux_high" then
      controls.aux={frequency=1, bias=0.5}

    elseif tag == "temperature_bland" then
      controls.hot={frequency=0.5, size=0}
      controls.cold={frequency=0.5, size=0}
    elseif tag == "temperature_temperate" then
      controls.hot={frequency=1, size=0.25}
      controls.cold={frequency=1, size=0.25}
    elseif tag == "temperature_balanced" then
      controls.hot={frequency=1, size=1}
      controls.cold={frequency=1, size=1}
    elseif tag == "temperature_wild" then
      controls.hot={frequency=1, size=3}
      controls.cold={frequency=1, size=3}
    elseif tag == "temperature_extreme" then
      controls.hot={frequency=0.5, size=6}
      controls.cold={frequency=0.5, size=6}

    elseif tag == "temperature_cool" then
      controls.hot={frequency=0.75, size=0}
      controls.cold={frequency=0.75, size=0.5}
    elseif tag == "temperature_cold" then
      controls.hot={frequency=0.5, size=0}
      controls.cold={frequency=0.5, size=1}
    elseif tag == "temperature_vcold" then
      controls.hot={frequency=0.5, size=0}
      controls.cold={frequency=0.5, size=3}
    elseif tag == "temperature_frozen" then
      controls.hot={frequency=0.5, size=0}
      controls.cold={frequency=0.5, size=6}

    elseif tag == "temperature_warm" then
      controls.hot={frequency=0.75, size=0.5}
      controls.cold={frequency=0.75, size=0}
    elseif tag == "temperature_hot" then
      controls.hot={frequency=0.5, size=1}
      controls.cold={frequency=0.5, size=0}
    elseif tag == "temperature_vhot" then
      controls.hot={frequency=0.5, size=3}
      controls.cold={frequency=0.5, size=0}
    elseif tag == "temperature_volcanic" then
      controls.hot={frequency=0.5, size=6}
      controls.cold={frequency=0.5, size=0}

    elseif tag == "trees_none" then
      controls.trees={frequency=1, size=0, richness = 0}
    elseif tag == "trees_low" then
      controls.trees={frequency=1.5, size=0.25, richness = 0.8}
    elseif tag == "trees_med" then
      controls.trees={frequency=1, size=0.66, richness = 1}
    elseif tag == "trees_high" then
      controls.trees={frequency=1, size=1, richness = 1}
    elseif tag == "trees_max" then
      controls.trees={frequency=1, size=2, richness = 1}

    elseif tag == "enemy_none" then
      controls["enemy-base"]={frequency=0.000001, size=-1, richness = -1}
    elseif tag == "enemy_low" then
      controls["enemy-base"]={frequency=0.3, size=0.3, richness = 0.3}
    elseif tag == "enemy_med" then
      controls["enemy-base"]={frequency=1, size=1, richness = 1}
    elseif tag == "enemy_high" then
      controls["enemy-base"]={frequency=1.5, size=2, richness = 1.5}
    elseif tag == "enemy_max" then
      controls["enemy-base"]={frequency=2, size=6, richness = 2}
    else
      log("invalid climate tag: " .. tag)
    end
  end
  return controls
end

function Universe.shuffle(tbl)
  -- global.rng should always be re-assigned at the start of Universe.build
  size = #tbl
  for i = size, 1, -1 do
    local rand = global.rng(1, size)
    tbl[i], tbl[rand] = tbl[rand], tbl[i]
  end
  return tbl
end

function Universe.inflate_controls(zone, overwrite)
  if not global.rng then global.rng = game.create_random_generator() end
  if not zone.seed then zone.seed = global.rng(4294967295) end
  local crng = game.create_random_generator(zone.seed)

  if zone.inflated and not overwrite then return end

  if zone.type == "orbit" and (zone.parent.type == "planet" or zone.parent.type == "moon") then
    -- orbit around planet or moon
    -- the controls will be set by the planet or moon
    zone.inflated = true
    Universe.inflate_controls(zone.parent)
  elseif zone.type == "planet" or zone.type == "moon" then
    zone.inflated = true
    local prototype = Universe.get_zone_prototype(zone.name)

    -- nauvis is 25000
    if not zone.ticks_per_day then
      zone.ticks_per_day = 25000 -- nauvis
      if (zone.name ~= "Nauvis" and zone.is_homeworld ~= true) then
        if crng() < 0.5 then
          zone.ticks_per_day = 60*60 + crng(60*60*59) -- 1 - 60 minutes
        else
          zone.ticks_per_day = 60*60 + crng(60*60*19) -- 1 - 20 minutes
        end
      end
    end

    ------------------------------------------------------------------------------
    -- Planet/Moon resource assignment

    -- apply prototype settings
    zone.controls = prototype.controls and table.deepcopy(prototype.controls) or {}
    zone.tags = prototype.tags and table.deepcopy(prototype.tags) or {}
    zone.resources = prototype.resources and table.deepcopy(prototype.resources) or {}
    zone.biome_replacements = prototype.biome_replacements and table.deepcopy(prototype.biome_replacements) or {}

    zone.controls = Universe.apply_control_tags(zone.controls, zone.tags) -- applies controls to all zones

    if zone.biome_replacements then
      Zone.build_tile_replacements(zone)
    end

    -- validate specified planet resource bias
    local prefer_resources = zone.resources or {}
    local valid_resources = {}
    for _, resource in pairs(prefer_resources) do
      if Util.table_contains(global.resources_and_controls.planet_resources, resource) then
        table.insert(valid_resources, resource)
      end
    end

    if #valid_resources > 0 then -- prefered resource was valid
      zone.resources = valid_resources
    else -- choose random resource
      local resource = global.resources_and_controls.planet_resources[
        crng(#global.resources_and_controls.planet_resources)]
      if resource == "uranium-ore" and crng() < 0.6 then
        -- rare, replace with something else
        resource = global.resources_and_controls.planet_resources[
          crng(#global.resources_and_controls.planet_resources)]
      end
      zone.resources = {resource}
    end

    for _, resource in pairs(zone.resources) do
      -- choose coresponding resource fragment if there is one
      if game.item_prototypes[util.mod_prefix .. "core-fragment-" .. resource] then
        zone.fragment_name = util.mod_prefix .. "core-fragment-" .. resource
        break
      else
        zone.fragment_name = global.resources_and_controls.core_fragments[
          crng(#global.resources_and_controls.core_fragments)]
        log(zone.name .. " can't find fragment: ".. util.mod_prefix .. "core-fragment-" .. resource .. ". Resorting to random fragment.")
      end
    end

    if not zone.fragment_name then
      log(zone.name .. " zone missing dedicated fragment. Resorting to omni fragment.")
      zone.fragment_name = util.mod_prefix .. "core-fragment-omni" -- temporary fallback
    end

    ------------------------------------------------------------------------------
    -- Planet/Moon orbit resource assignment

    -- validate specified planet resource bias
    local orbit_prefer_resources = prefer_resources -- copy the old one
    local orbit_valid_resources = {}
    for _, resource in pairs(orbit_prefer_resources) do
      if Util.table_contains(global.resources_and_controls.space_resources, resource) then
        table.insert(orbit_valid_resources, resource)
      end
    end

    if #orbit_valid_resources == 0 then -- no valid resources, try to match zone
      orbit_prefer_resources = table.deepcopy(zone.resources)
      for _, resource in pairs(orbit_prefer_resources) do
        if Util.table_contains(global.resources_and_controls.space_resources, resource) then
          table.insert(orbit_valid_resources, resource)
        end
      end
    end

    if #orbit_valid_resources > 0 then -- prefered resource was valid
      zone.orbit.resources = orbit_prefer_resources
    else -- choose random resource
      zone.orbit.resources = {global.resources_and_controls.space_resources[
        crng(#global.resources_and_controls.space_resources)]}
    end

    ------------------------------------------------------------------------------
    -- Planet/Moon + own orbit resource controls

    local body_resource_controls = {}
    local orbit_resource_controls = {}

    for _, resource in pairs(global.resources_and_controls.all_resources) do
      local is_planet = Util.table_contains(global.resources_and_controls.planet_resources, resource)
      local is_planet_primary = is_planet and util.table_contains(zone.resources, resource)
      local is_orbit = Util.table_contains(global.resources_and_controls.space_resources, resource)
      local is_orbit_primary = is_orbit and util.table_contains(zone.orbit.resources, resource)
      local random_frequency = crng()
      local random_size = crng()
      local random_richness = crng()
      if is_planet then
        if is_planet_primary then
          body_resource_controls[resource] = {
            frequency = Util.lerp(Universe.planet_resource_primary_frequency_min, Universe.planet_resource_primary_frequency_max, random_frequency),
            size = Util.lerp(Universe.planet_resource_primary_size_min, Universe.planet_resource_primary_size_max, random_size),
            richness = Util.lerp(Universe.planet_resource_primary_richness_min, Universe.planet_resource_primary_richness_max, random_richness),
          }
        else
          body_resource_controls[resource] = {
            frequency = Util.lerp(Universe.planet_resource_other_frequency_min, Universe.planet_resource_other_frequency_max, random_frequency),
            size = Util.lerp(Universe.planet_resource_other_size_min, Universe.planet_resource_other_size_max, random_size),
            richness = Util.lerp(Universe.planet_resource_other_richness_min, Universe.planet_resource_other_richness_max, random_richness),
          }
        end
      else
        body_resource_controls[resource] = {
          frequency = 1,
          size = 0,
          richness = 0,
        }
      end
      if is_orbit then
        if is_orbit_primary then
          orbit_resource_controls[resource] = {
            frequency = Universe.space_resource_primary_frequency,
            size = Util.lerp(Universe.space_resource_primary_size_min, Universe.space_resource_primary_size_max, random_size),
            richness = Util.lerp(Universe.space_resource_primary_richness_min, Universe.space_resource_primary_richness_max, random_richness),
          }
        else
          orbit_resource_controls[resource] = {
            frequency = Universe.space_resource_other_frequency,
            size = Util.lerp(Universe.space_resource_other_size_min, Universe.space_resource_other_size_max, random_size),
            richness = Util.lerp(Universe.space_resource_other_richness_min, Universe.space_resource_other_richness_max, random_richness),
          }
        end
      else
        orbit_resource_controls[resource] = {
          frequency = 4,
          size = 0,
          richness = 0,
        }
      end
    end

    -- random stuff
    local random_climate = {}
    local random_climate_tags = {}
    table.insert(random_climate_tags, Universe.temperature_tags[crng(#Universe.temperature_tags)]) -- random temperature scheme
    -- water, moisture and trees are usually linked but not always
    local rng_water = 1
    local rng_moisture = 1
    local rng_trees = 1
    if crng() < 0.5 then
      rng_water = crng(1, 5)
      rng_moisture = rng_water
      if crng() < 0.5 then
        rng_moisture = crng(1, 5)
      end
      rng_trees = rng_moisture
      if crng() < 0.5 then
        rng_trees = crng(1, 5)
      end
    end
    rng_trees = math.min(rng_trees, crng(1, 5))
    table.insert(random_climate_tags, Universe.water_tags[rng_water])
    table.insert(random_climate_tags, Universe.moisture_tags[rng_moisture])
    table.insert(random_climate_tags, Universe.trees_tags[rng_trees])

    table.insert(random_climate_tags, Universe.enemy_tags[crng(#Universe.enemy_tags)])

    random_climate = Universe.apply_control_tags(random_climate, random_climate_tags)

    random_climate.aux = {frequency = 1, bias = -0.5 + math.pow(crng(), 2)} -- bias to normal

    zone.controls = util.overwrite_table(random_climate, zone.controls) -- hard-coded controls win
    zone.controls = util.overwrite_table(zone.controls, body_resource_controls) -- resource conrtols win

    zone.orbit.controls = zone.orbit.controls or {}
    zone.orbit.controls.tree = {size = 0, richness = 0}

    -- fallback
    for _, control in pairs(game.autoplace_control_prototypes) do
      if control.category == "resource" then
        if not zone.controls[control] then
          zone.controls[control] = {
            frequency = Util.lerp(Universe.planet_resource_other_frequency_min, Universe.planet_resource_other_frequency_max, crng()),
            size = Util.lerp(Universe.planet_resource_other_size_min, Universe.planet_resource_other_size_max, crng()),
            richness = Util.lerp(Universe.planet_resource_other_richness_min, Universe.planet_resource_other_richness_max, crng()),
          }
        end
        if not zone.orbit.controls[control] then
          zone.orbit.controls[control] = {
            frequency = 1,
            size = 0,
            richness = 0,
          }
        end
      end
    end

  else -- some sort of space place
    ------------------------------------------------------------------------------
    zone.inflated = true
    local prototype = Universe.get_zone_prototype(zone.name)
    if zone.type == "orbit" then
      prototype = Universe.get_zone_prototype(zone.parent.name)
    end

    -- apply prototype settings
    zone.controls = prototype.controls and table.deepcopy(prototype.controls) or {}
    zone.tags = prototype.tags and table.deepcopy(prototype.tags) or {}
    zone.resources = prototype.resources and table.deepcopy(prototype.resources) or {}
    zone.biome_replacements = prototype.biome_replacements and table.deepcopy(prototype.biome_replacements) or {}

    -- Space resource assignment

    zone.controls = zone.controls or {}
    zone.controls = Universe.apply_control_tags(zone.controls, zone.tags) -- applies controls to all zones
    zone.controls.tree = {size = 0, richness = 0}
    zone.controls.coal = {size = 0, richness = 0}
    zone.controls["crude-oil"] = {size = 0, richness = 0}

    if not zone.resources then
      zone.resources = {} -- belts usually don't have a bial
    end

    -- validate specified planet resource bias
    local prefer_resources = zone.resources or {}
    local valid_resources = {}
    for _, resource in pairs(prefer_resources) do
      if Util.table_contains(global.resources_and_controls.space_resources, resource) then
        table.insert(valid_resources, resource)
      end
    end

    if #valid_resources > 0 then -- prefered resource was valid
      zone.resources = valid_resources
    else -- choose random resource
      local resource = global.resources_and_controls.space_resources[
        crng(#global.resources_and_controls.space_resources)]
      if resource == "uranium-ore" and crng() < 0.6 then
        -- rare, replace with something else
        resource = global.resources_and_controls.space_resources[
          crng(#global.resources_and_controls.space_resources)]
      end
      zone.resources = {resource}
    end

    local belt_boost = (zone.type == "asteroid-belt") and 1 or 0 -- belts have a general boost

    for _, resource in pairs(global.resources_and_controls.space_resources) do
      if not zone.controls[resource] then
        local boost = belt_boost
        if util.table_contains(zone.resources, resource) then boost = 1 end
        if boost >= 1 then
          zone.controls[resource] = {
            frequency = Universe.space_resource_primary_frequency, -- high frequency
            size = Util.lerp(Universe.space_resource_primary_size_min, Universe.space_resource_primary_size_max, crng()), -- high size
            richness = Util.lerp(Universe.space_resource_primary_richness_min, Universe.space_resource_primary_richness_max, crng()), -- low richness
          }
        else
          zone.controls[resource] = {
            frequency = Universe.space_resource_other_frequency, -- high frequency
            size = Util.lerp(Universe.space_resource_other_size_min, Universe.space_resource_other_size_max, crng()), -- high size
            richness = Util.lerp(Universe.space_resource_other_richness_min, Universe.space_resource_other_richness_max, crng()), -- low richness
          }
        end
      end
    end

    -- fallback
    for _, control in pairs(game.autoplace_control_prototypes) do
      if control.category == "resource" then
        if not zone.controls[control] then
          zone.controls[control] = {
            frequency = 4,
            size = 0,
            richness = 0,
          }
        end
      end
    end

  end
end

function Universe.get_zone_prototype(name)
  return UniverseRaw.prototypes_by_name[name] or {}
end

function Universe.build ()
  log("Building Universe.")
  Universe.load_resource_data() -- loads to global

  global.rng = game.create_random_generator()
  -- Creates a deterministic standalone random generator with the given seed or if a seed is not provided the initial map seed is used.
  -- rng()
    -- If no parameters are given a number in the [0, 1) range is returned.
    -- If a single parameter is given a floored number in the [0, N] range is returned.
    -- If 2 parameters are given a floored number in the [N1, N2] range is returned.

  ------------------------------------------------------------------------------
  -- structure variables

  local protouniverse = table.deepcopy(UniverseRaw.universe)
  local unassigned_planets = table.deepcopy(UniverseRaw.unassigned_planets)
  local unassigned_moons = table.deepcopy(UniverseRaw.unassigned_moons)
  local unassigned_planets_or_moons = table.deepcopy(UniverseRaw.unassigned_planets_or_moons)

  local n_stars = #protouniverse.stars
  local npm_names = #unassigned_planets + #unassigned_moons + #unassigned_planets_or_moons

  local average_planets_per_star = npm_names / (Universe.average_moons_per_planet + 1) / n_stars

  local requested_planets = global.rng(math.floor(average_planets_per_star * 0.9 * n_stars), math.ceil(average_planets_per_star * 1.1 * n_stars))
  local requested_moons = #unassigned_moons + #unassigned_planets_or_moons - requested_planets

  local min_planets_per_star = math.max(2, math.floor(average_planets_per_star / 2))
  local high_planets_per_star = average_planets_per_star * 1.5 -- less likely to be above this
  local high_moons_per_planet = Universe.average_moons_per_planet * 1.5 -- less likely to be above this

  ------------------------------------------------------------------------------
  -- build srtucture

  local all_planets = {}
  table.insert(all_planets, protouniverse.stars[1].children[1]) -- nauvis

  local all_moons = {}

  Universe.shuffle(protouniverse.stars)
  Universe.shuffle(unassigned_planets)
  Universe.shuffle(unassigned_moons)
  Universe.shuffle(unassigned_planets_or_moons)

  for _, star in pairs(protouniverse.stars) do
    star.children = star.children or {}
  end

  -- add the unassigned planets to random stars
  for _, proto_planet in pairs(unassigned_planets) do
    local planet = {name = proto_planet.name}
    table.insert(protouniverse.stars[global.rng(1, #protouniverse.stars)].children, planet)
    table.insert(all_planets, planet)
  end
  unassigned_planets = {}

  -- fill minimum of # planets per star
  for _, star in pairs(protouniverse.stars) do
    while #star.children < min_planets_per_star and #unassigned_planets_or_moons > 0 do
      local proto_planet = unassigned_planets_or_moons[#unassigned_planets_or_moons]
      unassigned_planets_or_moons[#unassigned_planets_or_moons] = nil
      local planet = {name = proto_planet.name}
      table.insert(star.children, planet)
      table.insert(all_planets, planet)
    end
  end

  -- build remaining planets
  while #all_planets < requested_planets and #unassigned_planets_or_moons > 0 do
    local star = protouniverse.stars[global.rng(1, #protouniverse.stars)]
    if #star.children < high_planets_per_star or global.rng() < 0.25 then -- 25% to ignore limit
      local proto_planet = unassigned_planets_or_moons[#unassigned_planets_or_moons]
      unassigned_planets_or_moons[#unassigned_planets_or_moons] = nil
      local planet = {name = proto_planet.name}
      table.insert(star.children, planet)
      table.insert(all_planets, planet)
    end
  end

  -- add the unassigned moons to random planets
  for _, proto_moon in pairs(unassigned_moons) do
    local planet = all_planets[global.rng(1, #all_planets)]
    planet.children = planet.children or {}
    local moon = {name = proto_moon.name}
    table.insert(planet.children, moon)
    table.insert(all_moons, moon)
  end
  unassigned_moons = {}

  -- min 1 moon per planet
  for _, planet in pairs(all_planets) do
    planet.children = planet.children or {}
    if #planet.children < high_moons_per_planet then
      local proto_moon = unassigned_planets_or_moons[#unassigned_planets_or_moons]
      unassigned_planets_or_moons[#unassigned_planets_or_moons] = nil
      local moon = {name = proto_moon.name}
      table.insert(planet.children, moon)
      table.insert(all_moons, moon)
    end
  end

  -- build remaining moons
  while #all_moons < requested_moons and #unassigned_planets_or_moons > 0 do
    local planet = all_planets[global.rng(1, #all_planets)]
    planet.children = planet.children or {}
    if #planet.children < high_moons_per_planet or global.rng() < 0.25 then -- 25% to ignore limit
      local proto_moon = unassigned_planets_or_moons[#unassigned_planets_or_moons]
      unassigned_planets_or_moons[#unassigned_planets_or_moons] = nil
      local moon = {name = proto_moon.name}
      table.insert(planet.children, moon)
      table.insert(all_moons, moon)
    end
  end

  -- position the stars
  local outer_bounds = math.sqrt(#protouniverse.stars + #protouniverse.space_zones) * 50

  local function random_stellar_position(zone, distance_multiplier)
    distance_multiplier = distance_multiplier or 1
    zone.stellar_position = {
      x = (global.rng() - 0.5) * outer_bounds * distance_multiplier,
      y = (global.rng() - 0.5) * outer_bounds * distance_multiplier
    }
  end

  local zone_index = {}
  local zones_by_name = {}

  table.insert(zone_index, protouniverse.anomaly)
  protouniverse.anomaly.index = #zone_index
  zones_by_name[protouniverse.anomaly.name] = protouniverse.anomaly

  -- stellar cluster seeded, now shuffle and build:
  for s, star in pairs(protouniverse.stars) do

    star.type = "star"
    if star.name == "Calidus" then
      random_stellar_position(star, 0.1)
    else
      random_stellar_position(star)
    end
    star.orbit = {
      type = "orbit",
      name = star.name .. " Orbit",
      parent = star
    }

    table.insert(zone_index, star)
    star.index = #zone_index
    zones_by_name[star.name] = star

    table.insert(zone_index, star.orbit)
    star.orbit.index = #zone_index
    zones_by_name[star.orbit.name] = star.orbit

    -- Insert asteroid belts
    local add_asteroid_belts = global.rng(1, Universe.max_asteroid_belts)
    star.star_gravity_well = 10 + #star.children + add_asteroid_belts

    Universe.shuffle(star.children)

    for i = 1, add_asteroid_belts do
      table.insert(star.children, math.floor(0.4 + global.rng() + #star.children * i / add_asteroid_belts),
      {
        type = "asteroid-belt",
        name = star.name .. " Asteroid Belt " .. i -- Warning, must be updated after shuffle
      })
    end

    for p, planet in pairs(star.children) do -- make Nauvis the first planet
      if planet.name == "Nauvis" and p > 1 then -- swap positions
        local was_index = p
        local other = star.children[1]
        star.children[1] = planet
        star.children[was_index] = other
      end
    end

    local asteroid_belts = 0
    for p, planet in pairs(star.children) do
      planet.star_gravity_well = star.star_gravity_well * (0.1 + 0.5 * (#star.children - p) / #star.children)

      table.insert(zone_index, planet)
      planet.index = #zone_index
      zones_by_name[planet.name] = planet

      if planet.type == "asteroid-belt" then
        asteroid_belts = asteroid_belts + 1
        planet.name = star.name .. " Asteroid Belt " .. asteroid_belts
        planet.parent = star
      else
        local planet_prototype = Universe.get_zone_prototype(planet.name)
        planet.children = planet.children or {}
        planet.type = "planet"
        planet.radius_multiplier = 0.4 + 0.6 * math.pow(global.rng(), 2) -- need to consistently call rng even if prototype.radius_multiplier is defined
        if planet_prototype and planet_prototype.radius_multiplier then
          planet.radius_multiplier = planet_prototype.radius_multiplier
        end
        planet.radius = Universe.planet_max_radius * planet.radius_multiplier
        planet.planet_gravity_well = 10 * (1 + planet.radius_multiplier) + #planet.children -- 12-20 + n_children = 13 to 26
        planet.climate = planet.climate or {}
        planet.parent = star
        planet.orbit = {
          type = "orbit",
          name = planet.name .. " Orbit",
          parent = planet
        }

        table.insert(zone_index, planet.orbit)
        planet.orbit.index = #zone_index
        zones_by_name[planet.orbit.name] = planet.orbit

        Universe.shuffle(planet.children)
        for m, moon in pairs(planet.children) do
          local moon_prototype = Universe.get_zone_prototype(moon.name)
          moon.type = "moon"
          moon.star_gravity_well = planet.star_gravity_well
          moon.planet_gravity_well = planet.planet_gravity_well * (0.1 + 0.5 * (#planet.children - m) / #planet.children)
          moon.radius_multiplier = 0.2 + 0.8 * math.pow(global.rng(), 2)
          if moon_prototype and moon_prototype.radius_multiplier then
            moon.radius_multiplier = moon_prototype.radius_multiplier
          end
          moon.radius = planet.radius / 2 * moon.radius_multiplier
          moon.climate = moon.climate or {}
          moon.parent = planet
          moon.orbit = {
            type = "orbit",
            name = moon.name .. " Orbit",
            parent = moon
          }

          table.insert(zone_index, moon)
          moon.index = #zone_index
          zones_by_name[moon.name] = moon

          table.insert(zone_index, moon.orbit)
          moon.orbit.index = #zone_index
          zones_by_name[moon.orbit.name] = moon.orbit
        end
      end
    end
  end

  Universe.shuffle(protouniverse.space_zones)
  for z, zone in pairs(protouniverse.space_zones) do
    zone.type = zone.type or "asteroid-field"
    table.insert(zone_index, zone)
    zone.index = #zone_index
    zones_by_name[zone.name] = zone
    random_stellar_position(zone)
  end

  ------------------------------------------------------------------------------
  -- start resource assignment

  for _, zone in pairs(zone_index) do
    zone.seed = global.rng(4294967295)
    -- Universe.inflate_controls(zone) -- delayed until surface creation
  end

  --log("Compiled universe Data: " .. serpent.block( protouniverse, {comment = false, numformat = '%1.8g' } ))

  if protouniverse then
    global.universe = protouniverse
    global.zone_index = zone_index
    global.zones_by_name = zones_by_name
    global.zones_by_surface = {}
  end

  log("Building Universe complete.")
end



return Universe
