local Zone = {}

-- constants
Zone.discovery_scan_radius = 32
Zone.clear_enemies_radius = 512

Zone.travel_cost_interstellar = 400 -- stellar position distance, roughly 50 distance between stars, can be up to 300 apart
Zone.travel_cost_star_gravity = 500 -- roughly 10-20 base for a star
Zone.travel_cost_planet_gravity = 100 -- roughly 10-20 base for a planet
Zone.travel_cost_space_distortion = Zone.travel_cost_interstellar * 25 -- based on 0-1 range

-- based on alien biomes, unsure as to how ti make this more dynamic
-- biome name = {tilenames}
Zone.biome_tiles = {
  ["out-of-map"] = {"out-of-map"}, -- always allowed
  ["water"] = {"water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud"},

  ["dirt-purple"] = {"mineral-purple-dirt-1", "mineral-purple-dirt-2", "mineral-purple-dirt-3", "mineral-purple-dirt-4", "mineral-purple-dirt-5", "mineral-purple-dirt-6"},
  ["dirt-violet"] = {"mineral-violet-dirt-1", "mineral-violet-dirt-2", "mineral-violet-dirt-3", "mineral-violet-dirt-4", "mineral-violet-dirt-5", "mineral-violet-dirt-6"},
  ["dirt-red"] = {"mineral-red-dirt-1", "mineral-red-dirt-2", "mineral-red-dirt-3", "mineral-red-dirt-4", "mineral-red-dirt-5", "mineral-red-dirt-6"},
  ["dirt-brown"] = {"mineral-brown-dirt-1", "mineral-brown-dirt-2", "mineral-brown-dirt-3", "mineral-brown-dirt-4", "mineral-brown-dirt-5", "mineral-brown-dirt-6"},
  ["dirt-tan"] = {"mineral-tan-dirt-1", "mineral-tan-dirt-2", "mineral-tan-dirt-3", "mineral-tan-dirt-4", "mineral-tan-dirt-5", "mineral-tan-dirt-6"},
  ["dirt-aubergine"] = {"mineral-aubergine-dirt-1", "mineral-aubergine-dirt-2", "mineral-aubergine-dirt-3", "mineral-aubergine-dirt-4", "mineral-aubergine-dirt-5", "mineral-aubergine-dirt-6"},
  ["dirt-dustyrose"] = {"mineral-dustyrose-dirt-1", "mineral-dustyrose-dirt-2", "mineral-dustyrose-dirt-3", "mineral-dustyrose-dirt-4", "mineral-dustyrose-dirt-5", "mineral-dustyrose-dirt-6"},
  ["dirt-beige"] = {"mineral-beige-dirt-1", "mineral-beige-dirt-2", "mineral-beige-dirt-3", "mineral-beige-dirt-4", "mineral-beige-dirt-5", "mineral-beige-dirt-6"},
  ["dirt-cream"] = {"mineral-cream-dirt-1", "mineral-cream-dirt-2", "mineral-cream-dirt-3", "mineral-cream-dirt-4", "mineral-cream-dirt-5", "mineral-cream-dirt-6"},
  ["dirt-black"] = {"mineral-black-dirt-1", "mineral-black-dirt-2", "mineral-black-dirt-3", "mineral-black-dirt-4", "mineral-black-dirt-5", "mineral-black-dirt-6"},
  ["dirt-grey"] = {"mineral-grey-dirt-1", "mineral-grey-dirt-2", "mineral-grey-dirt-3", "mineral-grey-dirt-4", "mineral-grey-dirt-5", "mineral-grey-dirt-6"},
  ["dirt-white"] = {"mineral-white-dirt-1", "mineral-white-dirt-2", "mineral-white-dirt-3", "mineral-white-dirt-4", "mineral-white-dirt-5", "mineral-white-dirt-6"},

  ["sand-purple"] = {"mineral-purple-sand-1", "mineral-purple-sand-2", "mineral-purple-sand-3"},
  ["sand-violet"] = {"mineral-violet-sand-1", "mineral-violet-sand-2", "mineral-violet-sand-3"},
  ["sand-red"] = {"mineral-red-sand-1", "mineral-red-sand-2", "mineral-red-sand-3"},
  ["sand-brown"] = {"mineral-brown-sand-1", "mineral-brown-sand-2", "mineral-brown-sand-3"},
  ["sand-tan"] = {"mineral-tan-sand-1", "mineral-tan-sand-2", "mineral-tan-sand-3"},
  ["sand-aubergine"] = {"mineral-aubergine-sand-1", "mineral-aubergine-sand-2", "mineral-aubergine-sand-3"},
  ["sand-dustyrose"] = {"mineral-dustyrose-sand-1", "mineral-dustyrose-sand-2", "mineral-dustyrose-sand-3"},
  ["sand-beige"] = {"mineral-beige-sand-1", "mineral-beige-sand-2", "mineral-beige-sand-3"},
  ["sand-cream"] = {"mineral-cream-sand-1", "mineral-cream-sand-2", "mineral-cream-sand-3"},
  ["sand-black"] = {"mineral-black-sand-1", "mineral-black-sand-2", "mineral-black-sand-3"},
  ["sand-grey"] = {"mineral-grey-sand-1", "mineral-grey-sand-2", "mineral-grey-sand-3"},
  ["sand-white"] = {"mineral-white-sand-1", "mineral-white-sand-2", "mineral-white-sand-3"},

  ["vegetation-green"] = {"vegetation-green-grass-1", "vegetation-green-grass-2", "vegetation-green-grass-3", "vegetation-green-grass-4"},
  ["vegetation-olive"] = {"vegetation-olive-grass-1", "vegetation-olive-grass-2"},
  ["vegetation-yellow"] = {"vegetation-yellow-grass-1", "vegetation-yellow-grass-2"},
  ["vegetation-orange"] = {"vegetation-orange-grass-1", "vegetation-orange-grass-2"},
  ["vegetation-red"] = {"vegetation-red-grass-1", "vegetation-red-grass-2"},
  ["vegetation-violet"] = {"vegetation-violet-grass-1", "vegetation-violet-grass-2"},
  ["vegetation-purple"] = {"vegetation-purple-grass-1", "vegetation-purple-grass-2"},
  ["vegetation-mauve"] = {"vegetation-mauve-grass-1", "vegetation-mauve-grass-2"},
  ["vegetation-blue"] = {"vegetation-blue-grass-1", "vegetation-blue-grass-2"},
  ["vegetation-turquoise"] = {"vegetation-turquoise-grass-1", "vegetation-turquoise-grass-2"},

  ["volcanic-orange"] = {"volcanic-orange-heat-1", "volcanic-orange-heat-2", "volcanic-orange-heat-3", "volcanic-orange-heat-4"},
  ["volcanic-green"] = {"volcanic-green-heat-1", "volcanic-green-heat-2", "volcanic-green-heat-3", "volcanic-green-heat-4"},
  ["volcanic-blue"] = {"volcanic-blue-heat-1", "volcanic-blue-heat-2", "volcanic-blue-heat-3", "volcanic-blue-heat-4"},
  ["volcanic-purple"] = {"volcanic-purple-heat-1", "volcanic-purple-heat-2", "volcanic-purple-heat-3", "volcanic-purple-heat-4"},

  ["frozen-snow"] = {"frozen-snow-0", "frozen-snow-1", "frozen-snow-2", "frozen-snow-3", "frozen-snow-4"},
  ["frozen-ice"] = {"frozen-snow-5", "frozen-snow-6", "frozen-snow-7", "frozen-snow-8", "frozen-snow-9"},
}
Zone.biome_collections = {
  ["all-sand"] = {"sand-purple", "sand-violet", "sand-red", "sand-brown", "sand-tan", "sand-aubergine", "sand-dustyrose", "sand-beige", "sand-cream", "sand-black", "sand-grey", "sand-white"},
  ["all-dirt"] = {"dirt-purple", "dirt-violet", "dirt-red", "dirt-brown", "dirt-tan", "dirt-aubergine", "dirt-dustyrose", "dirt-beige", "dirt-cream", "dirt-black", "dirt-grey", "dirt-white"},
  ["all-vegetation"] = {"vegetation-green", "vegetation-olive", "vegetation-yellow", "vegetation-orange", "vegetation-red",
                        "vegetation-violet", "vegetation-purple", "vegetation-mauve", "vegetation-blue", "vegetation-turquoise" },
  ["all-volcanic"] = {"volcanic-orange", "volcanic-green", "volcanic-blue", "volcanic-purple"},
  ["all-frozen"] = {"frozen-snow", "frozen-ice"},
}

