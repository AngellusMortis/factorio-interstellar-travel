require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    {
        type = "planet",
        name = "zzhora",
        orbit = {
            parent = {
                type = "space-location",
                name = "miara",
            },
            distance = 14,
            orientation = 0.34,
            -- distance = 15,
            -- orientation = 0.22
            sprite = {
                type = "sprite",
                filename = "__interstellar-travel__/graphics/orbits/orbit_14.png",
                size = 2048,
            },
        }
    }
})

deleteRoute("nauvis-zzhora")

routes = {
    {
        type = "space-connection",
        name = "zzhora-to-miara",
        localised_name = "Zzhora to Miara system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "zzhora",
        to = "sye-miara",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
    }
}
if mods["Igrys"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "zzhora-to-igrys",
        localised_name = "Zzhora to Igrys",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "zzhora",
        to = "igrys",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
    }
    any_edge = true
end

data:extend(routes)
