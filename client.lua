local handOnHolster = false

local function LoadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

local function DisableFiringControls()
    DisableControlAction(0, 24, true)
    DisablePlayerFiring(PlayerId(), true)
    DisableControlAction(1, 37, true)
end

RegisterCommand("+handonholster", function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, true) then return end

    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    
    handOnHolster = true
    local dict, anim = "reaction@intimidation@cop@unarmed", "intro"

    LoadAnimDict(dict)
    TaskPlayAnim(ped, dict, anim, 5.0, 3.0, -1, 50, 2.0, 0, 0, 0)
    RemoveAnimDict(dict)

    if HudWeaponWheelGetSlotHash(0) ~= 0 then
        CreateThread(function()
            while handOnHolster do
                Wait(0)
                if IsControlJustPressed(0, 25) then
                    SetCurrentPedWeapon(ped, HudWeaponWheelGetSlotHash(0), true)
                    handOnHolster = false
                    ClearPedTasks(ped)
                end
            end
        end)
    end
end)

RegisterCommand("-handonholster", function()
    handOnHolster = false
    ClearPedTasks(PlayerPedId())
end)
RegisterKeyMapping("+handonholster", "Hand on gun holster", "KEYBOARD", "Z")

CreateThread(function()
    while true do
        Wait(0)
        if handOnHolster then
            DisableFiringControls()
        else
            Wait(100)
        end
    end
end)
