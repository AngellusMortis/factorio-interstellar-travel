require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "rubia",
    orbit = {
        parent = {
            type = "space-location",
            name = "miara",
        },
        distance = 20,
        orientation = 0.5,
        -- distance = 15,
        -- orientation = 0.05,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_20.png",
            size = 2048,
        },
    },
})

deleteRoute("vulcanus-rubia")
deleteRoute("gleba-rubia")

routes = {}
any_edge = false

if mods["planet-zzhora"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "rubia-to-zzhora",
        localised_name = "Rubia to Zzhora",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "rubia",
        to = "zzhora",
        order = "h",
        length = 10000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
end
if mods["planet-tchekor"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "rubia-to-tchekor",
        localised_name = "Rubia to Tchekor",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "rubia",
        to = "tchekor",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
end
if mods["castra"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "rubia-to-castra",
        localised_name = "Rubia to Castra",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "rubia",
        to = "castra",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
end

if not any_edge then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "rubia-to-miara",
        localised_name = "Rubia to Miara system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "rubia",
        to = "sye-miara",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
end

data:extend(routes)
