local RemoteView = {}

-- constants
RemoteView.name_shortcut = mod_prefix.."remote-view"
RemoteView.name_event = mod_prefix.."remote-view"
RemoteView.name_gui_root = mod_prefix.."remote-view"
RemoteView.name_permissions_group = mod_prefix.."remote-view"
RemoteView.name_starmap_surface = "Starmap"

function RemoteView.get_stack_limit(stack) -- must be lua item stack, not simple stack
  local name = stack.name
  local type = stack.type
  if type == "blueprint"
    or type == "blueprint-book"
    or type == "deconstruction-item"
    or type == "selection-tool"
    or type == "upgrade-item"
    or type == "copy-paste-tool"
    or type == "cut-paste-tool" then
      return stack.count
  end
  if name == "artillery-targeting-remote" then -- type == "capsule"
    return stack.count
  end
  if name == "red-wire"
    or name == "green-wire"
    or name == "copper-cable" then
      return 2
  end
  return 0
end

function RemoteView.drop_stack(player, stack, drop_count, drop_to_ground)
  if player and player.connected and RemoteView.is_active(player) then
    local entity = player.opened or player.selected
    if entity then
      local inserted = entity.insert({name = stack.name, count = drop_count})
      if inserted < drop_count and drop_to_ground == true then
        player.surface.spill_item_stack(
          entity.position,
          {name = stack.name, count = drop_count - inserted},
          false, -- lootable
          player.force, -- deconstruct by force
          false) -- allow belts
      end
    elseif drop_to_ground then
      local limit = RemoteView.get_stack_limit(stack)
      if limit == 0 then
        player.surface.spill_item_stack(
          player.position,
          {name = stack.name, count = drop_count},
          false, -- lootable
          player.force, -- deconstruct by force
          false) -- allow belts
      end
    end
  end
end

function RemoteView.on_player_crafted_item(event)
  if not(event.item_stack and event.item_stack.valid_for_read) then return end
  local player = game.players[event.player_index]
  if player and player.connected and RemoteView.is_active(player) then
    local limit = RemoteView.get_stack_limit(event.item_stack)
    if limit > 0 then
      player.cursor_stack.set_stack(event.item_stack)
      if event.item_stack.count > limit then
        RemoteView.drop_stack(player, event.item_stack, event.item_stack.count - limit, false)
      end
      event.item_stack.count = limit
    else
      player.cursor_ghost = event.item_stack.prototype
      event.item_stack.count = 0
    end
  end
end
Event.addListener(defines.events.on_player_crafted_item, RemoteView.on_player_crafted_item)

function RemoteView.on_player_pipette(event)
  local player = game.players[event.player_index]
  if player and player.connected and RemoteView.is_active(player) then
    player.cursor_stack.clear()
    player.cursor_ghost = event.item
  end
end
Event.addListener(defines.events.on_player_pipette, RemoteView.on_player_pipette)

function RemoteView.on_player_cursor_stack_changed(event)
  local player = game.players[event.player_index]
  if player and player.connected and RemoteView.is_active(player) then
    local stack = player.cursor_stack
    if stack and stack.valid_for_read then
      local limit = RemoteView.get_stack_limit(stack)
      if limit > 0 then
        if stack.count > limit then
          if stack.name == "red-wire"
            or stack.name == "green-wire"
            or stack.name == "copper-cable" then
          --wire shortcuts mod messes things up
        else
          RemoteView.drop_stack(player, stack, stack.count - limit, true)
        end
        end
        stack.count = limit
      else
        RemoteView.drop_stack(player, stack, stack.count, true)
        player.cursor_ghost = stack.prototype
        player.cursor_stack.clear()
      end
    end
  end
end
Event.addListener(defines.events.on_player_cursor_stack_changed, RemoteView.on_player_cursor_stack_changed)

function RemoteView.on_player_main_inventory_changed(event)
  local player = game.players[event.player_index]
  if player and player.connected and RemoteView.is_active(player) then
    local inv = player.get_main_inventory()
    for i = 1, #inv do
      local stack = inv[i]
      if stack and stack.valid_for_read then
        local limit = RemoteView.get_stack_limit(stack)
        if limit > 0 then
          stack.count = limit
        else
          RemoteView.drop_stack(player, stack, stack.count, true)
          stack.count = 0
        end
      end
    end
  end
