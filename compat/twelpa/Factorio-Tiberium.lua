require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "tiber",
        orbit = {
            parent = {
                type = "space-location",
                name = "twelpa",
            },
            distance = 15,
            orientation = 0.125,
            --    distance = 15,
            --    orientation = 0.375,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_15.png",
                size = 2048,
            },
        }
    }
})

local tiber_asteroid = data.raw["space-connection"]["tiber-fulgora"].asteroid_spawn_definitions

deleteRoute("tiber-fulgora")
deleteRoute("tiber-nauvis")
deleteRoute("tiber-vulcanus")

routes = {}
any_edge = false

if mods["planet-froodara"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tiber-to-froodara",
        localised_name = "Tiber to Froodara",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tiber",
        to = "froodara",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = tiber_asteroid
    }
    any_edge = true
elseif mods["cubium"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tiber-to-cubium",
        localised_name = "Tiber to Cubium",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tiber",
        to = "cubium",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = tiber_asteroid
    }
    any_edge = true
end

if mods["planet-akularis"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tiber-to-akularis",
        localised_name = "Tiber to Akularis",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tiber",
        to = "akularis",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = tiber_asteroid
    }
end

if mods["janus"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tiber-to-janus",
        localised_name = "Tiber to Janus",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tiber",
        to = "janus",
        order = "h",
        length = 10000,
        asteroid_spawn_definitions = tiber_asteroid
    }
end

if mods["planet-vicrox"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tiber-to-vicrox",
        localised_name = "Tiber to Vicrox",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tiber",
        to = "vicrox",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = tiber_asteroid
    }
end

if mods["planet-nekohaven"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tiber-to-nekohaven",
        localised_name = "Tiber to Nekohaven",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tiber",
        to = "nekohaven",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = tiber_asteroid
    }
end

if not any_edge then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tiber-to-twelpa",
        localised_name = "Tiber to Twelpa system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tiber",
        to = "sye-twelpa",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = tiber_asteroid
    }
end

data:extend(routes)
