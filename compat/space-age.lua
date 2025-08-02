require "util"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

-- flip gleba to be south of Nauvia/Fulgora instead of north
PlanetsLib:update({
    {
        type = "planet",
        name = "gleba",
        orbit = {
            parent = {
                type = "space-location",
                name = "star",
            },
            distance = 20,
            orientation = 0.45,
        }
    }
})

-- move Aquilo+ content to fringe system
PlanetsLib:update({
    type = "planet",
    name = "aquilo",
    orbit = {
        parent = {
            type = "space-location",
            name = "jarbid",
        },
        distance = 35,
        orientation = 0.225,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_35.png",
            size = 4096,
        },
    },
})

PlanetsLib:update({
    type = "space-location",
    name = "solar-system-edge",
    orbit = {
        parent = {
            type = "space-location",
            name = "jarbid",
        },
        distance = 50,
        orientation = 0.5,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_50.png",
            size = 4096,
        },
    },
})

PlanetsLib:update({
    type = "space-location",
    name = "shattered-planet",
    orbit = {
        parent = {
            type = "space-location",
            name = "jarbid",
        },
        distance = 80,
        orientation = 0.5
    },
})

deleteRoute("gleba-aquilo")
deleteRoute("fulgora-aquilo")

local routes = {
    {
        type = "space-connection",
        name = "gleba-to-system-edge",
        localised_name = "Gleba to Nauvis system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "gleba",
        to = "sye-nauvis",
        order = "h",
        length = 20000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
    },
    {
        type = "space-connection",
        name = "jarbid-to-aquilo",
        localised_name = "Jarbid system edge to Aquilo",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "sye-jarbid",
        to = "aquilo",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
}

data:extend(routes)
