function deleteRoute(name)
    if data.raw["space-connection"][name] then
        data.raw["space-connection"][name] = nil
    end
end

function techAddPrereq(tech_name, prereq)
    tech = data.raw["technology"][tech_name]
    if tech then
        tech.prerequisites[#(tech.prerequisites) + 1] = prereq
    end
end

function techAddEffect(tech_name, effect)
    tech = data.raw["technology"][tech_name]
    if tech then
        tech.effects[#(tech.effects) + 1] = effect
    end
end

-- manual map for locations to parent systems for ones that are missing from data
local systems = {
    star = {"sye-nauvis"},
    miara = {"sye-miara"},
    jarbid = {"sye-jarbid", "black-hole-approach", "black-hole", "secretas", "solar-system-edge", "shattered-planet"},
    twelpa = {"sye-twelpa"},
    redstar = {"calidus-senestella-gate-senestella", "mirandus-a", "nix", "shipyard"},
}
systems["star-dea-dia"] = {"calidus-senestella-gate-calidus", "dea-dia-system-edge"}

system_map = {}
for system, locations in pairs(systems) do
    for _, location in pairs(locations) do
        system_map[location] = system
    end
end
log(serpent.block(system_map))

function getStartSystem()
    start_planet = "nauvis"
    if mods["any-planet-start"] then
        start_planet = settings.startup["aps-planet"].value
    end

    if start_planet == "none" then
        start_planet = "nauvis"
        start_system = "star"
    else
        start_system = getSystemName(start_planet)
    end

    log("Start -> " .. tostring(start_planet) .. " (" .. start_system .. ")")

    return start_system
end

function getSystemName(planet_name)
    planet = data.raw["planet"][planet_name]

    system_name = nil
    group_name = "planets"
    if planet ~= nil then
        if planet.orbit ~= nil and planet.orbit.parent ~= nil then
            system_name = planet.orbit.parent.name
        end
        group_name = planet.subgroup
    end

    if system_name == nil then
        system_name = system_map[planet_name]
    end

    if planet_name:find("slp-solar-system-sun", 0, true) then
        system_name = getStartSystem()
    end

    if system_name == nil then
        log("Could not find system for planet " .. planet_name)
    end

    return system_name, group_name
end