--[[ eg:
biome_replacements = {
  {replace={"all-dirt", "all-sand", "all-volcanic"}, with="sand-red"},
  {replace={"all-vegetation", "all-frozen"}, with="vegetation-red"}
} ]]--

function Zone.get_default()
  return Zone.from_name("Nauvis")
end

function Zone.type_title(zone)
  if zone.type == "planet" then
    return "Planet"
  elseif zone.type == "moon" then
    return "Moon"
  elseif zone.type == "star" then
    return "Star"
  elseif zone.type == "asteroid-field" then
    return "Asteroid Field"
  elseif zone.type == "asteroid-belt" then
    return "Asteroid Belt"
  elseif zone.type == "anomaly" then
    return "Anomaly"
  elseif zone.type == "spaceship" then
    return "Spaceship"
  elseif zone.type == "orbit" then
    return (Zone.type_title(zone.parent) .. " Orbit")
  end
end

function Zone.get_icon(zone)
  -- used for rich text
  if zone.type == "orbit" and zone.parent.type == "star" then
    return "virtual-signal/" .. mod_prefix.."star"
  elseif zone.type == "orbit" and zone.parent.type == "planet" then
    return "virtual-signal/" .. mod_prefix.."planet-orbit"
  elseif zone.type == "orbit" and zone.parent.type == "moon" then
    return "virtual-signal/" .. mod_prefix.."moon-orbit"
  else
    return "virtual-signal/" .. mod_prefix..zone.type
  end
end

function Zone.is_solid(zone)
  return zone.type == "planet" or zone.type == "moon"
end

function Zone.is_space(zone)
  return not Zone.is_solid(zone)
end

function Zone.from_zone_index(zone_index)
  return global.zone_index[zone_index]
end

function Zone.from_name(name)
    return global.zones_by_name[name]
end

function Zone.from_surface_index(surface_index)
  return global.zones_by_surface[surface_index]
end

function Zone.from_surface(surface)
  local from_index = Zone.from_surface_index(surface.index)
  if from_index then return from_index end
  -- maybe a spaceship
  return Spaceship.from_own_surface_index(surface.index)
end

function Zone.get_stellar_position(zone)
  if not zone then return nil end
  if zone.type == "anomaly" then return {x = 0, y = 0} end
  -- everything else should have a stellar position
  return zone.stellar_position or Zone.get_stellar_position(zone.parent)
end

function Zone.get_star_gravity_well(zone)
  if zone.type == "orbit" then
      return Zone.get_star_gravity_well(zone.parent)
  end
  return zone.star_gravity_well or 0
end

function Zone.get_planet_gravity_well(zone)
  if zone.type == "orbit" then
    if zone.parent.type == "planet" then
      return Zone.get_planet_gravity_well(zone.parent) - 1
    else
      return Zone.get_planet_gravity_well(zone.parent) - 0.5
    end
  end
  return zone.planet_gravity_well or 0
end

function Zone.get_space_distortion(zone) -- anomaly
  if zone.space_distortion then
    return zone.space_distortion
  end
  return zone.type == "anomaly" and 1 or 0
end

function Zone.apply_markers(zone)
  for force_name, force_data in pairs(global.forces) do
    if force_data.zones_discovered[zone.name] then
      if not force_data.zones_discovered[zone.name].marker and force_data.zones_discovered[zone.name].marker.valid then
        local surface = Zone.get_surface(zone)
        if surface then
          force_data.zones_discovered[zone.name].marker = force.add_chart_tag(surface, {
            icon = {type = "virtual", name = mod_prefix .. (zone.type == "orbit" and zone.parent.type or zone.type)},
            position = tag.position,
            text = zone.name
          })
        end
      end
    end
  end
