require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "castra",
        orbit = {
            parent = {
                type = "space-location",
                name = "miara",
            },
            distance = 21,
            orientation = 0.4,
            -- distance = 21,
            -- orientation = 0.05,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_21.png",
                size = 2048,
            },
        }
    }
})

local vulcanus_castra = data.raw["space-connection"]["vulcanus-castra"].asteroid_spawn_definitions
local gleba_castra = data.raw["space-connection"]["gleba-castra"].asteroid_spawn_definitions

deleteRoute("vulcanus-castra")
deleteRoute("gleba-castra")

routes = {
    {
        type = "space-connection",
        name = "castra-to-miara",
        localised_name = "Castra to Miara system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "castra",
        to = "sye-miara",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = gleba_castra
    }
}
if mods["corrundum"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "corrundum-to-castra",
        localised_name = "Corrundum to Castra",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "corrundum",
        to = "castra",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = vulcanus_castra
    }
end
if mods["planet-zzhora"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "castra-to-zzhora",
        localised_name = "Castra to Zzhora",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "castra",
        to = "zzhora",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = gleba_castra
    }
end
data:extend(routes)
