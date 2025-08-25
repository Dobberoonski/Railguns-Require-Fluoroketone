storage.fluoroAssemblers = storage.fluoroAssemblers or {}

local function setLayout(str)
    if str == "Old v1.0.0" then return require("layout/oldLayout_v1")
    elseif str == "Default" then return require("layout/defaultLayout")
    end
end

local layout = setLayout(settings.startup["railgun-layout"].value)

script.on_event(defines.events.on_script_trigger_effect, function(event)
    if event.effect_id ~= "railgun-turret" then return end
    local railgun = event.source_entity
    local offsetX, offsetY = layout.setPosition(railgun.direction)
    local ass3 = game.get_surface(event.surface_index).create_entity{
        name = layout.setName(railgun.direction).. "fluoro-assembling-machine-3",
        position = {railgun.position.x + offsetX, railgun.position.y + offsetY},
        direction = layout.setDirection(railgun.direction),
        force = railgun.force
    }
    ass3.destructible = false
    ass3.minable_flag = false
    local key = script.register_on_object_destroyed(railgun)
    storage.fluoroAssemblers[key] = ass3
end)

script.on_event(defines.events.on_object_destroyed, function(event)
    local key = event.registration_number
    if not storage.fluoroAssemblers[key] then return end--prevents potential mod incompatibilities
    storage.fluoroAssemblers[key].destroy()
    storage.fluoroAssemblers[key] = nil
end)