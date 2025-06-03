require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "tenebris",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 45,
            orientation = 0.55,
            -- distance = 35,
            -- orientation = 0.450,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_45.png",
                size = 4096,
            },
        }
    }
})

deleteRoute("fulgora-tenebris")

routes = {}
any_edge = false

if mods["naufulglebunusilo"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tenebris-to-naufulglebunusilo",
        localised_name = "Tenebris to Naufulglebunusilo",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "tenebris",
        to = "naufulglebunusilo",
        order = "h",
        length = 20000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
    any_edge = true
end

if not any_edge then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tenebris-to-aquilo",
        localised_name = "Tenebris to Aquilo",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "tenebris",
        to = "aquilo",
        order = "h",
        length = 120000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
end

data:extend(routes)
