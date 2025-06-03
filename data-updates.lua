require "util"
require "const"

-- vanilla + Nauvis compats
planet_mods = {
    "space-age",
    "terrapalus",
    "slp-dyson-sphere-reworked",
}

function moveDysonSphere(system_name)
    star = data.raw["space-location"]["star"]
    parent = data.raw["space-location"][system_name]
    scale = (parent.magnitude / star.magnitude)

    PlanetsLib:update({
        {
            type = "space-location",
            name = "slp-solar-system-sun",
            -- magnitude = parent.magnitude * 3/5,
            orbit = {
                parent = {
                    type = "space-location",
                    name = system_name,
                },
                distance = 6 * scale,
                orientation = 0.25,
                sprite = {
                    type = "sprite",
                    filename = "__interstellar-travel__/graphics/orbits/orbit_6.png",
                    size = 492,
                    scale = 0.25 * scale,
                },
            },
            draw_orbit = false,
        },
        {
            type = "space-location",
            name = "slp-solar-system-sun2",
            -- magnitude = parent.magnitude * 3/5,
            orbit = {
                parent = {
                    type = "space-location",
                    name = system_name,
                },
                distance = 4.5 * scale,
                orientation = 0.35,
                sprite = {
                    type = "sprite",
                    filename = "__interstellar-travel__/graphics/orbits/orbit_4.5.png",
                    size = 369,
                    scale = 0.25 * scale,
                },
            },
            draw_orbit = false,
        }
    })

    sun_asteroids = data.raw["space-connection"]["slp-nauvis-sun"].asteroid_spawn_definitions
    deleteRoute("slp-vulcanus-sun")
    deleteRoute("slp-nauvis-sun")

    routes = {}
    if system_name == "miara" then
        routes = {
            {
                type = "space-connection",
                name = "igrys-to-sun",
                localised_name = "Igrys to Sun",
                icon = "__space-age__/graphics/icons/solar-system-edge.png",
                subgroup = "planet-connections",
                from = "igrys",
                to = "slp-solar-system-sun",
                order = "h",
                length = 15000,
                asteroid_spawn_definitions = sun_asteroids
            },
            {
                type = "space-connection",
                name = "gerkizia-to-sun",
                localised_name = "Gerkizia to Sun",
                icon = "__space-age__/graphics/icons/solar-system-edge.png",
                subgroup = "planet-connections",
                from = "gerkizia",
                to = "slp-solar-system-sun",
                order = "h",
                length = 30000,
                asteroid_spawn_definitions = sun_asteroids
            }
        }
    elseif system_name == "twelpa" then
        routes = {
            {
                type = "space-connection",
                name = "akularis-to-sun",
                localised_name = "Akularis to Sun",
                icon = "__space-age__/graphics/icons/solar-system-edge.png",
                subgroup = "planet-connections",
                from = "akularis",
                to = "slp-solar-system-sun",
                order = "h",
                length = 15000,
                asteroid_spawn_definitions = sun_asteroids
            },
            {
                type = "space-connection",
                name = "char-to-sun",
                localised_name = "Char to Sun",
                icon = "__space-age__/graphics/icons/solar-system-edge.png",
                subgroup = "planet-connections",
                from = "char",
                to = "slp-solar-system-sun",
                order = "h",
                length = 30000,
                asteroid_spawn_definitions = sun_asteroids
            }
        }
    end
    data:extend(routes)
end

