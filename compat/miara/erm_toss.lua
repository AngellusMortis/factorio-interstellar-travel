require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "aiur",
    orbit = {
        parent = {
            type = "space-location",
            name = "miara",
        },
        distance = 11,
        orientation = 0.48,
        -- distance = 20,
        -- orientation = 0.45,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_11.png",
            size = 2048,
        },
    },
})

local aiur_asteroids = data.raw["space-connection"]["nauvis-aiur"].asteroid_spawn_definitions

deleteRoute("nauvis-aiur")
deleteRoute("fulgora-aiur")

routes = {}
any_edge = false
if mods["planet-gerkizia"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "gerkizia-to-aiur",
        localised_name = "Gerkizia to Aiur",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "gerkizia",
        to = "aiur",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = aiur_asteroids
    }
end
if mods["Igrys"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "igrys-to-aiur",
        localised_name = "Igrys to Aiur",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "igrys",
        to = "aiur",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = aiur_asteroids
    }
    any_edge = true
end
if mods["planet-tchekor"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "gerkizia-to-aiur",
        localised_name = "Gerkizia to Aiur",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tchekor",
        to = "aiur",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = aiur_asteroids
    }
    any_edge = true
end

if not any_edge then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "miara-to-aiur",
        localised_name = "Aiur to Miara system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "aiur",
        to = "sye-miara",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = aiur_asteroids
    }
end

data:extend(routes)
