require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "janus",
    orbit = {
        parent = {
            type = "space-location",
            name = "twelpa",
        },
        distance = 17,
        orientation = 0.2,
        -- distance = 15,
        -- orientation = 0.4,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_17.png",
            size = 2048,
        },
    },
})

deleteRoute("janus-nauvis")
deleteRoute("janus-maraxsis")

routes = {}
any_edge = false
any_route = false

if mods["tenebris-prime"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "janus-to-tenebris",
        localised_name = "Janus to Tenebris",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "janus",
        to = "tenebris",
        order = "h",
        length = 20000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_route = true
end

if mods["Factorio-Tiberium"] then
    -- defined in Factorio-Tiberium compat file
    any_edge = true
elseif mods["planet-froodara"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "janus-to-froodara",
        localised_name = "Janus to Froodara",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "janus",
        to = "froodara",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
    any_route = true
elseif mods["cubium"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "janus-to-cubium",
        localised_name = "Janus to Cubium",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "janus",
        to = "cubium",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
    any_route = true
elseif mods["planet-akularis"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "janus-to-akularis",
        localised_name = "Janus to Akularis",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "janus",
        to = "akularis",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
    any_route = true
end

if mods["planet-vicrox"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "janus-to-vicrox",
        localised_name = "Janus to Vicrox",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "janus",
        to = "vicrox",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
    any_route = true
end

if not any_edge then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "janus-to-twelpa",
        localised_name = "Janus to Twelpa system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "janus",
        to = "sye-twelpa",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_route = true
end

if any_route then
    data:extend(routes)
end
