local function checkHeadshot(attacker, weapon, bodypart, loss)
    if bodypart ~= 9 or attacker ~= localPlayer then return end
    
    triggerServerEvent("onServerHeadshot", root, source, attacker, weapon, loss)
    setElementHealth(source, 0)
    setPedHeadless(source, true)
end

addEventHandler("onClientPlayerDamage", root, checkHeadshot)