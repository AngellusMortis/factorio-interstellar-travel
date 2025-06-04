require "prototypes.systems"
require "util"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local miara = shouldAddMiara()
local twelpa = shouldAddTwelpa()

-- remove routes Nauvis system -> Jarbid route and routes to Senestella Stargate
deleteRoute("nauvis-to-jarbid")
deleteRoute("miara-to-twelpa")
deleteRoute("gate-senestella-nauvis")
deleteRoute("gate-senestella-fulgora")

-- move redstar away from Nauvis/Miara/Twelpa/Jarbid
PlanetsLib:update({
    {
        type = "space-location",
        name = "redstar",
        orbit = {
            parent = {
                type = "space-location",
                name = "star",
            },
            distance = 150,
            orientation = 0.35,
        },
        redrawn_connections_exclude = true,
    }
})

-- reset all of the planets locations to fix orbits
PlanetsLib:update({
    {
        type = "space-location",
        name = "calidus-senestella-gate-senestella",
        orbit = {
            parent = {
                type = "space-location",
                name = "redstar",
            },
            distance = 40,
            orientation = 0.89,

        },
        redrawn_connections_exclude = true,
    }
})
PlanetsLib:update({
    {
        type = "planet",
        name = "shipyard",
        orbit = {
            parent = {
                type = "space-location",
                name = "redstar",
            },
            distance = 31,  --164
            orientation = 0.88, --0.133
            sprite = {
                type = "sprite",
                filename = "__metal-and-stars-graphics-2__/graphics/starmap/orbits/orbit_mirandus.png",
                size = 4096,
            },
        }
    }
})
PlanetsLib:update({
    {
        type = "planet",
        name = "nix",
        orbit = {
            parent = {
                type = "space-location",
                name = "redstar",
            },
            distance = 38,  --164
            orientation = 0.8, --0.133
            sprite = {
                type = "sprite",
                filename = "__metal-and-stars-graphics-2__/graphics/starmap/orbits/orbit_nix.png",
                size = 4096,
            },
        }
    }
})
PlanetsLib:update({
    {
        type = "space-location",
        name = "mirandus-a",
        orbit = {
            parent = {
                type = "space-location",
                name = "redstar",
            },
            distance = 25,  --164
            orientation = 0.75, --0.133
            sprite = {
                type = "sprite",
                filename = "__metal-and-stars-graphics-2__/graphics/starmap/orbits/orbit_shipyard.png",
                size = 4096,
            },
        }
    }
})
PlanetsLib:update({
    {
        type = "planet",
        name = "ringworld",
        orbit = {
            parent = {
                type = "space-location",
                name = "redstar",
            },
            distance = 11,  --164
            orientation = 0.84, --0.133
        }
    }
})

local planet_shipyard_tech = "planet-discovery-shipyard"
-- if Dea Dia system exists,
-- move Senestella Stargate to Dea Dia system in the middle of Nauvis, Miara and Twelpa
if mods["dea-dia-system"] then
    techAddPrereq(planet_shipyard_tech, "system-discovery-dea-dia")

    PlanetsLib:update({
        {
            type = "space-location",
            name = "calidus-senestella-gate-calidus",
            orbit = {
                parent = {
                    type = "space-location",
                    name = "star-dea-dia",
                },
                distance = 4,
                orientation = 0.375
            },
            redrawn_connections_exclude = true,
        }
    })

    data:extend({
        {
            type = "space-connection",
            name = "dea-dia-to-senestella",
            localised_name = "Dea Dia system edge to Senestella Stargate",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "dea-dia-system-edge",
            to = "calidus-senestella-gate-calidus",
            order = "h",
            length = 1500,
            redrawn_connections_keep = true,
            redrawn_connections_rescale = true,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
        }
    })

-- else,
-- put Senestella Stargate in the middle of Nauvis, Miara and Twelpa
else
    -- unlock Nauvis system edge with unlocking shipyard if Miara and Twelpa do not exist
    if not miara and not twelpa then
        techAddEffect(planet_shipyard_tech, {
            type = "unlock-space-location",
            space_location = "sye-nauvis",
            use_icon_overlay_constant = false
        })
    -- otherwise, lock shipyard behind core system travel
    else
        techAddPrereq(planet_shipyard_tech, TECH_CORE)
    end

    local routes = {
        {
            type = "space-connection",
            name = "nauvis-to-senestella",
            localised_name = "Nauvis system edge to Senestella Stargate",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "sye-nauvis",
            to = "calidus-senestella-gate-calidus",
            order = "h",
            length = 20000,
            redrawn_connections_keep = true,
            redrawn_connections_rescale = false,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
        },
        {
            type = "space-connection",
            name = "senestella-to-jarbid",
            localised_name = "Senestella Stargate to Jarbid system edge",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "calidus-senestella-gate-calidus",
            to = "sye-jarbid",
            order = "h",
            length = 55000,
            redrawn_connections_keep = true,
            redrawn_connections_rescale = false,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
        }
    }

    if miara then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "miara-to-senestella",
            localised_name = "Miara system edge to Senestella Stargate",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "sye-miara",
            to = "calidus-senestella-gate-calidus",
            order = "h",
            length = 20000,
            redrawn_connections_keep = true,
            redrawn_connections_rescale = false,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
        }
    end

    if twelpa then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "twelpa-to-senestella",
            localised_name = "Twelpa system edge to Senestella Stargate",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "sye-twelpa",
            to = "calidus-senestella-gate-calidus",
            order = "h",
            length = 20000,
            redrawn_connections_keep = true,
            redrawn_connections_rescale = false,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
        }
    end

    data:extend(routes)

    -- move Senestella gate to center point between Nauvis/Miara/Twelpa/Jarbid
    PlanetsLib:update({
        {
            type = "space-location",
            name = "calidus-senestella-gate-calidus",
            orbit = {
                parent = {
                    type = "space-location",
                    name = "star",
                },
                distance = 35,
                orientation = 0.5,
            },
            redrawn_connections_exclude = true,
        }
    })
end
