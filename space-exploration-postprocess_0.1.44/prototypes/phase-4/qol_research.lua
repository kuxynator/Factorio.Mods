local data_util = require("data_util")

--------------------------------------------------------------------------------
-- Quality of Life research
--
-- Because they have a rather long research chain, crafting and mining speed have
-- the space science requirement already in the first levels by mistake
-- These technologies are divided into 9 levels each, of which the first 5 are
-- enabled by default:
-- * Basic (red science)
-- * Intermediate (red + green science)
-- * Advanced (red + green + blue science)
-- * Expert (red + green + blue + purple science
-- * Insane (infinite; all but military science)
-- The QOL research mod is freely configurable, which makes handling
-- the research here a bit more complicated.
--
-- There are two ways to deal with this:
-- a) Either remove the space science pack from all researches up to level 3 or
-- b) Remove it from all that have no more requirements than the first 3 packs
--
-- Version b) would allow for free configuration, whereas
-- a) assumes that level 3 is acceptable without space-science-pack
-- (although without modifying "qol_research/config.lua", we assume this to be the default

if mods["qol_research"] then
	local remove_packs = {
		"space-science-pack",
	}

	local max_unrestricted_level = 3
	local tech_prefixes = {
		"qol-crafting-speed",
		"qol-mining-speed",
	}
	local unrestricted_techs = {}
	for _, prefix in pairs(tech_prefixes) do
		for l = 1,max_unrestricted_level do
			table.insert(unrestricted_techs, prefix .. "-" .. l)
		end
	end

	for _, tech in pairs(data.raw.technology) do
		for _, prefix in pairs(unrestricted_techs) do
			if string.find(tech.name, prefix, 1, true) then
				data_util.tech_remove_ingredients(tech.name, remove_packs)
				data_util.tech_remove_prerequisites(tech.name, remove_packs)
			end
		end
	end
end
