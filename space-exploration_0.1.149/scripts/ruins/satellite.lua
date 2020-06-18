-- Note: Default entity force will be 'capture', if a player character get near and there are no enemies the player will capture the entity.
local satellite = {
  center = {x = 11, y = 5},
  tiles = {
    ["se-space-platform-scaffold"] = {
                                              {0, 5},
                                      {1,4},  {1,5},  {1,6},
                                      {2,4},  {2,5},  {2,6},
                                      {3,4},  {3,5},  {3,6},
                                      {4,4},  {4,5},  {4,6},
                                      {5,4},  {5,5},  {5,6},
                                              {9,5},
                              {11,3},
                                              {12,5},
                                      {16,4}, {16,5}, {16,6},
                                      {17,4}, {17,5}, {17,6},
                                      {18,4}, {18,5}, {18,6},
                                      {19,4}, {19,5}, {19,6},
                                      {20,4}, {20,5}, {20,6},
                                      {21,4}, {21,5}, {21,6}},
    ["se-space-platform-plating"] = {
                                              {6,5},
                                              {7,5},
                                              {8,5},
              {10,0}, {10,1}, {10,2},                 {10,5}, {10,6}, {10,7}, {10,8}, {10,9},
              {11,0}, {11,1}, {11,2},         {11,4}, {11,5}, {11,6}, {11,7}, {11,8},
              {12,0}, {12,1}, {12,2},
                                              {13,5},
                                              {14,5},
                                              {15,5},
    },
  },
  under_tiles = {
    -- allows setting of the tile under a floor, eg: grass under concrete
    -- only works if there is an over tile
    -- warning: setting under tiles is much slower than over tiles
    ["vegetation-green-grass-1"] = {
                                              {0, 5},
                                      {1,4},  {1,5},  {1,6},
                                      {2,4},  {2,5},  {2,6},
                                      {3,4},  {3,5},  {3,6},
    },
  },
  entities = {
    ["gun-turret"] = {
      {
        x = 3,
        y = 5,
        force_name = "enemy",
        direction = defines.direction.west,
        stacks = {{name = "uranium-rounds-magazine", count = 200}}
      }
    },
    ["radar"] = {{11, 1}},
    ["substation"] = {{10.5, 5.5}},
    ["accumulator"] = {{10.5, 8.5}},
    ["solar-panel"] = {{17, 5}, {20, 5}},
    ["iron-chest"] = {
      {
        x = 11,
        y = 4,
        stacks = {
          {name = "automation-science-pack", count = 1000},
          {name = "logistic-science-pack", count = 1000},
          {name = "chemical-science-pack", count = 1000},
          {name = "space-science-pack", count = 1000},
          {name = "solar-panel", count = 10},
          {name = "raw-fish", count = 1},
          {name = mod_prefix.."medpack", count = 1},
          {name = mod_prefix.."space-science-lab", count = 1},
          {name = mod_prefix.."space-platform-plating", count = 100},
          {name = mod_prefix.."space-platform-scaffold", count = 200},
        }
      }
    }
  },
  wires = {
    [defines.wire_type.copper] = {
    },
    [defines.wire_type.red] = {
      {
        from = { name = "substation", position = { x = 10.5, y = 5.5} } ,
        to = { name = "accumulator", position = { x = 10.5, y = 8.5} } ,
      }
    },
    [defines.wire_type.green] = {},
  },
  prebuild = function(surface, ruin_position, ruin) -- surface, position, self (maybe modified)
    -- function that runs before tiles and entities are added
    game.print("test start")
  end,
  postbuild = function(surface, ruin_position, ruin) -- surface, position, self (maybe modified)
    -- function that runs after tiles and entities are added
    -- maybe required to set conditions

    local accumulator = surface.find_entity("accumulator",
      {
        x = 10.5 + ruin_position.x - ruin.center.x,
        y = 8.5 + ruin_position.y - ruin.center.y
      }
    )
    local control = accumulator.get_or_create_control_behavior() -- https://lua-api.factorio.com/latest/LuaControlBehavior.html#LuaAccumulatorControlBehavior
    control.output_signal = {type = "virtual", name = "signal-B"}
    game.print("test end")
  end,
}

return satellite
