require "const"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")


function shouldAddMiara()
    any_miara = false

    for _, v in pairs(PLANET_MODS_MIARA) do
        if mods[v] then
            any_miara = true
        end
    end

    return any_miara
end

function addMiara()
    --Adds Miara Star
    PlanetsLib:extend({
        {
            type = "space-location",
            name = "miara",
            starmap_icon = "__interstellar-travel__/graphics/icons/MiaraStar.png",
            starmap_icon_size = 670,
            orbit = {
                parent = {
                    type = "space-location",
                    name = "star",
                },
                distance = 55,
                orientation = 0.65,
            },
            sprite_only = true,
            magnitude = 11,
            redrawn_connections_exclude = true,
        },
    })

    PlanetsLib:extend({
        {
            type = "space-location",
            name = "sye-miara",
            localised_name = "Miara system edge",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            solar_power_in_space = 15,
            orbit = {
                parent = {
                    type = "space-location",
                    name = "miara",
                },
                distance = 25,
                orientation = 0.25,
                sprite = {
                    type = "sprite",
                    filename = "__interstellar-travel__/graphics/orbits/orbit_25.png",
                    size = 2048,
                },
            }
        }
    })

    data:extend({ {
        type = "space-connection",
        name = "nauvis-to-miara",
        localised_name = "Nauvis system edge to Miara system edge",
        subgroup = "planet-connections",
        icon = "__space-age__/graphics/icons/solar-system-edge.png",
        from = "sye-nauvis",
        to = "sye-miara",
        order = "h",
        length = 35000,
        redrawn_connections_keep = true,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    } })
end

function shouldAddTwelpa()
    any_twelpa = false

    for _, v in pairs(PLANET_MODS_TWELPA) do
        if mods[v] then
            any_twelpa = true
        end
    end

    return any_twelpa
end

function addTwelpa(miara)
    --Adds Twelpa Star
    PlanetsLib:extend({
        {
            type = "space-location",
            name = "twelpa",
            starmap_icon = "__interstellar-travel__/graphics/icons/TwelpaStar.png",
            starmap_icon_size = 670,
            orbit = {
                parent = {
                    type = "space-location",
                    name = "star",
                },
                distance = 55,
                orientation = 0.35,
            },
            sprite_only = true,
            magnitude = 13,
            redrawn_connections_exclude = true,
        },
    })

    PlanetsLib:extend({
        {
            type = "space-location",
            name = "sye-twelpa",
            localised_name = "Twelpa system edge",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            solar_power_in_space = 15,
            orbit = {
                parent = {
                    type = "space-location",
                    name = "twelpa",
                },
                distance = 25,
                orientation = 0.75,
                sprite = {
                    type = "sprite",
                    filename = "__interstellar-travel__/graphics/orbits/orbit_25.png",
                    size = 2048,
                },
            },
        }
    })

    routes = {
        {
            type = "space-connection",
            name = "nauvis-to-twelpa",
            localised_name = "Nauvis system edge to Twelpa system edge",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "sye-nauvis",
            to = "sye-twelpa",
            order = "h",
            length = 35000,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
        }
    }

    if miara then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "miara-to-twelpa",
            localised_name = "Miara system edge to Twelpa system edge",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "sye-miara",
            to = "sye-twelpa",
            order = "h",
            length = 35000,
            redrawn_connections_keep = true,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
        }
    end
    data:extend(routes)
end

function addJarbid(miara, twelpa)
    --Adds Jarbid Star
    PlanetsLib:extend({
        {
            type = "space-location",
            name = "jarbid",
            starmap_icon = "__interstellar-travel__/graphics/icons/JarbidStar.png",
            starmap_icon_size = 670,
            orbit = {
                parent = {
                    type = "space-location",
                    name = "star",
                },
                distance = 120,
                orientation = 0.5,
            },
            sprite_only = true,
            magnitude = 9,
            redrawn_connections_exclude = true,
        },
    })

    PlanetsLib:extend({
        {
            type = "space-location",
            name = "sye-jarbid",
            localised_name = "Jarbid Solar system edge",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            solar_power_in_space = 5,
            orbit = {
                parent = {
                    type = "space-location",
                    name = "jarbid",
                },
                distance = 50,
                orientation = 0.0,
                sprite = {
                    type = "sprite",
                    filename = "__interstellar-travel__/graphics/orbits/orbit_50.png",
                    size = 4096,
                },
            },
        }
    })

    routes = {
        {
            type = "space-connection",
            name = "nauvis-to-jarbid",
            localised_name = "Nauvis system edge to Jarbid system edge",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "sye-nauvis",
            to = "sye-jarbid",
            order = "h",
            length = 70000,
            redrawn_connections_keep = true,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
        }
    }

    if miara then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "miara-to-jarbid",
            localised_name = "Miara system edge to Jarbid system edge",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "sye-miara",
            to = "sye-jarbid",
            order = "h",
            length = 70000,
            redrawn_connections_keep = true,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
        }
    end

    if twelpa then
        routes[#routes + 1] = {
            type = "space-connection",
            name = "twelpa-to-jarbid",
            localised_name = "Twelpa system edge to Jarbid system edge",
            subgroup = "planet-connections",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            from = "sye-twelpa",
            to = "sye-jarbid",
            order = "h",
            length = 70000,
            redrawn_connections_keep = true,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
        }
    end
    data:extend(routes)