end

function Zone.create_surface(zone)

    if not zone.surface_index then

      Universe.inflate_controls(zone, false)

      -- TODO planets should have customised controls
      -- expect 15 is the max, 10 + 5 planets but reduced start position
      local light_percent = math.min(1, 0.1 + Zone.get_star_gravity_well(zone)/7.5)

      local map_gen_settings = table.deepcopy(game.default_map_gen_settings)

      map_gen_settings.seed = zone.seed or math.random(4294967295)
      local autoplace_controls = map_gen_settings.autoplace_controls
      zone.controls = zone.controls or {}

      local frequency_multiplier = 1 -- increase for small planets and moons
      if zone.radius then
        frequency_multiplier = 10000 / zone.radius
      end

      for control_name, control_prototype in pairs(game.autoplace_control_prototypes) do
        if control_name ~= "planet-size" and game.autoplace_control_prototypes[control_name] then

          zone.controls[control_name] = zone.controls[control_name] or {}

          if zone.controls[control_name] or control_name ~= "enemy-base" then  -- only modify enemy spawning if specified
            -- TODO: use a generic universe function
            zone.controls[control_name].frequency = (zone.controls[control_name].frequency or (0.17 + math.random() * math.random() * 2)) * frequency_multiplier
            zone.controls[control_name].size = zone.controls[control_name].size or (0.1 + math.random() * 0.8)
            zone.controls[control_name].richness = zone.controls[control_name].richness or (0.1 + math.random() * 0.8)

            autoplace_controls[control_name] = table.deepcopy(zone.controls[control_name])
          end
        end
      end

      zone.controls.moisture = zone.controls.moisture or {}
      zone.controls.moisture.frequency = (zone.controls.moisture.frequency or (0.17 + math.random() * math.random() * 2)) * frequency_multiplier
      zone.controls.moisture.bias = zone.controls.moisture.bias or (math.random() - 0.5)

      zone.controls.aux = zone.controls.aux or {}
      zone.controls.aux.frequency = (zone.controls.aux.frequency or (0.17 + math.random() * math.random() * 2)) * frequency_multiplier
      zone.controls.aux.bias = zone.controls.aux.bias or (math.random() - 0.5)

      map_gen_settings.property_expression_names = {
        ["control-setting:moisture:frequency:multiplier"] = zone.controls.moisture.frequency,
        ["control-setting:moisture:bias"] = zone.controls.moisture.bias,
        ["control-setting:aux:frequency:multiplier"] = zone.controls.aux.frequency,
        ["control-setting:aux:bias"] = zone.controls.aux.bias,
      }
      zone.controls.water = zone.controls.water or {}
      zone.controls.water.size = zone.controls.water.size or 0.01 -- high is 6, low is 0
      zone.controls.water.frequency = (zone.controls.water.frequency or 1) * frequency_multiplier -- low is 0.17
      zone.controls.water.frequency = 0.5 + zone.controls.water.frequency / 2
      map_gen_settings.water = zone.controls.water.size
      map_gen_settings.terrain_segmentation = zone.controls.water.frequency

      autoplace_controls["planet-size"] = { frequency = 1, size = 1 } -- default
      -- planet_radius = 10000 / 6 * (6 + log(1/planet_frequency/6, 2))
      -- planet_frequency = 1 / 6 / 2 ^ (planet_radius * 6 / 10000 - 6)
      local planet_size_frequency = 1/6 -- 10000 radius planet
      if Zone.is_solid(zone) then
        -- planet or moon
        --planet_size_frequency = 1 / (zone.radius / 10000)
        planet_size_frequency = 1 / 6 / 2 ^ (zone.radius * 6 / 10000 - 6)
      else
        if zone.type == "orbit" then
          autoplace_controls["planet-size"].size = zone.parent.radius and (zone.parent.radius / 200) or 50
        elseif zone.type == "asteroid-belt" then
          autoplace_controls["planet-size"].size = 200
        elseif zone.type == "asteroid-field" then
          autoplace_controls["planet-size"].size = 10000
        end

        planet_size_frequency = 1/1000
        map_gen_settings.cliff_settings={
    			name="cliff",
    			cliff_elevation_0=0,
    			cliff_elevation_interval=400,
    			richness=0
    		}
        map_gen_settings.property_expression_names = {
          ["control-setting:moisture:frequency:multiplier"] = 10,
          ["control-setting:moisture:bias"] = -1,
          ["control-setting:aux:frequency:multiplier"] = 0,
          ["control-setting:aux:bias"] = 0,
        }
      end
      autoplace_controls["planet-size"].frequency = planet_size_frequency
      Log.debug_log("Creating surface " .. zone.name .. " with map_gen_settings:")
      Log.debug_log(util.table_to_string(map_gen_settings))
      if Zone.is_space(zone) then
        -- Speed up terrain generation by excluding everything not specifically allowed to spawn
        --map_gen_settings.default_enable_all_autoplace_controls = false
        map_gen_settings.autoplace_settings={
          ["decorative"]={
            treat_missing_as_default=false,
            settings={
              ["se-crater3-huge"] ={},
              ["se-crater1-large-rare"] ={},
              ["se-crater1-large"] ={},
              ["se-crater2-medium"] ={},
              ["se-crater4-small"] ={},
              ["se-sand-decal-space"] ={},
              ["se-stone-decal-space"] ={},
              ["se-rock-medium-asteroid"] ={},
              ["se-rock-small-asteroid"] ={},
              ["se-rock-tiny-asteroid"] ={},
              ["se-sand-rock-medium-asteroid"] ={},
              ["se-sand-rock-small-asteroid"] ={}
            }
          },
          --[[["entity"]={
            treat_missing_as_default=false,
            settings={
              ["se-rock-huge-asteroid"] ={},
              ["se-rock-big-asteroid"] ={},
              ["se-sand-rock-big-asteroid"] ={},
              ["se-rock-huge-space"] ={},
              ["se-rock-big-space"] ={},
            }
          },]]--
          ["tile"]={
            treat_missing_as_default=false,
            settings={
              ["se-asteroid"]={},
              ["se-space"]={}
            }
          },
        }
      else
        -- speed up terrain generation by specifying specific things not to spawn
        local penalty = -100000
        map_gen_settings.property_expression_names["decorative:se-crater3-huge:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-crater1-large-rare:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-crater1-large:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-crater2-medium:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-crater4-small:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-sand-decal-space:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-stone-decal-space:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-rock-medium-asteroid:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-rock-small-asteroid:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-rock-tiny-asteroid:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-sand-rock-medium-asteroid:probability"] = penalty
        map_gen_settings.property_expression_names["decorative:se-sand-rock-small-asteroid:probability"] = penalty

        map_gen_settings.property_expression_names["entity:se-rock-huge-asteroid:probability"] = penalty
        map_gen_settings.property_expression_names["entity:se-rock-big-asteroid:probability"] = penalty
        map_gen_settings.property_expression_names["entity:se-sand-rock-big-asteroid:probability"] = penalty
        map_gen_settings.property_expression_names["entity:se-rock-huge-space:probability"] = penalty
        map_gen_settings.property_expression_names["entity:se-rock-big-space:probability"] = penalty

        map_gen_settings.property_expression_names["tile:se-asteroid:probability"] = penalty
        map_gen_settings.property_expression_names["tile:se-space:probability"] = penalty
      end

      local surface
      if not game.surfaces[zone.name] then
        surface = game.create_surface(zone.name, map_gen_settings)
        surface.force_generate_chunk_requests()

      else
        -- this happens if the mod was uninstalled and reinstalled. The surface will be invalid and unfaxable.
        -- game.delete_surface(zone.name) -- does not work in time to re make the surface
        surface = game.surfaces[zone.name]
        surface.clear(false)

      end


      zone.surface_index = surface.index
      global.zones_by_surface = global.zones_by_surface or {}
      global.zones_by_surface[surface.index] = zone

      if Zone.is_space(zone) then
        surface.freeze_daytime = true;
        --surface.daytime = 0.45 - 0.2 * light_percent
        surface.daytime = 0.45 - 0.1 * light_percent -- roughly half so thjat lights activate
        if light_percent > 0.5 then
          surface.min_brightness = 0.5
        end
        if(zone.type == "orbit" and zone.parent and zone.parent.type == "star") then
          surface.daytime = 0 -- that's why we're here
        end
        surface.solar_power_multiplier = 1 + light_percent * 9
      else
        surface.solar_power_multiplier = light_percent
      end

      if zone.ticks_per_day then
        surface.ticks_per_day = zone.ticks_per_day
      end

    end
