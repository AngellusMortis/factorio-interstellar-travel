require "util"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "paracelsin",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 37,
            orientation = 0.4,
            -- distance = 40,
            -- orientation = 0.45,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_37.png",
                size = 4096,
            },
        }
    }
})

deleteRoute("fulgora-paracelsin")
deleteRoute("nauvis-paracelsin")
deleteRoute("aquilo-solar-system-edge")

routes = {
    {
        type = "space-connection",
        name = "paracelsin-to-system-edge",
        localised_name = "Paracelsin to Solar system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "paracelsin",
        to = "solar-system-edge",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
    },
    {
        type = "space-connection",
        name = "paracelsin-to-aquilo",
        localised_name = "Paracelsin to Aquilo",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "paracelsin",
        to = "aquilo",
        order = "h",
        length = 70000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
}
if mods["planet-hexalith"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "paracelsin-to-hexalith",
        localised_name = "Paracelsin to Hexalith",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "paracelsin",
        to = "hexalith",
        order = "h",
        length = 60000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
end
if mods["secretas"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "paracelsin-to-secretas",
        localised_name = "Paracelsin to Secretas",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "paracelsin",
        to = "secretas",
        order = "h",
        length = 20000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
end

data:extend(routes)
