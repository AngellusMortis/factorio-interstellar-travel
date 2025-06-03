require "util"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "hexalith",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 17,
            orientation = 0.42,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_17.png",
                size = 4096,
            },
        }
    }
})

deleteRoute("nauvis-hexalith")

local routes = {
    {
        type = "space-connection",
        name = "jarbid-to-hexalith",
        localised_name = "Jarbid system edge to Hexalith",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "sye-jarbid",
        to = "hexalith",
        order = "h",
        length = 50000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    },
    {
        type = "space-connection",
        name = "hexalith-to-system-edge",
        localised_name = "Ithurice system edge to Solar system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "hexalith",
        to = "solar-system-edge",
        order = "h",
        length = 80000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
    }
}

if mods["planet-ithurice"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "hexalith-to-ithurice",
        localised_name = "Hexalith system edge to Ithurice",
        subgroup = "planet-connections",
        icon = "__planet-ithurice__/graphics/planet-ithurice.png",
        from = "hexalith",
        to = "ithurice",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
else
    routes[#routes + 1] = {
        type = "space-connection",
        name = "hexalith-to-aquilo",
        localised_name = "Hexalith system edge to Aquilo",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/aquilo.png",
        from = "hexalith",
        to = "aquilo",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
end

data:extend(routes)
