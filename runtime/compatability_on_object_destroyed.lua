script.on_event(defines.events.on_object_destroyed, function(event)
    local key = event.registration_number
    if not storage.fluoroAssemblers[key] then return end--required if Maraxsis 1.30.49 installed.
    --see bug report: https://github.com/notnotmelon/maraxsis/issues/323
    --tl;dr Maraxsis will call this function whenever **any** entity is created. Lmfao.
    storage.fluoroAssemblers[key].destroy()
    storage.fluoroAssemblers[key] = nil
end)