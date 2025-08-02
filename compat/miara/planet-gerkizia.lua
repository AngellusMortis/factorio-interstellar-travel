require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "gerkizia",
    orbit = {
        parent = {
            type = "space-location",
            name = "miara",
        },
        distance = 18,
        orientation = 0.59,
        -- distance = 18,
        -- orientation = 0.34
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_18.png",
            size = 2048,
        },
    },
})

deleteRoute("nauvis-gerkizia")

routes = {}
any_edge = false
if mods["erm_toss"] then
    -- route defined in erm_toss compat file
    any_edge = true
elseif mods["planet-zzhora"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "gerkizia-to-rubia",
        localised_name = "Gerkizia to Zzhora",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "gerkizia",
        to = "zzhora",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
elseif mods["Igrys"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "gerkizia-to-igrys",
        localised_name = "Gerkizia to Igrys",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "gerkizia",
        to = "igrys",
        order = "h",
        length = 40000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
    }
    any_edge = true
end

if mods["planet-quadromire"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "gerkizia-to-quadromire",
        localised_name = "Gerkizia to Quadromire",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "gerkizia",
        to = "quadromire",
        order = "h",
        length = 10000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
    }
end
if mods["rubia"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "gerkizia-to-rubia",
        localised_name = "Gerkizia to Rubia",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "gerkizia",
        to = "rubia",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
end
if mods["planet-tchekor"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "gerkizia-to-tchekor",
        localised_name = "Gerkizia to Tchekor",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "gerkizia",
        to = "tchekor",
        order = "h",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
    any_edge = true
end

if not any_edge then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "gerkizia-to-miara",
        localised_name = "Gerkizia to Miara system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "gerkizia",
        to = "sye-miara",
        order = "h",
        length = 50000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
end

data:extend(routes)