end

function Zone.get_surface(zone) -- returns surface but does not build
  if zone.type == "spaceship" then
    return Spaceship.get_current_surface(zone)
  end
  if zone.surface_index then
    return game.get_surface(zone.surface_index)
  end
  return nil
end

function Zone.get_make_surface(zone)
  if zone.type == "spaceship" then
    return Spaceship.get_current_surface(zone)
  end
  if not zone.surface_index then Zone.create_surface(zone) end
  return game.get_surface(zone.surface_index)
end

function Zone.discover(force_name, zone, source) -- source could be "Satellite "
  global.forces[force_name] = global.forces[force_name] or {}
  global.forces[force_name].zones_discovered = global.forces[force_name].zones_discovered or {}
  global.forces[force_name].zones_discovered_count = global.forces[force_name].zones_discovered_count or 0

  if not global.forces[force_name].zones_discovered[zone.index] then

      Universe.inflate_controls(zone, false)

      global.forces[force_name].zones_discovered[zone.index] = {
        discovered_at = game.tick,
        marker = nil
      }
      global.forces[force_name].zones_discovered_count = global.forces[force_name].zones_discovered_count + 1

      local message = nil
      if source then
        message = {"space-exploration.source-discovered-zone", source, Zone.type_title(zone), Zone.get_icon(zone), zone.name}
        --game.forces[force_name].print(source .. " discovered a new " .. Zone.type_title(zone) .. ": " .. zone.name)
      else
        message = {"space-exploration.discovered-zone", source, Zone.type_title(zone), Zone.get_icon(zone), zone.name}
        --game.forces[force_name].print("Discovered a new " .. Zone.type_title(zone) .. ": " .. zone.name)
      end
      local tick_task = new_tick_task("force-message")
      tick_task.force_name = force_name
      tick_task.message = message

      Zone.apply_markers(zone) -- in case the surface exists

      -- update remote-view guis
      for _, player in pairs(game.connected_players) do
        if player.gui.left[RemoteView.name_gui_root] then
          RemoteView.gui_open(player)
        end
      end

      return true

  end
  return false
end