end
Event.addListener(defines.events.on_player_main_inventory_changed, RemoteView.on_player_main_inventory_changed)

function RemoteView.get_make_permission_group()
  local remote_view_permissions = game.permissions.get_group(RemoteView.name_permissions_group)
  --if remote_view_permissions then remote_view_permissions.destroy() remote_view_permissions = nil end -- debug
  if not remote_view_permissions then
    remote_view_permissions = game.permissions.create_group(RemoteView.name_permissions_group)
  end

  for _, action in pairs({
    defines.input_action.begin_mining_terrain	,
    defines.input_action.change_riding_state	,
    defines.input_action.change_shooting_state	,
    defines.input_action.cursor_split	,
    defines.input_action.destroy_opened_item	,
    defines.input_action.drop_item ,
    defines.input_action.fast_entity_split	,
    defines.input_action.fast_entity_transfer	,
    defines.input_action.inventory_split	,
    defines.input_action.inventory_transfer	,
    defines.input_action.map_editor_action	,
    defines.input_action.open_equipment	,
    defines.input_action.place_equipment	,
    defines.input_action.set_car_weapons_control	,
    defines.input_action.stack_split	,
    defines.input_action.stack_transfer	,
    defines.input_action.start_repair	,
    defines.input_action.take_equipment	,
    defines.input_action.toggle_driving	,
    defines.input_action.toggle_map_editor ,
  }) do
    remote_view_permissions.set_allows_action(action, false)
  end
  for _, action in pairs({
    defines.input_action.begin_mining	, -- allows mining ghosts, -- player.mining_state = {mining = false} stops actual mining
    defines.input_action.build_item,
    defines.input_action.build_rail	,
    defines.input_action.build_terrain,
    defines.input_action.change_picking_state,
    defines.input_action.craft	,
    defines.input_action.cursor_transfer,
    defines.input_action.open_character_gui	,
    defines.input_action.open_item	,
    defines.input_action.remove_cables	,
    defines.input_action.rotate_entity	,
    defines.input_action.start_walking	,
    defines.input_action.smart_pipette	,
    defines.input_action.undo	,
    defines.input_action.use_item	,
    defines.input_action.wire_dragging,
  }) do
    remote_view_permissions.set_allows_action(action, true)
  end

  return remote_view_permissions
end

function RemoteView.gui_add_button (gui_parent, zone, current_zone, indent)
  local offset = 20
  local button
  local caption = Zone.dropdown_name_from_zone(zone, not indent)
  local tooltip = {"space-exploration.zone-tooltip" }

  table.insert(tooltip, zone.name)

  table.insert(tooltip, {"space-exploration.zone-tooltip-type", Zone.type_title(zone)})

  if zone.resources and #zone.resources > 0 then
    table.insert(tooltip, {"space-exploration.zone-tooltip-resources", {"entity-name." .. zone.resources[1]}})
  else
    table.insert(tooltip, "")
  end

  if zone.radius then
    table.insert(tooltip, {"space-exploration.zone-tooltip-radius", math.ceil(zone.radius)})
  else
    table.insert(tooltip, "")
  end

  if Zone.is_solid(zone) then
    if zone.inflated then

      table.insert(tooltip, {"space-exploration.zone-tooltip-daynight", string.format("%.2f", zone.ticks_per_day/ 60 / 60 )})

      local enemy = 0
      if zone.controls and zone.controls["enemy-base"] and zone.controls["enemy-base"].size then
        enemy = math.max(0, math.min(3, zone.controls["enemy-base"].size) / 3) -- 0-1
      end
      table.insert(tooltip, {"space-exploration.zone-tooltip-lifesigns", string.format("%.2f",math.floor(enemy*100)).."%"})

    else
      table.insert(tooltip, {"space-exploration.zone-tooltip-daynight", "Unknown"})
      table.insert(tooltip, {"space-exploration.zone-tooltip-lifesigns", "Unknown"})
    end
  else
    table.insert(tooltip, "")
    table.insert(tooltip, "")
  end

  local interference_type = "radiation"
  if zone.type == "anomaly" then
    interference_type = "spacial distortion"
  elseif Zone.is_solid(zone) then
    interference_type = "wind"
  end
  if zone.type == "spaceship" then
    table.insert(tooltip, "")
  else
    if zone.inflated or Zone.is_space(zone) then
      table.insert(tooltip, {"space-exploration.zone-tooltip-bot-attrition", string.format("%.2f",Zone.get_attrition(zone, settings.global["robot-attrition-factor"].value)) .. " ("..interference_type..")"})
    else
      table.insert(tooltip, {"space-exploration.zone-tooltip-bot-attrition", "Unknown"})
    end
  end

  if zone.type == "spaceship" then
    button = gui_parent.add{type = "button", name="spaceship-" .. zone.index, style="view_zone_button", tooltip=tooltip,
      caption=caption }
    button.style.width = 290
    button.style.horizontal_align = "left"
  elseif zone.type == "orbit" and Zone.is_solid(zone.parent) then
    button = gui_parent.add{type = "button", name="zone-" .. zone.index, style="view_zone_button", tooltip=tooltip,
      caption="[img="..Zone.get_icon(zone) .."]"}
    button.style.width = 40
    button.style.left_margin = 7
  elseif Zone.is_solid(zone) then
    button = gui_parent.add{type = "button", name="zone-" .. zone.index, style="view_zone_button", tooltip=tooltip,
      caption=caption}
    button.style.width = 290 - 40 - 10
    button.style.horizontal_align = "left"
    if indent then
      if zone.type == "planet" then
        button.style.left_padding = offset
      else
        button.style.left_padding = offset * 2
      end
    end
  else
    button = gui_parent.add{type = "button", name="zone-" .. zone.index, style="view_zone_button", tooltip=tooltip,
      caption=caption}
    button.style.width = 290
    button.style.horizontal_align = "left"
    if indent then
      if zone.type == "asteroid-belt" then
        button.style.left_padding = offset
      end
    end
  end
  button.style.vertical_align = "center"
  -- TODO: debug this
  --if zone == current_zone then
  --  button.enabled = false
  --end
  return button
