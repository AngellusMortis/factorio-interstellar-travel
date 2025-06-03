require "prototypes.systems"
require "util"
require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local miara = shouldAddMiara()
local twelpa = shouldAddTwelpa()

deleteRoute("nauvis-to-jarbid")
deleteRoute("miara-to-twelpa")
deleteRoute("dea-dia-edge")

-- move Dea Dia away from Nauvis/Miara/Twelpa/Jarbid
PlanetsLib:update({
    {
        type = "space-location",
        name = "star-dea-dia",
        orbit = {
            parent = {
                type = "space-location",
                name = "star",
            },
            distance = 45,
            orientation = 0.5,
        },
        redrawn_connections_exclude = true,
    }
})

-- reset all of the planets locations to fix orbits
PlanetsLib:update({
    {
        type = "space-location",
        name = "dea-dia-system-edge",
        orbit = {
            parent = {
                type = "space-location",
                name = "star-dea-dia",
            },
            distance = 5,
            orientation = 0.5
        },
    }
})
PlanetsLib:update({
    {
        type = "planet",
        name = "planet-dea-dia",
        orbit = {
            parent = {
                type = "space-location",
                name = "star-dea-dia",
            },
            distance = 10,
            orientation = 0.2,
            sprite = {
                type = "sprite",
                filename = "__dea-dia-system__/graphics/orbits/orbit-dea-dia.png",
                size = 2563,
                scale = 0.25,
            }
        }
    }
})
PlanetsLib:update({
    {
        type = "planet",
        name = "lemures",
        orbit = {
            parent = {
                type = "space-location",
                name = "star-dea-dia",
            },
            distance = 5,
            orientation = 0.55,
            sprite = {
                type = "sprite",
                filename = "__dea-dia-system__/graphics/orbits/orbit-lemures.png",
                size = 1283,
                scale = 0.25,
            }
        }
    }
})
PlanetsLib:update({
    {
        type = "planet",
        name = "prosephina",
        orbit = {
            parent = {
                type = "space-location",
                name = "star-dea-dia",
            },
            distance = 6,
            orientation = -0.2,
            sprite = {
                type = "sprite",
                filename = "__dea-dia-system__/graphics/orbits/orbit-prosephina.png",
                size = 1539,
                scale = 0.25,
            }
        }
    }
})

local dea_dia_tech = "system-discovery-dea-dia"
-- unlock Nauvis system edge with unlocking shipyard if Miara and Twelpa do not exist
if not miara and not twelpa then
    techAddEffect(dea_dia_tech, {
        type = "unlock-space-location",
        space_location = "sye-nauvis",
        use_icon_overlay_constant = false
    })
-- otherwise, lock shipyard behind core system travel
else
    techAddPrereq(dea_dia_tech, TECH_CORE)
end

local routes = {
    {
        type = "space-connection",
        name = "nauvis-to-dea-dia",
        localised_name = "Nauvis system edge to Dea Dia system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "sye-nauvis",
        to = "dea-dia-system-edge",
        order = "h",
        length = 15000,
        redrawn_connections_keep = true,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    },
    {
        type = "space-connection",
        name = "dea-dia-to-jarbid",
        localised_name = "Dea Dia system edge to Jarbid system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "dea-dia-system-edge",
        to = "sye-jarbid",
        order = "h",
        length = 55000,
        redrawn_connections_keep = true,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    }
}

if miara then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "miara-to-dea-dia",
        localised_name = "Miara system edge to Dea Dia system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "sye-miara",
        to = "dea-dia-system-edge",
        order = "h",
        length = 15000,
        redrawn_connections_keep = true,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
end

if twelpa then
    routes[#routes + 1] = {
        type = "space-connection",
        name = "twelpa-to-dea-dia",
        localised_name = "Twelpa system edge to Dea Dia system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "sye-twelpa",
        to = "dea-dia-system-edge",
        order = "h",
        length = 15000,
        redrawn_connections_keep = true,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
end

data:extend(routes)
