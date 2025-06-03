-- add extra connection from flipped Gleba to sun orbit

data:extend({
    {
        type = "space-connection",
        name = "sun-to-gleba",
        localised_name = "Gleba to sun orbit",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "gleba",
        to = "slp-solar-system-sun",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = data.raw["space-connection"]["slp-vulcanus-sun"].asteroid_spawn_definitions
    }
})