end

function RemoteView.gui_add_conditional_buttons (gui_parent, forcedata, zone, current_zone, indent)
  if global.debug_view_all_zones
    or (zone.type == "spaceship" and zone.force_name == forcedata.force_name)
    or (zone.type ~= "spaceship" and forcedata.zones_discovered[zone.index]) then
    if zone.type == "spaceship" then
      local flow = gui_parent.add{type="flow", name="spaceship-"..zone.index, direction="horizontal"}
      RemoteView.gui_add_button(flow, zone, current_zone, indent)
    else
      local flow = gui_parent.add{type="flow", name="zone-"..zone.index, direction="horizontal"}
      if zone.type == "star" then
        RemoteView.gui_add_button(flow, zone.orbit, current_zone, indent)
      elseif zone.type == "planet" or zone.type == "moon" then
        RemoteView.gui_add_button(flow, zone, current_zone, indent)
        RemoteView.gui_add_button(flow, zone.orbit, current_zone, indent)
      else
        RemoteView.gui_add_button(flow, zone, current_zone, indent)
      end
    end
  end
end

function RemoteView.gui_close (player)
  if player.gui.left[RemoteView.name_gui_root] then
    player.gui.left[RemoteView.name_gui_root].destroy()
  end
end

function RemoteView.gui_update (player) -- only call when something changed

  root = player.gui.left[RemoteView.name_gui_root]
  if root then

    local scroll_flow = root["view-zone-list"]
    scroll_flow.clear()

    local current_zone = Zone.from_surface(player.surface)

    local forcedata = global.forces[player.force.name]
    local playerdata = get_make_playerdata(player)

    local filter = nil
    if root.filter_flow and root.filter_flow.filter_list then
      filter = string.trim(root.filter_flow.filter_list.text)
      if filter == "" then
        filter = nil
      end
    end

    if filter or playerdata.zones_alphabetical then

      for _, zone in pairs(Zone.get_alphabetised()) do
        if not(zone.type == "orbit") then
          if (not filter) or string.find(string.lower(zone.name), string.lower(filter), 1, true) then
            RemoteView.gui_add_conditional_buttons(scroll_flow, forcedata, zone, current_zone, false)
          end
        end
      end

    else

      RemoteView.gui_add_conditional_buttons(scroll_flow, forcedata, global.universe.anomaly, current_zone, true)

      for _, star in pairs(global.universe.stars) do
        RemoteView.gui_add_conditional_buttons(scroll_flow, forcedata, star, current_zone, true)
        for _, planet in pairs(star.children) do
          RemoteView.gui_add_conditional_buttons(scroll_flow, forcedata, planet, current_zone, true)
          if planet.children then
            for _, moon in pairs(planet.children) do
              RemoteView.gui_add_conditional_buttons(scroll_flow, forcedata, moon, current_zone, true)
            end
          end
        end
      end

      for _, zone in pairs(global.universe.space_zones) do
        RemoteView.gui_add_conditional_buttons(scroll_flow, forcedata, zone, current_zone, true)
      end

      for _, spaceship in pairs(global.spaceships) do
        RemoteView.gui_add_conditional_buttons(scroll_flow, forcedata, spaceship, current_zone, true)
      end
    end

    if root.current then
      root.current.caption = {"space-exploration.currently-viewing", current_zone and current_zone.name or player.surface.name}
    end

  end
