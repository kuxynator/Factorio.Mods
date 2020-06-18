local data_util = require("data_util")

local resource_image = {
    filename = "__space-exploration-graphics__/graphics/blank.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    shift = { 0, 0 },
    variation_count = 1,
}

-- core fragments (cooled magma)
-- A generic mining recipe is used, the actual output item is chosen by script
local resource_multipliers = {
  ["stone"] = 2,
  ["iron-ore"] = 1.2,
  ["coal"] = 0.6,
  ["uranium-ore"] = 0.01,
}
local fragments = {}
local omni_name = data_util.mod_prefix .. "core-fragment-omni"
fragments[omni_name] = {name = omni_name, divisor = 1, products = {}}

for _, resource in pairs(data.raw.resource) do
  --log("add fragment resource " ..  resource.name )
  if resource.autoplace
    and resource.name ~= data_util.mod_prefix .. "water-ice"
    and resource.name ~= data_util.mod_prefix .. "methane-ice" then -- don't add removed resources?
    local fragment = {
      name = data_util.mod_prefix .. "core-fragment-" .. resource.name,
      item_name = "entity-name."..resource.name
    }
    --log(resource.name)
    local products = {}
    if resource.minable.result and type(resource.minable.result) == "string" then
      products[resource.minable.result] = {name = resource.minable.result, amount = 1}
    elseif type(resource.minable.result) == "table" then
      local product = data_util.collapse_product(resource.minable.result)
      products[product.name] = product
    elseif resource.minable.results and resource.minable.results.name then
      products = {data_util.collapse_product(resource.minable.results)}
    elseif resource.minable.results and resource.minable.results[1] and type(resource.minable.results[1]) == "table" then
      for _, p in pairs(resource.minable.results) do
        table.insert(products, data_util.collapse_product(p))
      end
    elseif resource.minable.results then
      products = data_util.collapse_product(resource.minable.results)
    end
    if table_size(products) > 0 then
      fragment.products = products
      fragments[fragment.name] = fragment
      for _, product in pairs(products) do
        local amount = 0
        if product.amount then
          amount = product.amount
        elseif product.amount_min and product.amount_max then
          amount = (product.amount_min + product.amount_max) / 2
        end
        if product.probability then amount = amount * product.probability end
        if resource_multipliers[product.name] then
          amount = amount * resource_multipliers[product.name]
        end

        product.amount = amount
        product.amount_min = nil
        product.amount_max = nil
        product.probability = 1
        fragments[omni_name].products[product.name] = fragments[omni_name].products[product.name] or {name = product.name, amount = 0, type = product.type}
        fragments[omni_name].divisor = fragments[omni_name].divisor + 1
        fragments[omni_name].products[product.name].amount = fragments[omni_name].products[product.name].amount + product.amount
      end
    end
  end
end

-- extra framgents
if not fragments[omni_name].products.stone then
  fragments[omni_name].products.stone = {name = "stone", amount = 1}
end
if not fragments[omni_name].products.coal then
  fragments[omni_name].products.coal = {name = "coal", amount = 0.1}
end
if not fragments[omni_name].products["crude-oil"] then
  fragments[omni_name].products["crude-oil"] = {name = "crude-oil", type = "fluid", amount = 10}
else
  fragments[omni_name].products["crude-oil"] = {name = "crude-oil", type = "fluid", amount = 10} -- override omni only, dedicated fragment should still be 100
end
-- water, can be hard to find on some planets,
-- adding water to the omni measn there's a small chance that
-- a different fragment type breaks down into something with water
if not fragments[omni_name].products["water"] then
  fragments[omni_name].products.water = {name = "water", type = "fluid", amount = 5}
end

-- TODO: test with high fluid resource modpack
local omni_fluids = 0
for _, product in pairs(fragments[omni_name].products) do
  if product.type == "fluid" then
    omni_fluids = omni_fluids + 1
  end
end
if omni_fluids > 4 then -- water infinite anyway
  fragments[omni_name].products.water = nil
  omni_fluids = omni_fluids - 1
end
if omni_fluids > 4 then -- crude-oil infinite anyway
  fragments[omni_name].products["crude-oil"] = nil
  omni_fluids = omni_fluids - 1
