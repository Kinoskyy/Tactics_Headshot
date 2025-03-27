local function processHeadshot(player, attacker, weapon, loss)
    if not isElement(player) or not isElement(attacker) then return end
    
    setPedHeadless(player, true)
    killPed(player, attacker, weapon, 9)
    triggerEvent("onPlayerHeadshot", player, attacker, weapon, loss)
    
    setTimer(function()
        if isElement(player) then
            setPedHeadless(player, false)
        end
    end, 900, 1)
end

local function showHeadshotMessage(killer, weapon, bodypart)
    if bodypart ~= 9 then return end
    
    cancelEvent()
    local r1,g1,b1 = getTeamColor(getPlayerTeam(source))
    local r2,g2,b2 = getTeamColor(getPlayerTeam(killer))
    
    exports.killmessages:outputMessage({
        getPlayerName(killer),
        {"padding",width=3},
        {"icon",id=weapon},
        {"padding",width=3},
        {"icon",id=256},
        {"padding",width=3},
        {"color",r=r1,g=g1,b=b1},
        getPlayerName(source)
    }, root, r2,g2,b2)
end

addEventHandler("onPlayerKillMessage", root, showHeadshotMessage)
addEvent("onServerHeadshot", true)
addEventHandler("onServerHeadshot", root, processHeadshot)