end


function RemoteView.gui_open (player)

  local gui = player.gui.left
  close_own_guis(player)
  RemoteView.gui_close(player)
  local playerdata = get_make_playerdata(player)

  local container = gui.add{ type = "frame", name = RemoteView.name_gui_root, style="space_platform_container", direction="vertical"}
  container.style.bottom_padding = 10

  -- title with exit button on the left (becuase shortbar vanisheds in ghost mode)
  local title_flow = container.add{ type="flow", name="title_flow", direction="horizontal"}
  local exit_button = title_flow.add{ type="sprite-button", name="exit_button", sprite="virtual-signal/"..mod_prefix.."remote-view", style="shortcut_bar_button_blue", tooltip={"space-exploration.exit-remote-view"}}
  local title = title_flow.add{ type="label", name="title", caption={"space-exploration.remote-view"}, style="space_platform_title"}
  title.style.top_margin = 5
  title.style.left_margin = 5

  local instruction = container.add{type = "label", name="instruction", caption={"space-exploration.remote-view-instruction"}}
  instruction.style.single_line  = false
  instruction.style.horizontally_stretchable = true

  local starmap_button = container.add{ type="button", name="starmap", caption={"space-exploration.starmap"}}
  starmap_button.style.top_margin = 10

  container.add{type="checkbox", name="list-zones-alphabetical", caption="List destinations alphabetically", state=playerdata.zones_alphabetical and true or false}

  local filter_container = container.add{ type="flow", name="filter_flow", direction="horizontal"}
  local filter_field = filter_container.add{ type="textfield", name="filter_list"}
  filter_field.style.width = 275
  local filter_button = filter_container.add{ type = "sprite-button", name="clear_filter", sprite="utility/search_icon", tooltip={"space-exploration.clear-filter"},}
  filter_button.style.left_margin = 5
  filter_button.style.width = 28
  filter_button.style.height = 28

  local scroll_flow = container.add{ type="scroll-pane", name="view-zone-list", direction="vertical"}
  scroll_flow.style.top_margin = 5
  scroll_flow.style.maximal_height = 400

  local current = container.add{type = "label", name="current", caption={"space-exploration.currently-viewing"}}
  current.style.single_line  = false
  current.style.horizontally_stretchable = true

  local back_button = container.add{ type="button", name="exit_button", style="back_button", tooltip={"space-exploration.exit-remote-view"}, caption={"space-exploration.back"}}
  back_button.style.top_margin = 10
  RemoteView.gui_update (player)
end


