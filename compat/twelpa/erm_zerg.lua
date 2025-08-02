require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "char",
    orbit = {
        parent = {
            type = "space-location",
            name = "twelpa",
        },
        distance = 12,
        orientation = 0.65,
        -- distance = 12.5,
        -- orientation = 0.9,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_12.png",
            size = 2048,
        },
    },
})

local char_asteroid = data.raw["space-connection"]["vulcanus-char"].asteroid_spawn_definitions

deleteRoute("nauvis-char")
deleteRoute("vulcanus-char")

routes = {
    {
        type = "space-connection",
        name = "char-to-twelpa",
        localised_name = "Char to Twelpa system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "char",
        to = "sye-twelpa",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = char_asteroid
    }
}

if mods["cubium"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "char-to-cubium",
        localised_name = "Char to Cubium",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "char",
        to = "cubium",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = char_asteroid
    }
elseif mods["planet-nekohaven"] or mods["planet-froodara"] then
    if mods["planet-nekohaven"] then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "char-to-nekohaven",
            localised_name = "Char to Nekohaven",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            subgroup = "planet-connections",
            from = "char",
            to = "nekohaven",
            order = "h",
            length = 30000,
            asteroid_spawn_definitions = char_asteroid
        }
    end

    if mods["planet-froodara"] then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "char-to-froodara",
            localised_name = "Char to Froodara",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            subgroup = "planet-connections",
            from = "char",
            to = "froodara",
            order = "h",
            length = 30000,
            asteroid_spawn_definitions = char_asteroid
        }
    end
elseif mods["planet-akularis"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "char-to-akularis",
        localised_name = "Char to Akularis",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "char",
        to = "akularis",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = char_asteroid
    }
end

data:extend(routes)
