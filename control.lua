--control.lua
script.on_init(function()
    --//
end)

script.on_event(defines.events.on_script_trigger_effect, function(event)
    if event.effect_id ~= "railgun-turret" then return end
    local key = script.register_on_object_destroyed(event.source_entity)

    --[[This shit doesn't work. I'm keeping it here for future reference.
    local ass3 = game.surfaces[event.surface_index].create_entity{
        name = "fluoro-assembling-machine-3",
        position = {event.source_position.x + 10, event.source_position.y},
        force = game.player.force
    }]]

    local ass3 = game.get_surface(event.surface_index).create_entity{
        name = "fluoro-assembling-machine-3",
        position = {event.source_entity.position.x, event.source_entity.position.y+1},
        force = event.source_entity.force
    }
end)

script.on_event(defines.events.on_object_destroyed, function(event)
    --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! incompatability with Maraxsis 1.30.49
    local key = event.registration_number
    game.print("railgun destroyed")
end)

--[[

>ass3 collision/selection box disabled, invincible, etc. Not interactable w/ player. Pipe connections visible, ass3 not??
>store railgun/ass3 pairing together into global storage to 'link' the compound entity?

]]