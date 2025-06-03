require "util"

PlanetsLib:update({
    {
        type = "space-location",
        name = "secretas",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 45,
            orientation = 0.43,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_45.png",
                size = 4096,
            },
        }
    },
    {
        type = "planet",
        name = "frozeta",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 44,
            orientation = 0.45,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_44.png",
                size = 4096,
            },
        },
        redrawn_connections_exclude = true,
    }
})

