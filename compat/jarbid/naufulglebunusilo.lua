require "util"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "naufulglebunusilo",
    orbit = {
        parent = {
            type = "space-location",
            name = "jarbid",
        },
        distance = 40,
        orientation = 0.7,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_40.png",
            size = 4096,
        },
    },
})


deleteRoute("fulgora-naufulglebunusilo")
deleteRoute("aquilo-naufulglebunusilo")

local routes = {
    {
        type = "space-connection",
        name = "jarbid-to-naufulglebunusilo",
        localised_name = "Jarbid system edge to Naufulglebunusilo",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "sye-jarbid",
        to = "naufulglebunusilo",
        order = "h",
        length = 75000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    },
    {
        type = "space-connection",
        name = "naufulglebunusilo-to-system-edge",
        localised_name = "Naufulglebunusilo to Solar system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "naufulglebunusilo",
        to = "solar-system-edge",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
    }
}

if mods["maraxsis"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "maraxsis-to-naufulglebunusilo",
        localised_name = "Maraxsis to Naufulglebunusilo",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "maraxsis",
        to = "naufulglebunusilo",
        order = "h",
        length = 50000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
elseif mods["planet-hexalith"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "hexalith-to-naufulglebunusilo",
        localised_name = "Naufulglebunusilo to Solar system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "hexalith",
        to = "naufulglebunusilo",
        order = "h",
        length = 50000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
end

data:extend(routes)
