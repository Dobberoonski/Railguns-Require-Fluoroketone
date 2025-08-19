storage.fluoroAssemblers = storage.fluoroAssemblers or {}

--[[Abstract Railgun Layout]]
local railgunLayout = {}
function railgunLayout:new()
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end
function railgunLayout:setDirection(direction)
    if direction == defines.direction.northwest then return defines.direction.north
    elseif direction == defines.direction.northeast then return defines.direction.north
    elseif direction == defines.direction.southeast then return defines.direction.south
    elseif direction == defines.direction.southwest then return defines.direction.south
    else return direction
    end
end
function railgunLayout:setName(direction) end--virtual
function railgunLayout:setPosition(direction) end--virtual

--[[Old Layout from v1.0.0]]
local oldLayout = railgunLayout:new()
function oldLayout:setName(direction)
    return ""
end
function oldLayout:setPosition(direction)
    if direction == defines.direction.north then return 0, 1
    elseif direction == defines.direction.east then return -1, 0
    elseif direction == defines.direction.south then return 0, -1
    elseif direction == defines.direction.west then return 1, 0
    elseif direction == defines.direction.northwest then return 0, 1
    elseif direction == defines.direction.northeast then return 0, 1
    elseif direction == defines.direction.southeast then return 0, -1
    elseif direction == defines.direction.southwest then return 0, -1
    end
end

--[[Default Layout]]
local defaultLayout = railgunLayout:new()
function defaultLayout:setName(direction)
    if direction == defines.direction.northwest then return "nw-"
    elseif direction == defines.direction.northeast then return "ne-"
    elseif direction == defines.direction.southwest then return "sw-"
    elseif direction == defines.direction.southeast then return "se-"
    else return ""
    end
end
function defaultLayout:setPosition(direction)
    if direction == defines.direction.north then return 0, 1
    elseif direction == defines.direction.east then return -1, 0
    elseif direction == defines.direction.south then return 0, -1
    elseif direction == defines.direction.west then return 1, 0
    elseif direction == defines.direction.northwest then return 1, 1
    elseif direction == defines.direction.northeast then return -1, 1
    elseif direction == defines.direction.southeast then return -1, -1
    elseif direction == defines.direction.southwest then return 1, -1
    end
end

--[[Select which layout to use depending on mod settings]]
local layout
local railgunLayoutOption = settings.startup["railgun-layout"].value
if railgunLayoutOption == "Old v1.0.0" then layout = oldLayout:new() end
if railgunLayoutOption == "Default" then layout = defaultLayout:new() end

script.on_event(defines.events.on_script_trigger_effect, function(event)
    if event.effect_id ~= "railgun-turret" then return end
    local railgun = event.source_entity
    local offsetX, offsetY = layout:setPosition(railgun.direction)
    local ass3 = game.get_surface(event.surface_index).create_entity{
        name = layout:setName(railgun.direction).. "fluoro-assembling-machine-3",
        position = {
            railgun.position.x + offsetX,
            railgun.position.y + offsetY
        },
        direction = layout:setDirection(railgun.direction),
        force = railgun.force
    }
    ass3.destructible = false
    ass3.minable_flag = false
    local key = script.register_on_object_destroyed(railgun)
    storage.fluoroAssemblers[key] = ass3
end)

script.on_event(defines.events.on_object_destroyed, function(event)
    local key = event.registration_number
    if not storage.fluoroAssemblers[key] then return end--prevent potential mod incompatibilities
    storage.fluoroAssemblers[key].destroy()
    storage.fluoroAssemblers[key] = nil
end)