require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "akularis",
    orbit = {
        parent = {
            type = "space-location",
            name = "twelpa",
        },
        distance = 7,
        orientation = 0.15,
        -- distance = 14,
        -- orientation = 0.35
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_7.png",
            size = 2048,
        },
    },
})

deleteRoute("nauvis-akularis")
deleteRoute("vulcanus-akularis")

routes = {}
any_edge = false

if mods["planet-froodara"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "akularis-to-froodara",
        localised_name = "Akularis to Froodara",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "akularis",
        to = "froodara",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
    any_edge = true
elseif mods["planet-nekohaven"] or mods["cubium"] then
    if mods["planet-nekohaven"] then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "akularis-to-nekohaven",
            localised_name = "Akularis to Nekohaven",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            subgroup = "planet-connections",
            from = "akularis",
            to = "nekohaven",
            order = "h",
            length = 22500,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
        }
    end

    if mods["cubium"] then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "akularis-to-cubium",
            localised_name = "Akularis to Cubium",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            subgroup = "planet-connections",
            from = "akularis",
            to = "cubium",
            order = "h",
            length = 22500,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
        }
    end
    any_edge = true
end

if not any_edge then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "akularis-to-twelpa",
        localised_name = "Akularis to Twelpa system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "akularis",
        to = "sye-twelpa",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
end

data:extend(routes)
