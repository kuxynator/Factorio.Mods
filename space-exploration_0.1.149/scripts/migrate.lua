local Migrate = {}

function Migrate.migrations()
  if not global.version then global.version = 0 end

  if global.version < version then
    if global.version < 000138 then Migrate.v0_1_38() end
    if global.version < 0001065 then Migrate.v0_1_65() end
    if global.version < 0001086 then Migrate.v0_1_86() end
    if global.version < 0001089 then Migrate.v0_1_89() end
    if global.version < 0001096 then Migrate.v0_1_96() end
    if global.version < 0001101 then Migrate.v0_1_101() end
    if global.version < 0001126 then Migrate.v0_1_126() end
    if global.version < 0001130 then Migrate.v0_1_130() end
  end
  global.version = version
end

function Migrate.v0_1_38_zone(zone)
  zone.core_miners = nil
  local surface = Zone.get_make_surface(zone)
  for _, miner in pairs(surface.find_entities_filtered{name = mod_prefix.."core-miner"}) do
    Coreminer.on_entity_created({entity = miner})
  end
end

function Migrate.v0_1_38 ()
  if global.universe then

    for _, star in pairs(global.universe.stars) do
      for _, planet in pairs(star.children) do
        if planet.core_miners then
          Migrate.v0_1_38_zone(planet)
        end
        if planet.children then -- could be an asteroid-belt
          for _, moon in pairs(planet.children) do
            if moon.core_miners then
              Migrate.v0_1_38_zone(moon)
            end
          end
        end
      end
    end
  end

end

function Migrate.v0_1_65 ()
  if global.universe then
    for _, zone in pairs(global.zone_index) do
      if zone.controls and zone.controls["enemy"] then
        zone.controls["enemy-base"] = zone.controls["enemy"]
        zone.controls["enemy"] = nil
        if zone.name ~= "Nauvis" then
          local surface = Zone.get_surface(zone)
          if surface then
            local map_gen_settings = surface.map_gen_settings
            map_gen_settings.autoplace_controls["enemy-base"].size = zone.controls["enemy-base"].size
            map_gen_settings.autoplace_controls["enemy-base"].frequency = zone.controls["enemy-base"].frequency
            surface.map_gen_settings = map_gen_settings
            if zone.controls["enemy-base"].size == 0  then
              local enemies = surface.find_entities_filtered{force={"enemy"}}
              for _, enemy in pairs(enemies) do
                enemy.destroy()
              end
            end
          end
        end
      end
    end
  end

end

function Migrate.v0_1_86()
  if global.universe then
    for _, zone in pairs(global.zone_index) do
      if Zone.is_solid(zone) then
        -- nauvis is 25000
        if zone.inflated and not zone.ticks_per_day then
          zone.ticks_per_day = 25000 -- nauvis
          if zone.name ~= "Nauvis" then
            if math.random() < 0.5 then
              zone.ticks_per_day = 60*60 + math.random(60*60*59) -- 1 - 60 minutes
            else
              zone.ticks_per_day = 60*60 + math.random(60*60*19) -- 1 - 20 minutes
            end
            local surface = Zone.get_surface(zone)
            if surface then
              surface.ticks_per_day = zone.ticks_per_day
            end
          end
        end
      end
    end
  end
end

function Migrate.v0_1_89()
  --global.rocket_landing_pads = global.rocket_landing_pads or {}
  for _, struct in pairs(global.rocket_landing_pads) do
    Landingpad.rename(struct, struct.name)
  end
end

function Migrate.v0_1_96()
  if global.universe then
    for _, zone in pairs(global.zone_index) do
      if Zone.is_space(zone) then
        local surface = Zone.get_surface(zone)
        if surface then
          local entities = surface.find_entities_filtered{type="offshore-pump"}
          for _, entity in pairs(entities) do
            entity.destroy()
          end
        end
      end
    end
  end
end

function Migrate.v0_1_101()
  if global.meteor_zones then
    for _, zone in pairs(global.meteor_zones) do
      if zone.meteor_defences then
        for _, defence in pairs(zone.meteor_defences) do
          if defence.charger and defence.charger.valid then
            defence.container = defence.charger.surface.find_entity(Meteor.name_meteor_defence_container, defence.charger.position)
            if defence.container then
              defence.container.active = false
              defence.container.insert({name=Meteor.name_meteor_defence_ammo, count=10})
            end
          end
        end
      end
      if zone.meteor_point_defences then
        for _, defence in pairs(zone.meteor_point_defences) do
          if defence.charger and defence.charger.valid then
            defence.container = defence.charger.surface.find_entity(Meteor.name_meteor_point_defence_container, defence.charger.position)
            if defence.container then
              defence.container.active = false
              defence.container.insert({name=Meteor.name_meteor_point_defence_ammo, count=20})
            end
          end
        end
      end
    end
  end
end

function Migrate.v0_1_126()
  for _, surface in pairs(game.surfaces) do
    local zone = Zone.from_surface(surface)
    if zone then
      if zone.type == "spaceship" then
        local map_gen_settings = surface.map_gen_settings
        map_gen_settings.autoplace_settings={
          ["decorative"]={
            treat_missing_as_default=false,
            settings={
            }
          },
          ["entity"]={
            treat_missing_as_default=false,
            settings={
            }
          },
          ["tile"]={
            treat_missing_as_default=false,
            settings={
              ["se-space"]={}
            }
          }
        }
        surface.map_gen_settings = map_gen_settings
      elseif Zone.is_space(zone) then
        local map_gen_settings = surface.map_gen_settings
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
        surface.map_gen_settings = map_gen_settings
      else
        local map_gen_settings = surface.map_gen_settings
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
        surface.map_gen_settings = map_gen_settings
      end
    end
  end
end

function Migrate.v0_1_130()
  for _, surface in pairs(game.surfaces) do
    local zone = Zone.from_surface(surface)
    if zone and zone.type == "orbit" and zone.parent and zone.parent.type == "star" then
      surface.daytime = 0 -- that's why we're here
    end
  end
end

return Migrate