end

function addTech(miara, twelpa)
    tech = {}
    fringe_prerequisites = { "rocket-turret", "advanced-asteroid-processing", "asteroid-reprocessing",
        "electromagnetic-science-pack" }
        fringe_unlocks = {
        {
            type = "unlock-space-location",
            space_location = "sye-nauvis",
            use_icon_overlay_constant = false
        },
        {
            type = "unlock-space-location",
            space_location = "sye-jarbid",
            use_icon_overlay_constant = false
        }
    }

    if miara or twelpa then
        fringe_prerequisites = { TECH_CORE, "rocket-turret", "advanced-asteroid-processing", "asteroid-reprocessing",
            "electromagnetic-science-pack" }
        fringe_unlocks = {
            {
                type = "unlock-space-location",
                space_location = "sye-jarbid",
                use_icon_overlay_constant = false
            }
        }

        unlocks = {
            {
                type = "unlock-space-location",
                space_location = "sye-nauvis",
                use_icon_overlay_constant = false
            }
        }

        if miara then
            unlocks[#unlocks + 1] = {
                type = "unlock-space-location",
                space_location = "sye-miara",
                use_icon_overlay_constant = false
            }
        end

        if twelpa then
            unlocks[#unlocks + 1] = {
                type = "unlock-space-location",
                space_location = "sye-twelpa",
                use_icon_overlay_constant = false
            }
        end

        tech[#tech + 1] = {
            type = "technology",
            name = TECH_CORE,
            localised_name = "Core System Travel",
            icons = util.technology_icon_constant_planet("__interstellar-travel__/graphics/icons/ss_icon.png"),
            icon_size = 256,
            essential = true,
            effects = unlocks,
            prerequisites = { "space-science-pack", "space-platform-thruster" },
            unit = {
                count = 1000,
                ingredients = {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack",   1 },
                    { "chemical-science-pack",   1 },
                    { "production-science-pack", 1 },
                    { "utility-science-pack",    1 },
                    { "space-science-pack",      1 }
                },
                time = 60
            }
        }
    elseif mods["dea-dia-system"] then
        fringe_prerequisites = { "system-discovery-dea-dia", "rocket-turret", "advanced-asteroid-processing", "asteroid-reprocessing",
            "electromagnetic-science-pack" }
            fringe_unlocks = {
            {
                type = "unlock-space-location",
                space_location = "sye-jarbid",
                use_icon_overlay_constant = false
            }
        }
    elseif mods["metal-and-stars"] then
        fringe_prerequisites = { "planet-discovery-shipyard", "rocket-turret", "advanced-asteroid-processing", "asteroid-reprocessing",
            "electromagnetic-science-pack" }
            fringe_unlocks = {
            {
                type = "unlock-space-location",
                space_location = "sye-jarbid",
                use_icon_overlay_constant = false
            }
        }
    end

    tech[#tech + 1] = {
        type = "technology",
        name = TECH_FRINGE,
        localised_name = "Fringe System Travel",
        icons = util.technology_icon_constant_planet("__interstellar-travel__/graphics/icons/ss_icon.png"),
        icon_size = 256,
        essential = true,
        effects = fringe_unlocks,
        prerequisites = fringe_prerequisites,
        unit = {
            count = 4000,
            ingredients = {
                { "automation-science-pack",      1 },
                { "logistic-science-pack",        1 },
                { "chemical-science-pack",        1 },
                { "production-science-pack",      1 },
                { "utility-science-pack",         1 },
                { "space-science-pack",           1 },
                { "metallurgic-science-pack",     1 },
                { "agricultural-science-pack",    1 },
                { "electromagnetic-science-pack", 1 }
            },
            time = 60
        }
    }

    data:extend(tech)
end

function addSystems()
    --Adds a new location for interstellar travel in nauvis
    PlanetsLib:extend({
        {
            type = "space-location",
            name = "sye-nauvis",
            localised_name = "Nauvis system edge",
            icon = "__space-age__/graphics/icons/solar-system-edge.png",
            solar_power_in_space = 15,
            orbit = {
                parent = {
                    type = "space-location",
                    name = "star",
                },
                distance = 25,
                orientation = 0.5,
                sprite = {
                    type = "sprite",
                    filename = "__interstellar-travel__/graphics/orbits/orbit_25.png",
                    size = 2048,
                },
            },
        }
    })

    miara = shouldAddMiara()
    if miara then
        addMiara()
    end

    twelpa = shouldAddTwelpa()
    if twelpa then
        addTwelpa(miara)
    end

    addJarbid(miara, twelpa)
    addTech(miara, twelpa)
end