function Zone.discover_next(force_name, source)
  global.forces[force_name] = global.forces[force_name] or {}
  global.forces[force_name].zones_discovered = global.forces[force_name].zones_discovered or {}
  global.forces[force_name].zones_discovered_count = global.forces[force_name].zones_discovered_count or 0

  local nauvis_zone = Zone.from_name("Nauvis")

  -- Nauvis Moons
  if global.forces[force_name].zones_discovered_count < 3 or math.random() < 0.5 then
    for _, moon in pairs(nauvis_zone.children) do
      if not global.forces[force_name].zones_discovered[moon.index] then
        if math.random() < 0.5 then -- skip it
            return Zone.discover(force_name, moon, source)
        end
      end
    end
  end

  -- Calidus planets & moons
  for _, planet in pairs(nauvis_zone.parent.children) do
    if math.random() < 0.5 then -- skip it
      if not global.forces[force_name].zones_discovered[planet.index] then
          return Zone.discover(force_name, planet, source)
      elseif planet.children then
        for _, moon in pairs(planet.children) do
          if not global.forces[force_name].zones_discovered[moon.index] then
            if math.random() < 0.5 then -- skip it
                return Zone.discover(force_name, moon, source)
            end
          end
        end
      end
    end
  end

  if global.forces[force_name].zones_discovered_count >= 99 then
    -- should have discovered multiple stars at this point
    if not global.forces[force_name].zones_discovered[global.universe.anomaly.index] then
      return Zone.discover(force_name, global.universe.anomaly, source)
    end
  end

  -- random next thing
  local can_discover = {}

  -- star and deep space discovery should be bias to nearer positions
  local closest_1 = nil
  local closest_stellar_distance = 1000000
  local nauvis_stellar_position = Zone.get_stellar_position(nauvis_zone)

  for _, star in pairs(global.universe.stars) do
    if not global.forces[force_name].zones_discovered[star.index] then
      local pos2 = Zone.get_stellar_position(star)
      local distance = util.vectors_delta_length(nauvis_stellar_position, pos2)
      if distance < closest_stellar_distance then
        closest_stellar_distance = distance
        closest_1 = star
      end
    end
  end

  for _, zone in pairs(global.universe.space_zones) do
    if not global.forces[force_name].zones_discovered[zone.index] then
      local pos2 = Zone.get_stellar_position(zone)
      local distance = util.vectors_delta_length(nauvis_stellar_position, pos2)
      if closest_1 == nil or distance < closest_stellar_distance then
        closest_stellar_distance = distance
        closest_1 = zone
      end
    end
  end

  if closest_1 then
    -- x10
    table.insert(can_discover, closest_1)
    table.insert(can_discover, closest_1)
    table.insert(can_discover, closest_1)
    table.insert(can_discover, closest_1)
    table.insert(can_discover, closest_1)
    table.insert(can_discover, closest_1)
    table.insert(can_discover, closest_1)
    table.insert(can_discover, closest_1)
    table.insert(can_discover, closest_1)
    table.insert(can_discover, closest_1)
  end

  for _, star in pairs(global.universe.stars) do
    if global.forces[force_name].zones_discovered[star.index] then
      for _, planet in pairs(star.children) do
        if not global.forces[force_name].zones_discovered[planet.index] then
          table.insert(can_discover, planet)
          if planet.type == "planet" then
            --x5 bias towards planets
            table.insert(can_discover, planet)
            table.insert(can_discover, planet)
            table.insert(can_discover, planet)
            table.insert(can_discover, planet)
          end
        else
          if planet.children then
            for _, moon in pairs(planet.children) do
              if not global.forces[force_name].zones_discovered[moon.index] then
                table.insert(can_discover, moon)
              end
            end
          end
        end
      end
    end
  end

  local space_zones = 0
  for _, zone in pairs(global.universe.space_zones) do
    if not global.forces[force_name].zones_discovered[zone.index] then
      if space_zones < 5 then
        space_zones = space_zones + 1
        table.insert(can_discover, zone)
      end
    end
  end

  if #can_discover > 0 then
    return Zone.discover(force_name, Util.random_from_array(can_discover), source)
  end

end


function Zone.find_nearest_stellar_object(stellar_position)
  local closest_distance = math.huge
  local closest = nil

  for _, star in pairs(global.universe.space_zones) do
    local distance = util.vectors_delta_length(star.stellar_position, stellar_position)
    if distance < closest_distance then
      closest_distance = distance
      closest = star
    end
  end
  return closest
end

function Zone.find_nearest_star(stellar_position)
  local closest_distance = math.huge
  local closest = nil

  for _, star in pairs(global.universe.stars) do
    local distance = util.vectors_delta_length(star.stellar_position, stellar_position)
    if distance < closest_distance then
      closest_distance = distance
      closest = star
    end
  end
  return closest
end


