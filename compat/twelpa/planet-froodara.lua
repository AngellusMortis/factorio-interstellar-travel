require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "froodara",
        orbit = {
            parent = {
                type = "space-location",
                name = "twelpa",
            },
            distance = 12,
            orientation = 0.01,
            -- distance = 12,
            -- orientation = 0.26
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_12.png",
                size = 2048,
            },
        }
    }
})

deleteRoute("nauvis-froodara")

routes = {}
any_edge = false

if mods["planet-nekohaven"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "froodara-to-nekohaven",
        localised_name = "Froodara to Nekohaven",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "froodara",
        to = "nekohaven",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
end

if mods["cubium"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "froodara-to-cubium",
        localised_name = "Froodara to Cubium",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "froodara",
        to = "cubium",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
    any_edge = true
end

if not any_edge then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "froodara-to-twelpa",
        localised_name = "Froodara to Twelpa system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "froodara",
        to = "sye-twelpa",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
end

data:extend(routes)
