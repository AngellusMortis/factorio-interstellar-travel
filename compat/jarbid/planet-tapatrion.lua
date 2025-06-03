require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "tapatrion",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 32,
            orientation = 0.22,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_32.png",
                size = 4096,
            },
        }
    }
})

deleteRoute("gleba-tapatrion")
deleteRoute("jarbid-to-aquilo")

routes = {
    {
        type = "space-connection",
        name = "jarbid-to-tapatrion",
        localised_name = "Jarbid system edge to Tapatrion",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "sye-jarbid",
        to = "tapatrion",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    },
    {
        type = "space-connection",
        name = "tapatrion-to-aquilo",
        localised_name = "Tapatrion to Aquilo",
        icon = "__space-age__/graphics/icons/aquilo.png",
        subgroup = "planet-connections",
        from = "tapatrion",
        to = "aquilo",
        order = "h",
        length = 10000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
}

if mods["planet-ithurice"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tapatrion-to-ithurice",
        localised_name = "Tapatrion to Ithurice",
        icon = "__space-age__/graphics/icons/aquilo.png",
        subgroup = "planet-connections",
        from = "tapatrion",
        to = "ithurice",
        order = "h",
        length = 10000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
end

data:extend(routes)
