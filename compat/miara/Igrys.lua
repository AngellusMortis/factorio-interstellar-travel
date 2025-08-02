require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "igrys",
    orbit = {
        parent = {
            type = "space-location",
            name = "miara",
        },
        distance = 12,
        orientation = 0.25,
        -- distance = 12,
        -- orientation = 0.8,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_12.png",
            size = 2048,
        },
    },
})

deleteRoute("vulcanus-to-igrys")
deleteRoute("gleba-to-igrys")

data:extend({
    {
        type = "space-connection",
        name = "igrys-to-miara",
        localised_name = "Igrys to Miara system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "igrys",
        to = "sye-miara",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
})
