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
                name = "twelpa",
            },
            distance = 25,
            orientation = 0.275,
            -- distance = 35,
            -- orientation = 0.450,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_25.png",
                size = 2048,
            },
        }
    }
})

deleteRoute("fulgora-tenebris")
deleteRoute("tenebris-solar-system-edge")

routes = {}
any_route = false
any_edge = false

if mods["janus"] then
    -- route defined by janus
    any_edge = true
elseif mods["Factorio-Tiberium"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tenebris-to-tiber",
        localised_name = "Tenebris to Tiber",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tenebris",
        to = "tiber",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
    any_route = true
elseif mods["planet-froodara"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tenebris-to-froodara",
        localised_name = "Tenebris to Froodara",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tenebris",
        to = "froodara",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
    any_route = true
elseif mods["cubium"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tenebris-to-cubium",
        localised_name = "Tenebris to Cubium",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tenebris",
        to = "cubium",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
    any_route = true
elseif mods["planet-akularis"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tenebris-to-akularis",
        localised_name = "Tenebris to Akularis",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tenebris",
        to = "akularis",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
    any_route = true
end

if mods["planet-vicrox"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tenebris-to-vicrox",
        localised_name = "Tenebris to Vicrox",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tenebris",
        to = "vicrox",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
    any_route = true
end

if not any_edge then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "tenebris-to-twelpa",
        localised_name = "Tenebris to Twelpa system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "tenebris",
        to = "sye-twelpa",
        order = "h",
        length = 50000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_route = true
end

if any_route then
    data:extend(routes)
end
