local QBCore = exports["qb-core"]:GetCoreObject()

local streetactive = true

CreateThread(function()
    while true do 
        local player = PlayerPedId()
        local pc = GetEntityCoords(player)
        local street, street2 = GetStreetNameAtCoord(pc.x, pc.y, pc.z, Citizen.ResultAsInteger())
        SendNUIMessage({
            street = GetStreetNameFromHashKey(street),
            street2 = GetStreetNameFromHashKey(street2),
            active = streetactive,
        })
        Wait(500)
    end
end)
RegisterCommand('accalles', function()
    if (streetactive) then
        streetactive = false
        QBCore.Functions.Notify('Has desactivado el sistema de calles.')
    else 
        QBCore.Functions.Notify('Has activado el sistema de calles.')
        streetactive = true
    end
end)