function RemoteView.start_starmap (player)
  if not game.surfaces[RemoteView.name_starmap_surface] then
    local mapgen_settings = {}
    mapgen_settings.property_expression_names = {}
    mapgen_settings.property_expression_names["tile:out-of-map:probability"] = math.huge
    game.create_surface(RemoteView.name_starmap_surface, mapgen_settings)
  end

  local surface = game.surfaces[RemoteView.name_starmap_surface]
  surface.daytime = 0;
  surface.freeze_daytime = true

  local scale = 0.25
  local text_offset = {x = 0.6, y = -0.4}

  local from_surface = player.surface
  if from_surface.name == RemoteView.name_starmap_surface then return end
  local from_zone = Zone.from_surface(from_surface)
  local start_stellar_position = nil
  if from_zone then
    start_stellar_position = Zone.get_stellar_position(from_zone)
  end
  if not start_stellar_position then start_stellar_position = {x = 0, y = 0} end

  RemoteView.stop_starmap(player)
  player.teleport(Util.vector_multiply(start_stellar_position, scale), surface)


  local playerdata = get_make_playerdata(player)
  local forcedata = global.forces[player.force.name]
  playerdata.starmap_objects = {}
  for _, star in pairs(global.universe.stars) do
    local object_id = rendering.draw_sprite{
      sprite = "virtual-signal.se-star",
      surface = surface,
      target = Util.vector_multiply(star.stellar_position, scale),
      players = {player}
    }
    table.insert(playerdata.starmap_objects, object_id)
    if forcedata.zones_discovered[star.index] then
      local object_id = rendering.draw_text{
        text = star.name,
        surface = surface,
        target = Util.vectors_add(text_offset, Util.vector_multiply(star.stellar_position, scale)),
        players = {player},
        color = {r=255, g=128, b=0, a=255},
        scale_with_zoom = false,
        scale = 1.2
      }
      table.insert(playerdata.starmap_objects, object_id)
    end
  end
  for _, zone in pairs(global.universe.space_zones) do
    local object_id = rendering.draw_sprite{
      sprite = "virtual-signal.se-asteroid-field",
      surface = surface,
      target = Util.vector_multiply(zone.stellar_position, scale),
      players = {player}
    }
    table.insert(playerdata.starmap_objects, object_id)
    if forcedata.zones_discovered[zone.index] then
      local object_id = rendering.draw_text{
        text = zone.name,
        surface = surface,
        target = Util.vectors_add(text_offset, Util.vector_multiply(zone.stellar_position, scale)),
        players = {player},
        color = {r=255, g=255, b=255, a=128},
        scale_with_zoom = false,
      }
      table.insert(playerdata.starmap_objects, object_id)
    end
  end
  for _, spaceship in pairs(global.spaceships) do
    local object_id = rendering.draw_sprite{
      sprite = "virtual-signal.se-spaceship",
      surface = surface,
      target = Util.vector_multiply(spaceship.stellar_position, scale),
      players = {player}
    }
    table.insert(playerdata.starmap_objects, object_id)
    if spaceship.force_name == player.force.name then
      local object_id = rendering.draw_text{
        text = spaceship.name,
        surface = surface,
        target = Util.vectors_add(text_offset, Util.vector_multiply(spaceship.stellar_position, scale)),
        players = {player},
        color = {r=0, g=255, b=255, a=255},
        scale_with_zoom = false,
      }
      table.insert(playerdata.starmap_objects, object_id)
    end
  end

end

function RemoteView.stop_starmap (player)
  -- just delete the starmap graphics for this player
  local playerdata = get_make_playerdata(player)
  if playerdata.starmap_objects then
    for _, object_id in pairs(playerdata.starmap_objects) do
      rendering.destroy(object_id)
    end
  end
  playerdata.starmap_objects = nil
end

function RemoteView.stop (player)
  player.cheat_mode = false
  local playerdata = get_make_playerdata(player)
  -- exit remote view
  if playerdata.remote_view_active then
    playerdata.remote_view_active = nil
    RemoteView.gui_close(player)
    RemoteView.stop_starmap(player)
    player.permission_group = nil
    if playerdata.character and playerdata.character.valid then
      if playerdata.anchor_scouting_for_spaceship_index then
        player.set_controller{type = defines.controllers.ghost}
      else
        player.teleport(playerdata.character.position, playerdata.character.surface)
        player.set_controller{type = defines.controllers.character, character = playerdata.character}
      end
    elseif not player.character then
      Respawn.die(player)
    end
  end

end

function RemoteView.start (player)
  if global.debug_view_all_zones or
   (global.forces[player.force.name]
    and global.forces[player.force.name].satellites_launched > 0) then
    local playerdata = get_make_playerdata(player)

    Spaceship.stop_anchor_scouting(player)

    local character = player.character
    -- enter remote view
    playerdata.remote_view_active = true

    local current_zone = Zone.from_surface(player.surface)
    playerdata.remote_view_zone_index = current_zone and current_zone.index or nil
    --player.set_controller{type = defines.controllers.spectator}
    --player.set_controller{type = defines.controllers.ghost}
    player.set_controller{type = defines.controllers.god}

    player.permission_group = RemoteView.get_make_permission_group()

    if character then
      playerdata.character = character
      -- stop the character from continuing input action (running to doom)
      character.walking_state = {walking = false, direction = defines.direction.south}
      character.riding_state = {acceleration = defines.riding.acceleration.braking, direction = defines.riding.direction.straight}
      character.shooting_state = {state = defines.shooting.not_shooting, position=character.position}
    end
    player.cheat_mode = true

    -- add zone select gui
    RemoteView.gui_open(player)
  else
    player.print({"space-exploration.remote-view-requires-satellite"})
  end
