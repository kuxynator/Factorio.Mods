Weapon = {}

-- constants
Weapon.tesla_base_damage = 25
Weapon.tesla_ammo_category = "tesla"

function Weapon.on_trigger_created_entity(event)
  if not event.entity and event.entity.valid then return end
  if event.entity.name == mod_prefix.."tesla-gun-trigger" then
    local tick_task = new_tick_task("chain-beam")
    tick_task.surface = event.entity.surface
    tick_task.beam = mod_prefix.."tesla-gun-beam"
    tick_task.max_bounces = 10 + math.random() * 20
    tick_task.range = 10
    tick_task.instigator = event.source
    tick_task.instigator_force = event.source.force
    tick_task.initial_vector = util.vector_normalise(util.vectors_delta(event.source.position, event.entity.position))
    local first_hit = util.move_to(event.source.position, event.entity.position, 3, false)
    tick_task.affected_locations = {{position = first_hit}}
    local source = event.source.position
    -- gun graphic offset
    source.y = source.y - 1
    source = util.move_to(source, util.vectors_add(source, tick_task.initial_vector), 0.7, true)

    tick_task.surface.create_entity{
      name = tick_task.beam,
      position = first_hit,
      target_position = first_hit,
      source_position = source,
      duration = 10,
    }
  elseif event.entity.name == mod_prefix .. "plague-cloud"then
    local surface_index = event.entity.surface.index
    local zone = Zone.from_surface_index(surface_index)
    if zone and not zone.plague_tick_task then
       if not zone.plague_used then
         zone.plague_used = game.tick
       end
       local surface = event.entity.surface
       local map_gen_settings = surface.map_gen_settings
       map_gen_settings.autoplace_controls["enemy-base"].size = -1
       map_gen_settings.autoplace_controls["trees"].size = -1
       surface.map_gen_settings = map_gen_settings
       local tick_task = new_tick_task("plague-tick")
       tick_task.surface_index = surface_index
       tick_task.zone = zone
       if event.entity.force then
         tick_task.force_name = event.entity.force.name
       end
       tick_task.started = game.tick
       zone.plague_tick_task = tick_task
    end
  end
end
Event.addListener(defines.events.on_trigger_created_entity, Weapon.on_trigger_created_entity)

function Weapon.plague_tick(tick_task)
  --game.print((game.tick - (tick_task.started + 10 * 60 * 60)) / 60)
  if game.tick > tick_task.started + settings.global["se-plage-max-runtime"].value * 60 * 60 then -- 15 minutes
    tick_task.valid = false
    tick_task.zone.plague_tick_task = nil
    local surface = game.surfaces[tick_task.surface_index]
    local enemies = surface.find_entities_filtered{ force = "enemy" }
    for _, entity in pairs(enemies) do
      entity.destroy()
    end
    local plague = surface.find_entities_filtered{ name={
      mod_prefix .. "plague-cloud",
      mod_prefix .. "plague-wave"} }
    for _, entity in pairs(plague) do
      entity.destroy()
    end
    local trees = surface.find_entities_filtered{ type = "tree" }
    for _, entity in pairs(trees) do
      entity.destroy()
    end
  end
end

function Weapon.chain_beam(tick_task)
  local branch_chance = tick_task.branch_chance or 0.1
  local emanate_from = nil
  if math.random() < branch_chance then
    emanate_from = tick_task.affected_locations[math.random(#tick_task.affected_locations)] -- branching bouncing beam
  else
    emanate_from = tick_task.affected_locations[#tick_task.affected_locations] -- single bouncing beam
  end

  local entities = tick_task.surface.find_entities_filtered{
    area = util.position_to_area(emanate_from.position, tick_task.range),
    collision_mask = {"object-layer", "player-layer"},
  }

  local valids = {}
  for _, entity in pairs(entities) do
    if entity.valid and (entity.type ~= "cliff" and entity.force ~= tick_task.instigator_force) then
      local already_affected = false
      for _, affected in pairs(tick_task.affected_locations) do
        if entity == affected.entity then
          already_affected = true
        end
      end
      if not already_affected then
        table.insert(valids, entity)
      end
    end
  end

  local desired_pos = util.vectors_add(emanate_from.position, util.vector_multiply(util.vector_normalise(tick_task.initial_vector), 2))

  local chosen = nil

  if #valids > 0 then

    local closest_dist = 10000
    for _, valid in pairs(valids) do
      local dist = (1 + util.vectors_delta_length(desired_pos, valid.position)) * 0.5 + math.random()
      if dist < closest_dist then
        closest_dist = dist
        chosen = valid
      end
    end

  end

  if chosen then
    table.insert(tick_task.affected_locations, {position = chosen.position, entity = chosen})

    if chosen.type == "simple-entity" and string.find(chosen.name, "rock") then
      chosen.health = math.max(0.01, chosen.health - chosen.prototype.max_health / 50)
    end

    local target_position = chosen.position

    local force = tick_task.instigator_force
    local bonus_damage = Weapon.tesla_base_damage * force.get_ammo_damage_modifier(Weapon.tesla_ammo_category)
    if bonus_damage > 0 then
      chosen.damage(bonus_damage, force, "electric")
    end

    local target = nil
    if chosen and chosen.valid then
      target = chosen
    end

    tick_task.surface.create_entity{
      name = tick_task.beam,
      position = emanate_from.position,
      target = target,
      force = force,
      target_position = target_position,
      source_position = emanate_from.position,
      duration = 10,
    }
  else
    -- hit ground
    local ground = {x = desired_pos.x + ((math.random() - 0.5) * 0.25 * tick_task.range),
                    y = desired_pos.y + ((math.random() - 0.5) * 0.25 * tick_task.range)}

    table.insert(tick_task.affected_locations, {position = ground})

    tick_task.surface.create_entity{
      name = tick_task.beam,
      position = emanate_from.position,
      target_position = ground,
      source_position = emanate_from.position,
      duration = 10,
    }
  end

  if #tick_task.affected_locations >= (tick_task.max_bounces or 2) then
    tick_task.valid = false
  end

end


return Weapon
