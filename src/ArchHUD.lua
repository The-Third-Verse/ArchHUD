require 'src.slots'

local s=system
local c=core
local u=unit

local Nav = Navigator.new(s, c, u)
local atlas = require("atlas")

local globalDeclare=require("autoconf/custom/archhud/globals")
require("autoconf/custom/archhud/hudclass")
require("autoconf/custom/archhud/apclass")
require("autoconf/custom/archhud/radarclass")
require("autoconf/custom/archhud/controlclass")
require("autoconf/custom/archhud/atlasclass")
require("autoconf/custom/archhud/baseclass")
script = {}  -- wrappable container for all the code. Different than normal DU Lua in that things are not seperated out.

VERSION_NUMBER = 1.707


globalDeclare(s, c, u, s.getTime, math.floor, u.getAtmosphereDensity) -- Variables that need to be Global and are declared in globals.lua due to use across multple modules where there values can change.

--[[
function p(msg)
    s.print(time..": "..msg)
end
--]]

-- DU Events written for wrap and minimization. Written by Dimencia and Archaegeo. Optimization and Automation of scripting by ChronosWS  Linked sources where appropriate, most have been modified.
    function script.onStart()
        PROGRAM.onStart()
    end

    function script.onStop()
        PROGRAM.onStop()
    end

    function script.onTick(timerId)         -- Various tick timers
        if timerId == "tenthSecond" then -- Timer executed ever tenth of a second
            AP.TenthTick()
            HUD.TenthTick()
        elseif timerId == "oneSecond" then -- Timer for evaluation every 1 second
            PROGRAM.OneSecondTick()
        elseif timerId == "fiveSecond" then -- Timer executed every 5 seconds (SatNav only stuff for now)
            AP.SatNavTick()
        elseif timerId == "msgTick" then -- Timer executed whenever msgText is applied somwehere
            HUD.MsgTick()
        elseif timerId == "animateTick" then -- Timer for animation
            HUD.AnimateTick()
        elseif timerId == "hudTick" then -- Timer for all hud updates not called elsewhere
            HUD.hudtick()
        elseif timerId == "apTick" then -- Timer for all autopilot functions
            AP.APTick()
        elseif timerId == "radarTick" then
            RADAR.UpdateRadar()
        elseif timerId == "tagTick" then
            CONTROL.tagTick()
        elseif timerId == "contact" then
            RADAR.ContactTick()
        end
    end

    function script.onFlush()
        PROGRAM.onFlush()
    end

    function script.onUpdate()
        PROGRAM.onUpdate()
    end

    function script.onActionStart(action)
        PROGRAM.controlStart(action)
    end

    function script.onActionStop(action)
        PROGRAM.controlStop(action)
    end

    function script.onActionLoop(action)
        PROGRAM.controlLoop(action)
    end

    function script.onInputText(text)
        PROGRAM.controlInput(text)
    end

    function script.onEnter(id)
        PROGRAM.radarEnter(id)
    end

    function script.onLeave(id)
        PROGRAM.radarLeave(id)
    end

-- Execute Script
    PROGRAM = programClass(Nav, c, u, s, library, atlas, vBooster, hover, telemeter_1, antigrav, dbHud_1, dbHud_2, radar_1, radar_2, shield_1, gyro, warpdrive, weapon)
    script.onStart() 