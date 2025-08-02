require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

PlanetsLib:update({
    type = "planet",
    name = "cubium",
    orbit = {
        parent = {
            type = "space-location",
            name = "twelpa",
        },
        distance = 14,
        orientation = 0.85,
        -- distance = 15,
        -- orientation = 0.1,
        sprite = {
            type = "sprite",
            filename = "__interstellar-travel__/graphics/orbits/orbit_14.png",
            size = 2048,
        },
    },
})

deleteRoute("vulcanus-cubium")
deleteRoute("gleba-cubium")

routes = {
    {
        type = "space-connection",
        name = "cubium-to-twelpa",
        localised_name = "Cubium to Twelpa system edge",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "cubium",
        to = "sye-twelpa",
        order = "h",
        length = 22500,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
}
if mods["planet-nekohaven"] then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "cubium-to-nekohaven",
        localised_name = "Cubium to Nekohaven",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        subgroup = "planet-connections",
        from = "cubium",
        to = "nekohaven",
        order = "h",
        length = 15000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
end

data:extend(routes)