function fixTech()
    local utils = require("__any-planet-start__.utils")

    start_system = getStartSystem()
    techs = {
        star = TECH_CORE,
        miara = TECH_CORE,
        twelpa = TECH_CORE,
        jarbid = TECH_FRINGE,
    }
    if start_system == "star" then
        techs["star"] = nil
    elseif start_system == "miara" then
        techs["miara"] = nil
    elseif start_system == "twelpa" then
        techs["twelpa"] = nil
    elseif start_system == "jarbid" then
        techs["jarbid"] = nil
        techs["star"] = TECH_FRINGE
        techAddPrereq("planet-discovery-sunorbit", TECH_FRINGE)
    else
        log("Could not determine start system")
    end

    if start_system ~= "star" then
        -- prevent block/cycle in Electromagnetic Science
        -- caused by Wooden Fulgora
        utils.set_prerequisites("electromagnetic-plant", {"holmium-processing"})
    end

    if techs["star"] then
        log("Setting Nauvis techs to " .. tostring(techs["star"]))
        techAddPrereq("planet-discovery-nauvis", techs["star"])
        techAddPrereq("planet-discovery-vulcanus", techs["star"])
        techAddPrereq("planet-discovery-fulgora", techs["star"])
        techAddPrereq("planet-discovery-gleba", techs["star"])
        techAddPrereq("planet-discovery-moshine", techs["star"])
    end

    if techs["miara"] then
        log("Setting Miara techs to " .. tostring(techs["miara"]))
        techAddPrereq("planet-discovery-castra", techs["miara"])
        techAddPrereq("planet-discovery-corrundum", techs["miara"])
        techAddPrereq("planet-discovery-aiur", techs["miara"])
        techAddPrereq("planet-discovery-igrys", techs["miara"])
        techAddPrereq("planet-discovery-gerkizia", techs["miara"])
        techAddPrereq("planet-discovery-quadromire", techs["miara"])
        techAddPrereq("planet-discovery-tchekor", techs["miara"])
        techAddPrereq("planet-discovery-zzhora", techs["miara"])
        techAddPrereq("planet-discovery-rubia", techs["miara"])
    end

    if techs["twelpa"] then
        log("Setting Twelpa techs to " .. tostring(techs["twelpa"]))
        techAddPrereq("planet-discovery-cubium", techs["twelpa"])
        techAddPrereq("planet-discovery-char", techs["twelpa"])
        techAddPrereq("planet-discovery-tiber", techs["twelpa"])
        techAddPrereq("planet-discovery-janus", techs["twelpa"])
        techAddPrereq("planet-discovery-akularis", techs["twelpa"])
        techAddPrereq("planet-discovery-froodara", techs["twelpa"])
        techAddPrereq("planet-discovery-nekohaven", techs["twelpa"])
        techAddPrereq("planet-discovery-vicrox", techs["twelpa"])
        techAddPrereq("planet-discovery-tenebris", techs["twelpa"])
    end

    if techs["jarbid"] then
        log("Setting Jarbid techs to " .. tostring(techs["jarbid"]))
        techAddPrereq("planet-discovery-aquilo", techs["jarbid"])
        techAddPrereq("planet-discovery-maraxsis", techs["jarbid"])
        techAddPrereq("planet-discovery-arrakis", techs["jarbid"])
        techAddPrereq("planet-discovery-hexalith", techs["jarbid"])
        techAddPrereq("planet-discovery-ithurice", techs["jarbid"])
        techAddPrereq("planet-discovery-mickora", techs["jarbid"])
        techAddPrereq("planet-discovery-tapatrion", techs["jarbid"])
    end
end

function fixSatellites()
    start_planet = settings.startup["aps-planet"].value
    if start_planet == "none" then
        start_planet = "nauvis"
    end

    if mods["lignumis"] then
        local target_planet = settings.startup["lignumis-second-planet"].value or "nauvis"
        target_planet = settings.startup["aps-planet"].value ~= "none" and settings.startup["aps-planet"].value or target_planet

        PlanetsLib:update({
            {
                type = "planet",
                name = "lignumis",
                orbit = {
                    parent = {
                        type = "planet",
                        name = target_planet,
                    },
                    distance = 2,
                    orientation = 0.16,
                    sprite = {
                        type = "sprite",
                        filename = "__lignumis-assets__/graphics/orbit-lignumis.png",
                        size = 131
                    },
                },
            }
        })
    end

    if mods["planet-muluna"] then
        local nauvis = data.raw["planet"]["nauvis"]
        local o_parent_planet = data.raw["planet"][start_planet]

        PlanetsLib:update({
            {
                type = "planet",
                name = "muluna",
                orbit = {
                    orientation = 0.75,
                    distance = 1.6*(o_parent_planet.magnitude or 1)/(nauvis.magnitude),
                    parent = {
                        type = "planet",
                        name = start_planet,
                    },
                    sprite = {
                        type = "sprite",
                        filename = "__muluna-graphics__/graphics/orbits/orbit-muluna.png",
                        size = 412,
                        scale = 0.25*(o_parent_planet.magnitude or 1)/(nauvis.magnitude),
                    }
                },
            }
        })
    end
end

for _, v in pairs(planet_mods) do
    if mods[v] then
        require("compat." .. v)
    end
end

-- full system compats
if mods["dea-dia-system"] then
    require "compat.systems.dea-dia-system"
end

if mods["metal-and-stars"] then
    require "compat.systems.metal-and-stars"
end

for _, v in pairs(PLANET_MODS_MIARA) do
    if mods[v] then
        require("compat.miara." .. v)
    end
end

for _, v in pairs(PLANET_MODS_TWELPA) do
    if mods[v] then
        require("compat.twelpa." .. v)
    end
end

for _, v in pairs(PLANET_MODS_JARBID) do
    if mods[v] then
        require("compat.jarbid." .. v)
    end
end

-- makes other stars disappear at the moment
-- start_system = getStartSystem()
-- if start_system == "miara" or start_system == "twelpa" then
--     moveDysonSphere(start_system)
-- end


if mods["any-planet-start"] then
    fixTech()
    fixSatellites()
end
