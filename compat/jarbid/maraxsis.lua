require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "maraxsis",
    orbit = {
        parent = {
            type = "space-location",
            name = "jarbid",
        },
        distance = 15,
        orientation = 0.515,
        -- distance = 15,
        -- orientation = 0.515,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_15.png",
            size = 4096,
        },
    },
})

deleteRoute("vulcanus-maraxsis")
deleteRoute("fulgora-maraxsis")
deleteRoute("maraxsis-tenebris")

routes = {
    {
        type = "space-connection",
        name = "maraxsis-to-system-edge",
        localised_name = "Maraxsis to Solar system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "maraxsis",
        to = "solar-system-edge",
        order = "h",
        length = 50000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
    }
}
if mods["planet-hexalith"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "maraxsis-to-hexalith",
        localised_name = "Maraxsis to Hexalith",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "maraxsis",
        to = "hexalith",
        order = "h",
        length = 20000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
else
    if mods["planet-mickora"] then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "maraxsis-to-mickora",
            localised_name = "Maraxsis to Mickora",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "maraxsis",
            to = "mickora",
            order = "h",
            length = 40000,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
        }
    end

    if mods["planet-ithurice"] then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "maraxsis-to-ithurice",
            localised_name = "Maraxsis to Ithurice",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "maraxsis",
            to = "ithurice",
            order = "h",
            length = 40000,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
        }
    else
        routes[#routes + 1] = {
            type = "space-connection",
            name = "maraxsis-to-aquilo",
            localised_name = "Maraxsis to Aquilo",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "maraxsis",
            to = "aquilo",
            order = "h",
            length = 50000,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
        }
    end
end

data:extend(routes)
