local inputNWorSE = {
    direction = defines.direction.east,
    flow_direction = "input",
    position = {1, 0}
}

local inputNEorSW = {
    direction = defines.direction.west,
    flow_direction = "input",
    position = {-1, 0}
}

local outputDiagonal = {
    direction = defines.direction.south,
    flow_direction = "output",
    position = {0, 1}
}

return {
    inputOrthogonal = function()
        return {
            direction = defines.direction.south,
            flow_direction = "input",
            position = {1, 1}
        }
    end,
    outputOrthogonal = function()
        return {
            direction = defines.direction.south,
            flow_direction = "output",
            position = {-1, 1}
        }
    end,
    inputNW = function() return inputNWorSE end,
    outputNW = function() return outputDiagonal end,
    inputNE = function() return inputNEorSW end,
    outputNE = function() return outputDiagonal end,
    inputSW = function() return inputNEorSW end,
    outputSW = function() return outputDiagonal end,
    inputSE = function() return inputNWorSE end,
    outputSE = function() return outputDiagonal end
}