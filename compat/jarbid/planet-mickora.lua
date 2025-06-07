require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "mickora",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 20,
            orientation = 0.1,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_20.png",
                size = 4096,
            },
        }
    }
})

deleteRoute("fulgora-mickora")

routes = {
    {
        type = "space-connection",
        name = "jarbid-to-mickora",
        localised_name = "Jarbid system edge to Mickora",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "sye-jarbid",
        to = "mickora",
        order = "h",
        length = 25000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    },
}

if mods["planet-tapatrion"] then
    deleteRoute("jarbid-to-tapatrion")
    routes[#routes + 1] = {
        type = "space-connection",
        name = "mickora-to-tapatrion",
        localised_name = "Mickora to Tapatrion",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "mickora",
        to = "tapatrion",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
else
    deleteRoute("jarbid-to-aquilo")
    routes[#routes + 1] = {
        type = "space-connection",
        name = "mickora-to-aquilo",
        localised_name = "Mickora to Aquilo",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "mickora",
        to = "aquilo",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
end

if mods["planet-hexalith"] then
    deleteRoute("jarbid-to-hexalith")
    routes[#routes + 1] = {
        type = "space-connection",
        name = "mickora-to-hexalith",
        localised_name = "Mickora to Hexalith",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "mickora",
        to = "hexalith",
        order = "h",
        length = 20000,
        redrawn_connections_keep = true,
        redrawn_connections_rescale = true,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
end

data:extend(routes)
