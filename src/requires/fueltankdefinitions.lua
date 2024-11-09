local fueltanks = {
    -- Atmo XS
    ["34191163"] = 130,
    ["590217537"] = 170,
    ["590217536"] = 220,
    ["590217543"] = 290,

    -- Atmo S
    ["3510956948"] = 520,
    ["4068567109"] = 680,
    ["4068567110"] = 880,
    ["4068567111"] = 1140,

    -- Atmo M
    ["103319202"] = 2080,
    ["801882806"] = 2700,
    ["801882807"] = 3510,
    ["801882804"] = 4560,
    
    -- Atmo L
    ["681896062"] = 16640,
    ["4181605365"] = 21632,
    ["4181605362"] = 28120,
    ["4181605363"] = 36560,

    -- Rocket
    ["1663412227"] = 400,
    ["3126840739"] = 800,
    ["2477859329"] = 6400,
    ["4180073139"] = 50000,

    -- Space XS
    ["2723679405"] = 130,
    ["4270367994"] = 170,
    ["4270367989"] = 220,
    ["4270367988"] = 290,

    -- Space S
    ["3660622849"] = 520,
    ["3135113517"] = 680,
    ["3135113516"] = 880,
    ["3135113519"] = 1140,

    -- Space M
    ["2717114417"] = 2080,
    ["3797917193"] = 2700,
    ["3797917192"] = 3510,
    ["3797917195"] = 4560,
    
    -- Space L
    ["1567224122"] = 16640,
    ["1298642304"] = 21632,
    ["1298642305"] = 28120,
    ["1298642310"] = 36560,

    -- Default By size
    ["xs"] = 100,
    ["s"] = 400,
    ["m"] = 1600,
    ["l"] = 12800,
}

function GetFuelTankMaxVolume(itemId, size)
    return fueltanks[itemId .. ""] or fueltanks[size .. ""] or 0
end

function GetFuelTankPrefixes(fuelType)
    if fuelType == "atmo" then
        return {"Atmospheric ", "Uncommon Opt", "Advanced Opt", "Rare Optimiz", "Exotic Optim"}
    elseif fuelType == "space" then
        return {"Space Fuel T", "Uncommon Opt", "Advanced Opt", "Rare Optimiz", "Exotic Optim"}
    elseif fuelType == "rocket" then
        return {"Rocket Fuel "}
    end
    return {}
end