require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "vicrox",
        orbit = {
            parent = {
                type = "space-location",
                name = "twelpa",
            },
            distance = 23,
            orientation = 0.99,
            -- distance = 23,
            -- orientation = 0.24,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_23.png",
                size = 2048,
            },
        }
    }
})

deleteRoute("vulcanus-vicrox")

routes = {}
if mods["planet-nekohaven"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "vicrox-to-nekohaven",
        localised_name = "Vicrox to Nekohaven",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "vicrox",
        to = "nekohaven",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
else
    routes[#routes + 1] = {
        type = "space-connection",
        name = "vicrox-to-twelpa",
        localised_name = "Vicrox to Twelpa system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "vicrox",
        to = "sye-twelpa",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
end

data:extend(routes)
