require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "arrakis",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 19,
            orientation = 0.7,
            -- distance = 12,
            -- orientation = 0.7,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_19.png",
                size = 4096,
            },
        }
    }
})

deleteRoute("nauvis-arrakis")

routes = {
    {
        type = "space-connection",
        name = "arrakis-to-jarbid",
        localised_name = "Arrakis to Jarbid system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "arrakis",
        to = "sye-jarbid",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
}
if mods["planet-hexalith"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "arrakis-to-hexalith",
        localised_name = "Arrakis to Hexalith",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "arrakis",
        to = "hexalith",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
end

if mods["naufulglebunusilo"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "arrakis-to-naufulglebunusilo",
        localised_name = "Arrakis to Naufulglebunusilo",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "arrakis",
        to = "naufulglebunusilo",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
end

if mods["planet-mickora"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "arrakis-to-mickora",
        localised_name = "Arrakis to Mickora",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "arrakis",
        to = "mickora",
        order = "h",
        length = 20000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
end

if mods["maraxsis"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "arrakis-to-hexalith",
        localised_name = "Arrakis to Maraxsis",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "arrakis",
        to = "maraxsis",
        order = "h",
        length = 20000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
else
    routes[#routes + 1] = {
        type = "space-connection",
        name = "arrakis-to-system-edge",
        localised_name = "Arrakis to Solar system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "arrakis",
        to = "solar-system-edge",
        order = "h",
        length = 60000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
    }
end

data:extend(routes)
