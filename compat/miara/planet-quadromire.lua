require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "quadromire",
        orbit = {
            parent = {
                type = "space-location",
                name = "miara",
            },
            distance = 21,
            orientation = 0.56,
            -- distance = 21,
            -- orientation = 0.56,
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_21.png",
                size = 2048,
            },
        }
    }
})

deleteRoute("nauvis-quadromire")

routes = {}
if mods["rubia"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "quadromire-to-rubia",
        localised_name = "Quadromire to Rubia",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "quadromire",
        to = "rubia",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
elseif mods["corrundum"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "quadromire-to-corrundum",
        localised_name = "Quadromire to Corrundum",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "quadromire",
        to = "corrundum",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
    any_edge = true
elseif mods["castra"] then
    -- defined in Castra compat file
    any_edge = true
elseif mods["planet-tchekor"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "quadromire-to-tchekor",
        localised_name = "Quadromire to Tchekor",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "quadromire",
        to = "tchekor",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
    any_edge = true
elseif mods["planet-zzhora"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "quadromire-to-zzhora",
        localised_name = "Quadromire to Zzhora",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "quadromire",
        to = "zzhora",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
    any_edge = true
else
    routes[#routes + 1] = {
        type = "space-connection",
        name = "quadromire-to-miara",
        localised_name = "Quadromire to Miara",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "quadromire",
        to = "sye-miara",
        order = "h",
        length = 50000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
end

if #routes > 0 then
    data:extend(routes)
end
