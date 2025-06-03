require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "corrundum",
        orbit = {
            parent = {
                type = "space-location",
                name = "miara",
            },
            distance = 22,
            orientation = 0.45,
            -- distance = 20,
            -- orientation = 0.0,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_22.png",
                size = 2048,
            },
        }
    }
})

deleteRoute("vulcanus-corrundum")
deleteRoute("gleba-corrundum")
deleteRoute("aquilo-corrundum")
deleteRoute("nauvis-corrundum")

-- route defined in castra compat file
if not mods["castra"] then
    data:extend({
        {
            type = "space-connection",
            name = "corrundum-to-miara",
            localised_name = "Corrundum to Miara system edge",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            subgroup = "planet-connections",
            from = "corrundum",
            to = "sye-miara",
            order = "h",
            length = 30000,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
        }
    })
end
