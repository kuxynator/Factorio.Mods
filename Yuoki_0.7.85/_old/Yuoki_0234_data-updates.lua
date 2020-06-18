-- Add the following recipes to productivity modules limitation table.
for index, value in pairs(data.raw.module) do
	if value.name:find("productivity%-module") and value.limitation then
		table.insert(value.limitation, "y_coal2liquid")
		table.insert(value.limitation, "y_ft_recipe")
		table.insert(value.limitation, "y_rawsyngas1_recipe")
		table.insert(value.limitation, "y_rawsyngas2_recipe")
		table.insert(value.limitation, "y_refinehydrogen_recipe")
	end
	if value.name:find("y%-pink%-module%-") and value.limitation then
		table.insert(value.limitation, "y_coal2liquid")
		table.insert(value.limitation, "y_ft_recipe")
		table.insert(value.limitation, "y_rawsyngas1_recipe")
		table.insert(value.limitation, "y_rawsyngas2_recipe")
		table.insert(value.limitation, "y_refinehydrogen_recipe")
	end
end

-- Tweaking item-sub-group order of group yuoki_liquids
data.raw["item-subgroup"]["y-fluid-storage"].order="1"
data.raw["item-subgroup"]["y-pipe"].order="2"
data.raw["item-subgroup"]["y_refine_machinery"].order="3"
data.raw["item-subgroup"]["y_refine_material"].order="5"
data.raw["item-subgroup"]["y_refine_raws"].order="6"
data.raw["item-subgroup"]["y-fluid"].order="7"

-- Tweaking the order of the following recipes
data.raw.recipe["y-sulfuric-acid-recipe"].order = "a"
data.raw.recipe["y-water-gen-fluid-recipe"].order = "b"
data.raw.recipe["y_granulate_wood_recipe"].order = "3"
