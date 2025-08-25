return {
    setName = function(direction)
        return ""
    end,
    setPosition = function(direction)
        if direction == defines.direction.north then return 0, 1
        elseif direction == defines.direction.east then return -1, 0
        elseif direction == defines.direction.south then return 0, -1
        elseif direction == defines.direction.west then return 1, 0
        elseif direction == defines.direction.northwest then return 0, 1
        elseif direction == defines.direction.northeast then return 0, 1
        elseif direction == defines.direction.southeast then return 0, -1
        elseif direction == defines.direction.southwest then return 0, -1
        end
    end,
    setDirection = function(direction)
        if direction == defines.direction.northwest then return defines.direction.north
        elseif direction == defines.direction.northeast then return defines.direction.north
        elseif direction == defines.direction.southeast then return defines.direction.south
        elseif direction == defines.direction.southwest then return defines.direction.south
        else return direction
        end
    end
}