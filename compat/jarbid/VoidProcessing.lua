require "util"

PlanetsLib:update({
    {
        type = "space-location",
        name = "black-hole-approach",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 60,
            orientation = 0.52,
        },
        redrawn_connections_exclude = true,
    },
    {
        type = "space-location",
        name = "black-hole",
        orbit = {
            parent = {
                type = "space-location",
                name = "jarbid",
            },
            distance = 60,
            orientation = 0.53,
        },
        redrawn_connections_exclude = true,
    }
})
