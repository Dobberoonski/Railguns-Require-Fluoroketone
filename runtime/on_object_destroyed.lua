script.on_event(defines.events.on_object_destroyed, function(event)
    local key = event.registration_number
    storage.fluoroAssemblers[key].destroy()
    storage.fluoroAssemblers[key] = nil
end)