function Zone.find_nearest_zone(space_distortion, stellar_position, star_gravity_well, planet_gravity_well)

  if space_distortion > 0.4 then return global.universe.anomaly end -- default from the anomaly

  local star = Zone.find_nearest_stellar_object(stellar_position) -- can be asteroid field
  if star_gravity_well > 0 then
    local closest_zone = star
    local closest_distance =  math.abs((star.star_gravity_well or 0) - star_gravity_well)
    if closest_zone.type == "star" then
      for _, planet in pairs(star.children) do
        local distance = math.abs(planet.star_gravity_well - star_gravity_well)
        if distance < closest_distance then
          closest_distance = distance
          closest_zone = planet
        end
      end
    end

    if closest_zone.type == "planet" then
      local closest_zone2 = closest_zone
      closest_distance =  math.abs(closest_zone.planet_gravity_well - planet_gravity_well)
      for _, moon in pairs(closest_zone.children) do
        if moon.type == "moon" then
          local distance = math.abs(moon.planet_gravity_well - planet_gravity_well)
          if distance < closest_distance then
            closest_distance = distance
            closest_zone2 = moon
          end
        end
      end
      return closest_zone2
    end
    return closest_zone
  else
    if not star then return global.universe.anomaly end
    if not star.children then return star end
    local last_child = star.children[#star.children]
    if last_child.children then
      last_child = last_child.children[#last_child.children]
    end
    return last_child
  end
  return Zone.get_default()

end

function Zone.find_nearest_solid_zone(space_distortion, stellar_position, star_gravity_well, planet_gravity_well, allow_moon)
  if space_distortion == 1 then return Zone.get_default() end -- default from the anomaly

  if planet_gravity_well == 0 then -- if no moon
    planet_gravity_well = 100000 -- high to land on planet
  end

  if star_gravity_well == 0 then -- if no planet
    star_gravity_well = 100000 -- high to land on planet with high solar
  end

  local star = Zone.find_nearest_star(stellar_position)
  if not star then return Zone.get_default() end

  local closest_planet = nil
  local closest_distance = math.huge
  for _, planet in pairs(star.children) do
    if planet.type == "planet" then -- not an asteroid belt
      local distance = math.abs(planet.star_gravity_well - star_gravity_well)
      if distance < closest_distance then
        closest_distance = distance
        closest_planet = planet
      end
    end
  end

  if not closest_planet then return Zone.get_default() end

  local closest_body = closest_planet -- default to planet

  if allow_moon then
    closest_distance =  math.abs(closest_body.planet_gravity_well - planet_gravity_well)
    -- see if a moon is closer
    for _, moon in pairs(closest_planet.children) do
      if moon.type == "moon" then
        local distance = math.abs(moon.planet_gravity_well - planet_gravity_well)
        if distance < closest_distance then
          closest_distance = distance
          closest_body = moon
        end
      end
    end
  end

  return closest_body

end

function Zone.find_nearest_solid_zone_from_zone(zone)
  -- typically used for escape pod
  if Zone.is_solid(zone) then return nil end -- already there

  if zone.type == "orbit" and Zone.is_solid(zone.parent) then
    return zone.parent -- drop to planet / moon
  end

  return Zone.find_nearest_solid_zone(
    Zone.get_space_distortion(zone),
    Zone.get_stellar_position(zone),
    Zone.get_star_gravity_well(zone),
    Zone.get_planet_gravity_well(zone),
    true
  )
end

function Zone.get_force_assets(force_name, zone_index)
  if not global.forces[force_name] then
    if game.forces[force_name] then
      setup_force(game.forces[force_name])
    else
      return
    end
  end
  if not global.forces[force_name] then
    if game.forces[force_name] then
      game.forces[force_name].print("Error getting force data for invalid player force " .. force_name)
    else
      game.forces[force_name].print("Error getting force data for invalid force " .. force_name)
    end
    return -- invalid force
  end
  if not global.forces[force_name].zone_assets then
    global.forces[force_name].zone_assets = {}
  end
  if not global.forces[force_name].zone_assets[zone_index] then
    global.forces[force_name].zone_assets[zone_index] = {
      rocket_launch_pad_names = {},
      rocket_landing_pad_names = {},
    }
  end
  --Log.debug_log("Zone.get_force_assets: " .. util.table_to_string(global.forces[force_name].zone_assets[zone_index]))
  return global.forces[force_name].zone_assets[zone_index]
end

function Zone.get_travel_delta_v_sub(origin, destination)
  -- expected ranges:
    -- 1500 planetary system
    -- 15000 solar system
    -- 50000 interstellarsystem
    -- 50000 to/from anomaly
  if origin == destination then return 0 end

  local origin_space_distorion = Zone.get_space_distortion(origin)
  local origin_stellar_position = Zone.get_stellar_position(origin)
  local origin_star_gravity_well = Zone.get_star_gravity_well(origin)
  local origin_planet_gravity_well = Zone.get_planet_gravity_well(origin)

  local destination_space_distorion = Zone.get_space_distortion(destination)
  local destination_stellar_position = Zone.get_stellar_position(destination)
  local destination_star_gravity_well = Zone.get_star_gravity_well(destination)
  local destination_planet_gravity_well = Zone.get_planet_gravity_well(destination)

  if origin_space_distorion > 0 then
    return Zone.travel_cost_space_distortion
      + Zone.travel_cost_star_gravity * destination_star_gravity_well
      + Zone.travel_cost_planet_gravity * destination_planet_gravity_well
  elseif destination_space_distorion > 0 then
    return Zone.travel_cost_space_distortion
      + Zone.travel_cost_star_gravity * origin_star_gravity_well
      + Zone.travel_cost_planet_gravity * origin_planet_gravity_well
  end

  if origin_stellar_position.x == destination_stellar_position.x and origin_stellar_position.y == destination_stellar_position.y then
    -- same solar system
    if origin_star_gravity_well == destination_star_gravity_well then
      -- same planetary system
      return Zone.travel_cost_planet_gravity * math.abs(origin_planet_gravity_well - destination_planet_gravity_well) -- the planet_gravity_well difference
    else
      -- different planetary systems
      return Zone.travel_cost_star_gravity * math.abs(destination_star_gravity_well - origin_star_gravity_well) -- the star_gravity_well difference
        + Zone.travel_cost_planet_gravity * origin_planet_gravity_well
        + Zone.travel_cost_planet_gravity * destination_planet_gravity_well
    end
  else
    -- interstellar
    return Zone.travel_cost_interstellar * util.vectors_delta_length(origin_stellar_position, destination_stellar_position)
      + Zone.travel_cost_star_gravity * origin_star_gravity_well
      + Zone.travel_cost_planet_gravity * origin_planet_gravity_well
      + Zone.travel_cost_star_gravity * destination_star_gravity_well
      + Zone.travel_cost_planet_gravity * destination_planet_gravity_well
  end

end

function Zone.get_travel_delta_v(origin, destination)
  if origin and destination then
    if origin.type == "spaceship" or destination.type == "spaceship" then
      return Zone.get_travel_delta_v_sub(origin, destination)
    end
    global.cache_travel_delta_v = global.cache_travel_delta_v or {}
    global.cache_travel_delta_v[origin.index] = global.cache_travel_delta_v[origin.index] or {}
    if not global.cache_travel_delta_v[origin.index][destination.index] then
      global.cache_travel_delta_v[origin.index][destination.index] = Zone.get_travel_delta_v_sub(origin, destination)
    end
    return global.cache_travel_delta_v[origin.index][destination.index]
  end
end


function Zone.get_launch_delta_v(zone)
  -- 10000 to 800 for planets, 0 for in space
  return 500 + (zone.radius or 50)
end


function Zone.find_zone_landing_position(zone, try_position)
  Log.debug_log("Zone.find_zone_landing_position: " ..zone.name)
  local surface = Zone.get_make_surface(zone)

  if not try_position then
    if zone.type == "spaceship" then
      try_position = Spaceship.get_boarding_position(zone)
    elseif Zone.is_solid(zone) then
      local try_angle = math.random() * math.pi * 2 -- rad
      local try_distance = math.random() * (zone.radius / 4 or 512)
      try_position = {x = math.cos(try_angle) * try_distance, y = math.sin(try_angle) * try_distance}
    else
      try_position = {x = math.random(-512, 512), y = math.random(-128, 128)}
    end
  end
  surface.request_to_generate_chunks(try_position, 2)
  surface.force_generate_chunk_requests()
  local safe_position
  if Zone.is_solid(zone) then
    safe_position = surface.find_non_colliding_position(collision_rocket_destination_surface, try_position, 64, 1)
  else
    safe_position = surface.find_non_colliding_position(collision_rocket_destination_orbit, try_position, 64, 1)
  end
  if not safe_position then
    local try_position_2 = {x = 64 * (math.random() - 0.5), y = 64 * (math.random() - 0.5)}
    surface.request_to_generate_chunks(try_position_2, 2)
    surface.force_generate_chunk_requests()
    if Zone.is_solid(zone) then
      safe_position = surface.find_non_colliding_position(collision_rocket_destination_surface, try_position_2, 64, 1)
    else
      safe_position = surface.find_non_colliding_position(collision_rocket_destination_orbit, try_position_2, 64, 1)
    end
  end
  if safe_position then
    Log.debug_log("Zone.find_zone_landing_position: safe_position found")
    return safe_position
  else
    Log.debug_log("Zone.find_zone_landing_position: safe_position not found, falling back to try_position")
    return try_position
  end
end

function Zone.dropdown_name_from_zone(zone, no_indent)
  local i1 = "    "
  local i2 = "        "
  local i3 = "              "
  if no_indent then
    i1 = ""
    i2 = ""
    i3 = ""
  end
  if zone.type == "orbit" then
    if zone.parent.type == "star" then
      return "[img=virtual-signal/se-star] " .. zone.name -- star orbit
    elseif zone.parent.type == "planet" then
      return i2.."[img=virtual-signal/se-planet-orbit] " .. zone.name  -- planet orbit
    elseif zone.parent.type == "moon" then
      return i3.."[img=virtual-signal/se-moon-orbit] " .. zone.name -- moon orbit
    end
  elseif zone.type == "asteroid-belt" then
    return i1 .. "[img=virtual-signal/se-asteroid-belt] " .. zone.name
  elseif zone.type == "planet" then
    return i1 .. "[img=virtual-signal/se-planet] " ..  zone.name
  elseif zone.type == "moon" then
    return i2 .. "[img=virtual-signal/se-moon] " ..  zone.name
  elseif zone.type == "asteroid-field" then
    return "[img=virtual-signal/"..mod_prefix..zone.type .. "] " .. zone.name .. " [color=black](Asteroid Field)[/color]"
  elseif zone.type == "anomaly" then
    return "[img=virtual-signal/"..mod_prefix..zone.type .. "] " .. zone.name .. " [color=black](Anomaly)[/color]"
  elseif zone.type == "sapceship" then
    return "[img=virtual-signal/"..mod_prefix..zone.type .. "] " .. zone.name .. " [color=black](Spaceship)[/color]"
  end
  return "[img=virtual-signal/"..mod_prefix..zone.type .. "] " .. zone.name
end

function Zone.get_alphabetised()
  local zones_alphabetised = {}
  for _, zone in pairs(global.zone_index) do
    table.insert(zones_alphabetised, zone)
  end
  for _, spaceship in pairs(global.spaceships) do
    table.insert(zones_alphabetised, spaceship)
  end
  table.sort(zones_alphabetised, function(a,b) return a.name < b.name end)
  return zones_alphabetised
end

function Zone.dropdown_list_zone_destinations(force_name, current, alphabetical, filter, wildcard)
  -- wildcard = {list = "display", value={type = "any"}}
  local selected_index = 1
  local list = {""}
  local values = {{type = "nil", index = nil}} -- zone indexes
  local forcedata = global.forces[force_name]

  if wildcard then
    table.insert(list, wildcard.list)
    table.insert(values, wildcard.value)
  end

  function conditional_add_zone_to_list(forcedata, current, zone)
    if global.debug_view_all_zones
     or (zone.type == "spaceship" and forcedata.force_name == zone.force_name)
     or (zone.type ~= "spaceship" and (forcedata.zones_discovered[zone.index] or (zone.type == "orbit" and forcedata.zones_discovered[zone.parent.index]))) then
      if zone.type == "star" then
        table.insert(list, Zone.dropdown_name_from_zone(zone.orbit, alphabetical or filter))
        table.insert(values, {type = "zone", index = zone.orbit.index})
        if current and zone.orbit.index == current.index then selected_index = #list end
      elseif zone.type == "spaceship" then
        table.insert(list, Zone.dropdown_name_from_zone(zone, alphabetical or filter))
        table.insert(values, {type = "spaceship", index = zone.index})
        if current and zone.type == current.type and zone.index == current.index then selected_index = #list end
      else
        table.insert(list, Zone.dropdown_name_from_zone(zone, alphabetical or filter))
        table.insert(values, {type = "zone", index = zone.index})
        if current and zone.type == current.type and zone.index == current.index then selected_index = #list end
      end
    end
  end

  if alphabetical == true or filter then
    for _, zone in pairs(Zone.get_alphabetised()) do
      if not(zone.type == "orbit" and zone.parent.type == "star") then
        if (not filter) or string.find(string.lower(zone.name), string.lower(filter), 1, true) then
          conditional_add_zone_to_list(forcedata, current, zone)
        end
      end
    end
  else
    conditional_add_zone_to_list(forcedata, current, global.universe.anomaly)

    for _, star in pairs(global.universe.stars) do
      conditional_add_zone_to_list(forcedata, current, star)
      for _, planet in pairs(star.children) do
        conditional_add_zone_to_list(forcedata, current, planet)
        if planet.children then
          conditional_add_zone_to_list(forcedata, current, planet.orbit)
          for _, moon in pairs(planet.children) do
            conditional_add_zone_to_list(forcedata, current, moon)
            conditional_add_zone_to_list(forcedata, current, moon.orbit)
          end
        end
      end
    end

    for _, zone in pairs(global.universe.space_zones) do
      conditional_add_zone_to_list(forcedata, current, zone)
    end

    for _, spaceship in pairs(global.spaceships) do
      conditional_add_zone_to_list(forcedata, current, spaceship)
    end
  end

  if filter then
    list[1] = (#list - 1) .. " matching locations"
  else
    list[1] = (#list - 1) .. " known locations"
  end

  return list, selected_index, values
end


function Zone.build_tile_replacements(zone)
  -- replaces biome_collections in replace specifications with the full biome names
  --[[
convert :
biome_replacement = {
  {replace={"all-dirt", "all-sand", "all-volcanic"}, with="sand-red"},
  {replace={"all-vegetation", "all-frozen"}, with="vegetation-red"}
}
to
  {
    ["tile-from-1"] = "tile-to-1",
    ["tile-from-2"] = "tile-to-1",
  }
]]--
  if zone.biome_replacements then

    -- expand replacement collections
    local biome_replacements_expanded = {}
    for _, replacement in pairs(zone.biome_replacements) do
      local replace_biomes = {}
      for _, replace in pairs(replacement.replace) do
        if Zone.biome_collections[replace] then -- this is a collection name
          for _, biome_name in pairs(Zone.biome_collections[replace]) do
            if biome_name ~= replacement.with then -- don't replace to iteself
              table.insert(replace_biomes, biome_name)
            end
          end
        elseif replace ~= replacement.with then -- this is a biome name
          table.insert(replace_biomes, replace)
        end
      end
      table.insert(biome_replacements_expanded, {replace = replace_biomes, with = replacement.with})
    end
    -- biome_replacements_expanded now has all of the replace names being all biome names
    -- build tile map
    local tile_replacements = {}
    for _, replacement in pairs(biome_replacements_expanded) do
      local to_tiles = Zone.biome_tiles[replacement.with]
      local i = 0
      for _, replace in pairs(replacement.replace) do
        for _, replace_tile in pairs(Zone.biome_tiles[replace]) do
          tile_replacements[replace_tile] = to_tiles[(i % #to_tiles) + 1]
          i = i + 1
        end
      end
    end

    zone.tile_replacements = tile_replacements
  end

end

function Zone.on_chunk_generated(event)
  local area = event.area
  local surface = event.surface
  local zone = Zone.from_surface(surface)
  if zone and Zone.is_solid(zone) then
    if zone.biome_replacements then
      if not zone.tile_replacements then
        Zone.build_tile_replacements(zone)
      end
      local set_tiles = {} -- by tile name, array of positions, for the surface.set_tiles function
      for x = area.left_top.x, area.right_bottom.x do
        for y = area.left_top.y, area.right_bottom.y do
          local tile = surface.get_tile(x, y)
          if zone.tile_replacements[tile.name] then
            table.insert(set_tiles, {
               name = zone.tile_replacements[tile.name],
               position = tile.position
            })
          end
        end
      end
      if #set_tiles > 0 then
        surface.set_tiles(set_tiles, true)
        surface.destroy_decoratives{area = area}
        surface.regenerate_decorative(nil, {{x = math.floor((area.left_top.x+16)/32), y = math.floor((area.left_top.y+16)/32)}})
      end
    end
  end
end
Event.addListener(defines.events.on_chunk_generated, Zone.on_chunk_generated)

function Zone.clear_enemies(zone, position, radius)
  -- designed to clear a landing zone on a planet that has been discovered for a while
  local surface = Zone.get_surface(zone)
  if not surface then return end

  if zone.controls and zone.controls["enemy-base"] and zone.controls["enemy-base"].size and zone.controls["enemy-base"].size > 3 then return end

  if not position then position = {x = 0, y = 0} end
  if not radius then radius = Zone.clear_enemies_radius end

  local settled = surface.count_entities_filtered{force = {"enemy", "neutral"}, invert = true}
  if settled > 0 then return end

  local entities = surface.find_entities_filtered{force = "enemy", area = Util.position_to_area(position, radius)}
  for _, entity in pairs(entities) do
    if Util.vectors_delta_length(position, entity.position) < radius then
      entity.destroy()
    end
  end

end


function Zone.export_zone(zone)
  if not zone then return end
  -- not safe to deepcopy
  local export_zone = Util.shallow_copy(zone)
  if export_zone.orbit then
    export_zone.orbit_index = export_zone.orbit.index
    export_zone.orbit = nil
  end
  if export_zone.parent then
    export_zone.parent_index = export_zone.parent.index
    export_zone.parent = nil
  end
  if export_zone.children then
    export_zone.child_indexes = {}
    for i, child in pairs(export_zone.children) do
      export_zone.child_indexes[i] = child.index
    end
    export_zone.children = nil
  end
  -- should be safe to deepcopy now
  export_zone = Util.deep_copy(export_zone)
  return export_zone
end

function Zone.get_attrition(zone, default_rate)
  if zone then
    if zone.type == "spaceship" then
      return 0 -- default
    elseif zone.type == "anomaly" then
      return 10 + default_rate * 2
    elseif Zone.is_solid(zone) then -- planet or moon
      if zone.name == "Nauvis" then
        return default_rate
      end
      local enemy = 0
      if zone.controls and zone.controls["enemy-base"] and zone.controls["enemy-base"].size then
        enemy = math.max(0, math.min(3, zone.controls["enemy-base"].size) / 3) -- 0-1
      end
      local rate = 0.5 * (1 - enemy * 0.9)
      rate = rate + 0.5 * zone.radius / 10000
      if enemy == 0 then
        rate = rate + 10
      end
      if enemy >= 3 then
        rate = rate / 2
      end
      return rate * (0.5 + 0.5 * default_rate)
    else -- space
      local star_gravity_well = Zone.get_star_gravity_well(zone)
      local planet_gravity_well = Zone.get_planet_gravity_well(zone)
      local base_rate = star_gravity_well / 20 + planet_gravity_well / 200
      local rate = 10 * (0.01 + 0.99 * base_rate) -- 0-1
      return rate * (0.5 + 0.5 * default_rate)
    end
  end
end

return Zone
