--control.lua
local function RailgunsRequireFluoroketone_Init()
    --RailgunsRequireFluoroketone_Init : ->
    if not storage.fluoroAssemblers then
        storage.fluoroAssemblers = {}
    end
end

local function IHATEROTATIONSGODDAMN(direction)
    --IHATEROTATIONSGODDAMN : defines.direction -> x, y
    if direction == defines.direction.north then return 0, 1
    elseif direction == defines.direction.east then return -1, 0
    elseif direction == defines.direction.south then return 0, -1
    elseif direction == defines.direction.west then return 1, 0
    --[[railguns can rotate in 8 directions. Lucky me.
    --I could just disable the 8 way rotation flag in the railguns prototype.
    --I thought about that a lot.]]
    elseif direction == defines.direction.northeast or direction == defines.direction.northwest then return 0, 1
    elseif direction == defines.direction.southeast or direction == defines.direction.southwest then return 0, -1
    end
end

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

script.on_init(RailgunsRequireFluoroketone_Init)
script.on_configuration_changed(RailgunsRequireFluoroketone_Init)

script.on_event(defines.events.on_script_trigger_effect, function(event)
    if event.effect_id ~= "railgun-turret" then return end
    local railgun = event.source_entity
    local offsetX, offsetY = IHATEROTATIONSGODDAMN(railgun.direction)
    local ass3 = game.get_surface(event.surface_index).create_entity{
        name = "fluoro-assembling-machine-3",
        position = {
            railgun.position.x + offsetX,
            railgun.position.y + offsetY
        },
        direction = IHATEDIRECTIONSTOOFUCK(railgun.direction),
        force = railgun.force
    }
    ass3.destructible = false
    ass3.minable_flag = false
    local key = script.register_on_object_destroyed(railgun)
    storage.fluoroAssemblers[key] = ass3
end)

if script.active_mods["maraxsis"] then
    require("runtime/compatability_on_object_destroyed")
else
    require("runtime/on_object_destroyed")
end