-- fix for nerve-roots-veins-dense -> cream-nerve-roots-veins-dense rename
decorative = data.raw["optimized-decorative"]

if decorative["cream-nerve-roots-veins-dense"] and not decorative["nerve-roots-veins-dense"] then
    decorative["nerve-roots-veins-dense"] = table.deepcopy(decorative["cream-nerve-roots-veins-dense"])
    decorative["nerve-roots-veins-dense"].name = "nerve-roots-veins-dense"
end

if decorative["cream-nerve-roots-veins-sparse"] and not decorative["nerve-roots-veins-sparse"] then
    decorative["nerve-roots-veins-sparse"] = table.deepcopy(decorative["cream-nerve-roots-veins-sparse"])
    decorative["nerve-roots-veins-sparse"].name = "nerve-roots-veins-sparse"
end

-- fix heat inserter being given the wrong prerequisite type (string instead of table of strings)
if mods["planet-tapatrion"] then
    data.raw["technology"]["heat-inserter"].prerequisites = {"heating-tower"}
end

-- fix incompatibility with Alien Biomes
if mods["alien-biomes"] then
    if mods["planet-akularis"] then
        data.raw["planet"]["akularis"].map_gen_settings.autoplace_settings["entity"] =  {
            settings = {
                ["iron-ore"] = {},
                ["copper-ore"] = {},
                ["stone"] = {},
                ["coal"] = {},
                ["crude-oil"] = {},
                ["fish"] = {},
            }
        }
    end

    if mods["planet-vicrox"] then
        data.raw["planet"]["vicrox"].map_gen_settings.autoplace_settings["decorative"] = {
            settings = {
                ["brown-hairy-grass"] = {},
                ["green-hairy-grass"] = {},
                ["brown-carpet-grass"] = {},
                ["green-carpet-grass"] = {},
                ["green-small-grass"] = {},
                ["green-asterisk"] = {},
                ["brown-asterisk-mini"] = {},
                ["green-asterisk-mini"] = {},
                ["brown-asterisk"] = {},
                ["red-asterisk"] = {},
                ["dark-mud-decal"] = {},
                ["light-mud-decal"] = {},
                ["cracked-mud-decal"] = {},
                ["green-pita"] = {},
                ["red-pita"] = {},
                ["green-croton"] = {},
                ["red-croton"] = {},
                ["green-pita-mini"] = {},
                ["brown-fluff"] = {},
                ["brown-fluff-dry"] = {},
                ["green-desert-bush"] = {},
                ["red-desert-bush"] = {},
                ["white-desert-bush"] = {},
                ["garballo-mini-dry"] = {},
                ["garballo"] = {},
                ["green-bush-mini"] = {},
                ["fulgoran-ruin-tiny"] = {},
                ["fulgoran-gravewort"] = {},
                ["urchin-cactus"] = {},
                ["medium-fulgora-rock"] = {},
                ["small-fulgora-rock"] = {},
                ["tiny-fulgora-rock"] = {},
            }
        }
    end
end
