lib.versionCheck('ThatsJohnny/ox_repairkit')
lib.callback.register('removeRepairKit', function(source)
    local player = source
    local success = exports.ox_inventory:RemoveItem(player, Config.Item, 1)

    --if success then
    if result and result == 'success' then
        return true
    else
        return false
    end
end)