end
if omni_fluids > 4 then
  local safe_products = {}
  omni_fluids = 0
  for _, product in pairs(fragments[omni_name].products) do
    if product.type == "fluid" then
      if omni_fluids < 4 then
        safe_products[product.name] = product
        omni_fluids = omni_fluids + 1
      end
    else
      safe_products[product.name] = product
    end
  end
  fragments[omni_name].products = safe_products
end


local c = 0
for _, fragment in pairs(fragments) do
    c = c + 1
    local key_product = fragment.products[1]
    local locale
    if fragment.resource_name then
      locale = "resource-name." .. fragment.resource_name
    end
    local item =
    {
      type = "item",
      name = fragment.name,
      icon_size = 32,
      icons = {
        {icon = "__space-exploration-graphics__/graphics/icons/core-fragment.png", scale = 1}
      },
      subgroup = "core-fragments",
      order = "a"..c,
      stack_size = 100,
      localised_name = {"item-name.core-fragment", {fragment.item_name}}
    }
    if table_size(fragment.products) == 1 then
      for _, product in pairs(fragment.products) do
        if product.type == "fluid" and  data.raw.fluid[product.name] and  data.raw.fluid[product.name].icon then
          table.insert(item.icons, {icon = data.raw.fluid[product.name].icon, scale = 1, tint = {r = 0.5, g = 0.5, b = 0.5, a = 0.5}})
        elseif data.raw.item[product.name] and data.raw.item[product.name].icon then
          table.insert(item.icons, {icon = data.raw.item[product.name].icon, scale = 1, tint = {r = 0.5, g = 0.5, b = 0.5, a = 0.5}})
        end
      end
    end
    local recipe_products = { }
    if _ ~= omni_name then
      table.insert(recipe_products, {name = omni_name, amount = 5})
    else
      item.localised_name  = nil
    end
    local has_stone = false
    for _, product in pairs(fragment.products) do
      if product.name == "stone" then has_stone = true end
      local prod = {type = product.type, name = product.name}
      if product.amount * 10 >= 1 then
        prod.amount = product.amount * 10
      else
        prod.amount = nil
        prod.probability = product.amount * 10
        prod.amount_min = 1
        prod.amount_max = 1
      end
      table.insert(recipe_products, prod)
    end
    if not has_stone then
      table.insert(recipe_products, {name = "stone", amount = 1})
    end
    local recipe = {
      type = "recipe",
      name = fragment.name,
      icon_size = 32,
      icons = item.icons,
      subgroup = "core-fragments",
      category = "core-fragment-processing",
      order = "a"..c,
      flags = {
        "goes-to-main-inventory"
      },
      ingredients = {{name = item.name, amount = 20}},
      results = recipe_products,
      allow_as_intermediate = false, -- prevent being sown as a base resource?
      energy_required = 20,
      enabled = false,
      localised_name = {"recipe-name.core-fragment", {fragment.item_name}}
    }
    if _ == omni_name then
      recipe.localised_name  = nil
    end
    local core_resource_patch = {
      type = "resource",
      name = fragment.name,
      category = data_util.mod_prefix.."core-mining",
      collision_box = { { -1.4, -1.4  }, { 1.4, 1.4 } },
      flags = { "placeable-neutral" },
      highlight = false,
      icon_size = 32,
      icons = item.icons,
      infinite = true,
      infinite_depletion_amount = 0,
      map_color = { b = 0, g = 0, r = 0, a = 0 },
      map_grid = false,
      minable = {
        mining_time = 12.5,
        results = {
          {
            amount_max = 1,
            amount_min = 1,
            name = fragment.name,
            probability = 1,
          }
        }
      },
      minimum = 1,
      normal = 1000000,
      order = "a-b-a",
      resource_patch_search_radius = 0,
      selection_box = {
        { -0.0, -0.0 },
        { 0.0, 0.0 }
      },
      stage_counts = { 0 },
      stages = { sheet = resource_image },
      localised_name = "core-fissure"
    }
    data:extend({
      core_resource_patch,
      item,
      recipe
    })
    table.insert(
      data.raw.technology[data_util.mod_prefix .. "core-miner"].effects,
      {
        type = "unlock-recipe",
        recipe = recipe.name,
      }
    )
    data_util.allow_productivity(fragment.name)
end
