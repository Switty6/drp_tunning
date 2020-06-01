RegisterServerEvent('pidar')
AddEventHandler('pidar', function()
    local src = source
    local job = exports['drp_jobcore']:GetPlayerJob(src)
    
   if job.job == 'MECHANIC' then
      print('lol2')
      start = not start
      TriggerClientEvent('opentuner', src, start)
   else
      TriggerClientEvent("DRP_Core:Error", src, "Tuner Menu", tostring("Not your job"), 2500, true, "leftCenter")
    end
end)

RegisterServerEvent('pidaras')
AddEventHandler('pidaras', function(bolo)
   local src = source
   if bolo then 
      TriggerClientEvent("DRP_Core:Error", src, "Tuner Menu", tostring("You're not in a car."), 2500, true, "leftCenter")
   end

end)





--[[
   function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k, v in pairs(o) do
         if type(k) ~= 'number' then k = '"' .. k .. '"' end
         s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
--]]
