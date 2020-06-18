local data_util = require("data_util")
local Shared = require("shared")

local resource_controls = {}

for _, resource in pairs(data.raw.resource) do

  -- no infinte versions of otherwise existing resources
  if string.find(resource.name, "infinite", 1, true)
   or string.find(resource.name, "unlimited", 1, true)
   or string.find(resource.name, "endless", 1, true)
   then
    log("Resource detected as infinite: " .. resource.name)
    resource.autoplace = nil
  end

  -- no resources without controls
  if resource.autoplace == nil or not resource.autoplace.control then
    log("Resource has no control: " .. resource.name)
    resource.autoplace = nil
  else
    log("Resource has control: " .. resource.name .. ": " .. resource.autoplace.control)
  end

  if resource.autoplace and not data_util.table_contains(Shared.resources_with_shared_controls, resource.name) then
    if resource_controls[resource.autoplace.control] then
      -- resources MUST have thier own control - critical for surface resource difference
      -- actually in cases where there are multiple sub-types of a resource sharing the same control is acceptable, example: ground water and lithia water.
      -- it would not be useful to have a planet with just ground water as a resource
      resource.autoplace = nil
      log("Resource control already occupied: " .. resource.name)
    else
      resource_controls[resource.autoplace.control] = "taken"
    end
  end

  if resource.autoplace == nil then
    log("Resource cannot place: " .. resource.name)
  else
    log("Resource can place: " .. resource.name)
  end

  --[[if not (resource.category == "basic-fluid" and resource.minable and resource.minable.results
    and #resource.minable.results == 1 and resource.minable.results[1] and resource.minable.results[1].type == "fluid") then
    -- no endless non-fluids
    resource.infinite = false
    resource.minimum = nil
    resource.normal = nil
    resource.maximum = nil
  end]]--

  if resource.minable and resource.minable.results then
    for _, result in ipairs(resource.minable.results) do
        if result and result.type ~= "fluid" then
            -- no endless non-fluids
            resource.infinite = false
            resource.minimum = nil
            resource.normal = nil
            resource.maximum = nil
        end
    end
  end

end
