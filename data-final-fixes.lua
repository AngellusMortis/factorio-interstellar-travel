require "util"
require "const"

-- per system blocked routes to prevent travel through a star
-- left/from planet must be alphabetically first
blocked = {
    akularis = {"char"},
    arrakis = {"tapatrion", "ithurice"},
    char = {"froodara"},
}

blocked_routes = {}
for from, locations in pairs(blocked) do
    from_table = {}
    for _, to in pairs(locations) do
        from_table[to] = true
    end
    blocked_routes[from] = from_table
end

-- edge locations that allow interstellar travel
edges = {"sye-nauvis", "sye-miara", "sye-jarbid", "sye-twelpa", "calidus-senestella-gate-senestella", "calidus-senestella-gate-calidus", "dea-dia-system-edge"}
edge_locations = {}
for _, location in pairs(edges) do
    edge_locations[location] = true
end

function removeBadRoutes()
    log("Checking for invalid cross-system connections...")
    -- delete any bad routes betweens systems
    count = 0
    for _, connection in pairs(data.raw["space-connection"]) do
        planets = {connection.from, connection.to}
        table.sort(planets)
        from_name = planets[1]
        to_name = planets[2]

        from = data.raw["planet"][from_name]
        to = data.raw["planet"][to_name]

        from_edge = edge_locations[from_name]
        from_system, from_group = getSystemName(from_name)

        to_edge = edge_locations[to_name]
        to_system, to_group = getSystemName(to_name)

        if (
            from_system ~= nil and
            to_system ~= nil and
            from_group ~= "satellites" and
            to_group ~= "satellites" and
            not (from_edge and to_edge) and
            from_system ~= to_system
        ) or blocked_routes[from_name] ~= nil and blocked_routes[from_name][to_name] then
            log(
                "Remove connection (" .. connection.name .. ") " ..
                from_name .. " (" .. tostring(from_system) .. ") -> " ..
                to_name .. " (" .. tostring(to_system) .. ")"
            )
            deleteRoute(connection.name)
            count = count + 1
        -- else
        --     log(
        --         "Debug connection (" .. connection.name .. ") " ..
        --         from_name .. " (" .. tostring(from_system) .. " | " .. tostring(from_group) .. " | " .. tostring(from_edge) .. ") -> " ..
        --         to_name .. " (" .. tostring(to_system) .. " | " .. tostring(to_group) .. " | " .. tostring(to_edge) .. ")"
        --     )
        end
    end

    if count > 0 then
        log("Removed " .. count .. " invalid interstellar connections")
    else
        log("Found no invalid interstellar connections")
    end
end

removeBadRoutes()
