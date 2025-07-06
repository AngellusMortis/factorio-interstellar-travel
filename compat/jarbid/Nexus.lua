require "util"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "nexus",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 45,
            orientation = 0.25,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_40.png",
                size = 4096,
            },
        }
    },
	{
        type = "space-location",
        name = "oort-cloud",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 75,
            orientation = 0.26,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_40.png",
                size = 4096,
            },
        },
		redrawn_connections_exclude = true,
    },
	{
        type = "space-location",
        name = "sol",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 110,
            orientation = 0.28,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_40.png",
                size = 4096,
            },
        },
		redrawn_connections_exclude = true,
    }
})


deleteRoute("fulgora-nexus")

local routes = {
    {
        type = "space-connection",
        name = "aquilo-to-nexus",
        localised_name = "Aquilo to Nexus",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "aquilo",
        to = "nexus",
        order = "b",
        length = 80000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
    }
}

if mods["secretas"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "nexus-to-secretas",
        localised_name = "Nexus to Secretas",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "nexus",
        to = "secretas",
        order = "b",
        length = 80000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
end
data:extend(routes)