end

function RemoteView.is_active (player)
  return get_make_playerdata(player).remote_view_active == true
end

function RemoteView.toggle (player)
  if RemoteView.is_active(player) then
    RemoteView.stop(player)
  else
    RemoteView.start(player)
  end
end

function RemoteView.on_gui_click (event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]

  root = gui_element_or_parent(element, RemoteView.name_gui_root)
  if root then -- remote view
    if element.parent and element.parent.parent and element.parent.parent.name == "view-zone-list" then
      if string.find(element.name, "zone-", 1, true) then
        local number_string = util.replace(element.name, "zone-", "")
        local zone_index = util.string_to_number(number_string)
        local zone = Zone.from_zone_index(zone_index)
        if zone then
          Zone.clear_enemies(zone)
          local surface = Zone.get_make_surface(zone)
          local position = {x=0,y=0}
          local playerdata = get_make_playerdata(player)
          if playerdata.surface_positions and playerdata.surface_positions[surface.index] then
            position = playerdata.surface_positions[surface.index]
          else
            player.force.chart(surface, util.position_to_area({x = 0, y = 0}, 256))
          end
          player.teleport(position, surface)
          Zone.apply_markers(zone) -- in case the surface exists
          RemoteView.gui_update (player)
        end
      elseif string.find(element.name, "spaceship-", 1, true) then
        local number_string = util.replace(element.name, "spaceship-", "")
        local spaceship_index = util.string_to_number(number_string)
        local spaceship = Spaceship.from_index(spaceship_index)
        if spaceship then
          if spaceship.console and spaceship.console.valid then
            player.teleport(spaceship.console.position, spaceship.console.surface)
          else
            local surface = Spaceship.get_current_surface(zone)
            if spaceship.known_tiles_average_x and spaceship.known_tiles_average_y then
              player.teleport({spaceship.known_tiles_average_x,spaceship.known_tiles_average_y}, surface)
            else
              player.teleport({0,0}, surface)
            end
          end
          RemoteView.gui_update (player)
        end
      end
    end
    if not (event.element and event.element.valid) then return end
    if element.name == "starmap" then
      RemoteView.start_starmap(player)
      RemoteView.gui_update (player)
    elseif element.name == "clear_filter" then
      element.parent.filter_list.text = ""
      RemoteView.gui_update(player)
    elseif element.name == "exit_button" then
      RemoteView.stop(player)
    end
    return
  end
end
Event.addListener(defines.events.on_gui_click, RemoteView.on_gui_click)

function RemoteView.on_gui_text_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]

  local root = gui_element_or_parent(element, RemoteView.name_gui_root)
  if root then -- remote view
    if element.name == "filter_list" then
      RemoteView.gui_update(player)
    end
  end
end
Event.addListener(defines.events.on_gui_text_changed, RemoteView.on_gui_text_changed)

function RemoteView.on_gui_checked_state_changed(event)
  local element = event.element
  local player = game.players[event.player_index]

  local root = gui_element_or_parent(element, RemoteView.name_gui_root)
  local playerdata = get_make_playerdata(player)
  if element.name == "list-zones-alphabetical" then
    playerdata.zones_alphabetical = element.state
    -- update the list
    RemoteView.gui_update(player)
  end
end
Event.addListener(defines.events.on_gui_checked_state_changed, RemoteView.on_gui_checked_state_changed)

function RemoteView.on_lua_shortcut (event)
  if event.player_index
    and game.players[event.player_index]
    and game.players[event.player_index].connected then

      if event.prototype_name == RemoteView.name_shortcut then
        RemoteView.toggle(game.players[event.player_index])
      end

  end
end
Event.addListener(defines.events.on_lua_shortcut, RemoteView.on_lua_shortcut)

function RemoteView.on_remote_view_keypress (event)
  if event.player_index
    and game.players[event.player_index]
    and game.players[event.player_index].connected
  then
      RemoteView.toggle(game.players[event.player_index])
  end
end
Event.addListener(RemoteView.name_event, RemoteView.on_remote_view_keypress)

return RemoteView
