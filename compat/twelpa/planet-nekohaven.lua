require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "nekohaven",
        orbit = {
            parent = {
                type = "space-location",
                name = "twelpa",
            },
            distance = 22,
            orientation = 0.9,
            -- distance = 22,
            -- orientation = 0.15
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_22.png",
                size = 2048,
            },
        }
    }
})

deleteRoute("gleba-nekohaven")

data:extend({
    {
        type = "space-connection",
        name = "nekohaven-to-twelpa",
        localised_name = "Nekohaven to Twelpa system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "nekohaven",
        to = "sye-twelpa",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
})
