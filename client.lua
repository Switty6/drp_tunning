local counter = 5 

local countdown = false

local timer = 0.00
local playerCar


RegisterCommand('tuner', function()
    playerCar = GetVehiclePedIsIn(PlayerPedId(), false)
    if playerCar and GetPedInVehicleSeat(playerCar, -1) == PlayerPedId() then
        print('lol')
        TriggerServerEvent('pidar')
    else
        TriggerServerEvent('pidaras', true)
    end
end)


RegisterCommand('of', function()
    SetNuiFocus(false, false)
end)




RegisterNetEvent('opentuner')
AddEventHandler('opentuner', function()


    SetNuiFocus(true, true)

    SendNUIMessage({
        type = 'show',
        bool = true
    })

    print('lol3')

end)

RegisterNUICallback('timerstart', function()
    local start = true
    
    SetNuiFocus(false, false)
    
    function setcountdown(x)
        time = GetGameTimer() + x * 1000
    end
    
    function getcountdown()
        return math.floor((time - GetGameTimer()) / 1000)
    end
    
    while start do
        Wait(1)
        
        
        local carSpeed = GetEntitySpeed(playerCar)
        local speed = math.ceil(carSpeed * 3.6)
        if speed >= 2.2 then
            timer = string.format('%.02f', timer + 0.029)
            SendNUIMessage({
                type = 'timer',
                timer = timer
            })
        end
        
        if speed >= 100 then
            timer = timer
            start = not start
            setcountdown(counter)
            TriggerEvent('count')
        end
    
    end


end)

RegisterNUICallback('exit', function()

        SetNuiFocus(false, false)
        SendNUIMessage({
            type = 'show',
            bool = false
        })

end)

RegisterNUICallback("stage", function(stage)
    local initial = 0
    local inertia = 0
    local frontBias = 0
    local driveFrontBias = 0
    local brakeForce = 0
    local stage = stage.stage


    if stage == 1 then
        stage = 0.02

    elseif stage == 2 then
        stage = 0.032
    
    elseif stage == 3 then
        stage = 0.04

    end


    initial = GetVehicleHandlingFloat(playerCar, "CHandlingData", "fInitialDriveForce")-- Boost
    inertia = GetVehicleHandlingFloat(playerCar, "CHandlingData", "fDriveInertia")-- Fuel Mix
    frontBias = GetVehicleHandlingFloat(playerCar, "CHandlingData", "fBrakeBiasFront")
    driveFrontBias = GetVehicleHandlingFloat(playerCar, "CHandlingData", "fDriveBiasFront")
    brakeForce = GetVehicleHandlingFloat(playerCar, "CHandlingData", "fBrakeForce")-- Brake Force
    
    local categ = GetVehicleClass(playerCar)
    print(categ)
    if categ == 0 then -- Compacts
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 1 then -- Sedans
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 2 then -- SUVS
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 3 then -- COUPES
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 4 then -- MUSCLE
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 5 then -- SPORT CLASSIC
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 6 then -- SPORTS
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 7 then -- SUPER
        initial = initial + stage * 1.23
        inertia = inertia + stage * 20
        brakeForce = brakeForce + stage * 2
    elseif categ == 8 then -- MOTORCYCLES
        initial = initial + 0.02
        inertia = inertia + stage
        brakeForce = brakeForce + stage * 2
    elseif categ == 9 then -- OFF ROAD
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 10 then -- INDUSTRIAL
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 11 then -- UTILITY
        initial = initial + 0.06
        inertia = inertia + 0.02
        brakeForce = brakeForce + stage * 2
    elseif categ == 12 then -- VANS
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 13 then -- Cycles
        print("nope")
    elseif categ == 14 then -- Boats
        print("nope")
    elseif categ == 15 then -- Helis
        print("nope")
    elseif categ == 16 then -- Planes
        print("nope")
    elseif categ == 17 then -- Service
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 18 then -- Emergency
        initial = initial + 0.01
        inertia = inertia + stage
        brakeForce = brakeForce + stage
    elseif categ == 19 then -- Military
        initial = initial + stage
        inertia = inertia + stage * 1.23
        brakeForce = brakeForce + stage * 2
    elseif categ == 20 then -- Commercial
        initial = initial + 0.07
        inertia = inertia + 0.03
        brakeForce = brakeForce + stage * 2
    end
    
    SetVehicleHandlingFloat(playerCar, "CHandlingData", "fInitialDriveForce", initial * 1.0)
    SetVehicleHandlingFloat(playerCar, "CHandlingData", "fDriveInertia", inertia * 1.0)
    SetVehicleEnginePowerMultiplier(playerCar, 10 * stage * 0.8)
    SetVehicleHandlingFloat(playerCar, "CHandlingData", "fBrakeBiasFront", frontBias * 1.0)
    SetVehicleHandlingFloat(playerCar, "CHandlingData", "fDriveBiasFront", driveFrontBias * 1.0)
    SetVehicleHandlingFloat(playerCar, "CHandlingData", "fBrakeForce", brakeForce * 1.0)


end)


RegisterNetEvent('count')
AddEventHandler('count', function()
        
        while getcountdown() > 0 do
            Wait(1)
        end
        if getcountdown() == 0 then
            timer = 0.00
            SetNuiFocus(true, true)
        end
end)
