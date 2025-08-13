--control.lua
script.on_init(function()
    if not storage.fluoroAssemblers then
        storage.fluoroAssemblers = {}
    end
end)

script.on_configuration_changed(function()
    if not storage.fluoroAssemblers then
        storage.fluoroAssemblers = {}
    end
end)
--yea just fuck DRY i suppose lol
--i'm WET
--WRITE EVERYTHING TOGETHER

local function IHATEROTATIONSGODDAMN(direction)
    --IHATEROTATIONSGODDAMN : defines.direction -> x, y
    if direction == defines.direction.north then return 0, 1
    elseif direction == defines.direction.east then return -1, 0
    elseif direction == defines.direction.south then return 0, -1
    elseif direction == defines.direction.west then return 1, 0
    --railguns can rotate in 8 directions. Lucky me.
    elseif direction == defines.direction.northeast or direction == defines.direction.northwest then return 0, 1
    elseif direction == defines.direction.southeast or direction == defines.direction.southwest then return 0, -1
    end
end
--I could just disable the 8 way rotation flag in the railguns prototype.
--I thought about that a lot.

local function IHATEDIRECTIONSTOOFUCK(direction)
    --IHATEDIRECTIONSTOOFUCK : defines.direction - > defines.direction
    if direction == defines.direction.northeast or direction == defines.direction.northwest then
        return defines.direction.north
    elseif direction == defines.direction.southeast or direction == defines.direction.southwest then
        return defines.direction.south
    else
        return direction
    end
end

script.on_event(defines.events.on_script_trigger_effect, function(event)
    if event.effect_id ~= "railgun-turret" then return end
    local key = script.register_on_object_destroyed(event.source_entity)
    local offsetX, offsetY = IHATEROTATIONSGODDAMN(event.source_entity.direction)
    local ass3 = game.get_surface(event.surface_index).create_entity{
        name = "fluoro-assembling-machine-3",
        position = {
            event.source_entity.position.x + offsetX,
            event.source_entity.position.y + offsetY
        },
        direction = IHATEDIRECTIONSTOOFUCK(event.source_entity.direction),
        force = event.source_entity.force
    }
    ass3.destructible = false
    ass3.minable_flag = false
    storage.fluoroAssemblers[key] = ass3
end)

script.on_event(defines.events.on_object_destroyed, function(event)
    local key = event.registration_number
    if not storage.fluoroAssemblers[key] then return end--required if Maraxsis 1.30.49 installed.
    --see bug report: https://github.com/notnotmelon/maraxsis/issues/323
    storage.fluoroAssemblers[key].destroy()
    storage.fluoroAssemblers[key] = nil
end)