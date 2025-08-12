--control.lua
script.on_init(function()
    --//
end)

script.on_event(defines.events.on_script_trigger_effect, function(event)
    if event.effect_id ~= "railgun-turret" then return end
    local key = script.register_on_object_destroyed(event.source_entity)
    game.print(key)
    game.print("railgun created")
end)

script.on_event(defines.events.on_object_destroyed, function(event)
    --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! incompatability with Maraxsis 1.30.49
    local key = event.registration_number
    game.print(key)
    game.print("railgun destroyed")
end)

--[[

>when railgun built, build ass3 (compound entity; railgun parent)
>ass3 aligns with the railgun phsyically s.t. pipe connections give illusion of cooling railgun w/ fk
>ass3 collision/selection box disabled, invincible, etc. Not interactable w/ player. Pipe connections visible, ass3 not??
>store railgun/ass3 pairing together into global storage to 'link' the compound entity
>vector_to_place_result or drop_target on ass3

]]