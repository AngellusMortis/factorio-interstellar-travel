require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "ithurice",
    orbit = {
        parent = {
            type = "space-location",
            name = "jarbid",
        },
        distance = 32,
        orientation = 0.24,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_32.png",
            size = 4096,
        },
    },
})

deleteRoute("vulcanus-ithurice")

routes = {
    {
        type = "space-connection",
        name = "ithurice-to-aquilo",
        localised_name = "Ithurice to Aquilo",
        icon = "__space-age__/graphics/icons/aquilo.png",
        subgroup = "planet-connections",
        from = "ithurice",
        to = "aquilo",
        order = "h",
        length = 10000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
}

data:extend(routes)
