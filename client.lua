lib.locale()

local function hasRepairKit()
    local count = lib.callback.await('ox_inventory:getItemCount', false, Config.Item)
    return count > 0
end

local function playRepairAnimation()
    local ped = PlayerPedId()
    RequestAnimDict('mini@repair')

    while not HasAnimDictLoaded('mini@repair') do
        Wait(100)
    end

    TaskPlayAnim(ped, 'mini@repair', 'fixing_a_ped', 8.0, -8.0, -1, 1, 0, false, false, false)
end

exports.ox_target:addGlobalVehicle({
    {
        name = 'repair_vehicle',
        icon = 'fa-solid fa-wrench',
        label = locale('repair_label'),
        bones = { 'engine' },
        canInteract = function(entity, distance, data)
            return hasRepairKit()
        end,
        onSelect = function(data)
            local vehicle = data.entity

            local engineHealth = GetVehicleEngineHealth(vehicle)
            local bodyHealth = GetVehicleBodyHealth(vehicle)

            if engineHealth >= 1000.0 and bodyHealth >= 1000.0 then
                lib.notify({
                    title = locale('repair_label'),
                    description = locale('vehicle_already_fixed'),
                    type = 'inform',
                    icon = 'fa-solid fa-wrench',
                })
                return
            end

            if hasRepairKit() then
                SetVehicleDoorOpen(vehicle, 4, false, false)
                local success = lib.progressBar({
                    duration = Config.ProgressDuration,
                    label = locale('repair_start'),
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                        move = true,
                        combat = true
                    },
                    anim = {
                        dict = 'mini@repair',
                        clip = 'fixing_a_ped'
                    }
                })

                if not success then
                    SetVehicleDoorShut(vehicle, 4, false) 
                    lib.notify({
                        title = locale('repair_label'),
                        description = locale('repair_cancelled'),
                        type = 'error',
                        icon = 'fa-solid fa-ban',
                    })
                    return
                end

                SetVehicleEngineHealth(vehicle, 1000.0)
                SetVehicleBodyHealth(vehicle, 1000.0)
                SetVehicleFixed(vehicle)
                SetVehicleDoorShut(vehicle, 4, false)

                local success = lib.callback.await('removeRepairKit', false)
                if success then
                    lib.notify({
                        title = locale('repair_label'),
                        description = locale('repair_done'),
                        type = 'success',
                        icon = 'fa-solid fa-check',
                    })
                end
            end
        end
    }
})