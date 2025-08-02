require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "tchekor",
    orbit = {
        parent = {
            type = "space-location",
            name = "miara",
        },
        distance = 15,
        orientation = 0.47,
        -- distance = 14,
        -- orientation = 0.09,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_15.png",
            size = 2048,
        },
    },
})

deleteRoute("vulcanus-tchekor")

routes = {}
if mods["planet-zzhora"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "zzhora-to-tchekor",
        localised_name = "Zzhora to Tchekor",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "zzhora",
        to = "tchekor",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus),
    }
else
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tchekor-to-miara",
        localised_name = "Tchekor to Miara system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tchekor",
        to = "sye-miara",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_castra)
    }
end


data:extend(routes)
