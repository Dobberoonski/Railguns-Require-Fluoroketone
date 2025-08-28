local function setPipeConn(str)
    if str == "Old v1.0.0" or str == "Default" then return require("pipeconnections/defaultPipeConn")
    end
end

local function setOnScriptTriggerEffect(effectID)
    function setSourceEffects()
        return {type="script", effect_id=effectID}
    end
    function setActionDelivery()
        return {type="instant", source_effects=setSourceEffects()}
    end
    return {type="direct", action_delivery=setActionDelivery()}
end

--[[Fluoro-Railgun ammo]]
local newAmmoCategory = {type="ammo-category", name="disabled"}
local og_railgunAmmo = data.raw["ammo"]["railgun-ammo"]
local railgunAmmo = table.deepcopy(og_railgunAmmo)
railgunAmmo.name = "fluoro-".. og_railgunAmmo.name--fluoro-railgun-ammo
railgunAmmo.icons = {
    {
        icon = og_railgunAmmo.icon,
        icon_size = og_railgunAmmo.icon_size,
        tint = {r=0.3,g=0,b=0.3,a=0.3}
    },
}
og_railgunAmmo.ammo_category = newAmmoCategory.name--disable usage of railgun-ammo

local newRecipeCategory = {type="recipe-category", name="fluoro-crafting"}
local railgunAmmoRecipe = table.deepcopy(data.raw["recipe"]["railgun-ammo"])
railgunAmmoRecipe.name = railgunAmmo.name
railgunAmmoRecipe.icon = railgunAmmo.icon--required for recipies with many outputs
railgunAmmoRecipe.category = newRecipeCategory.name
railgunAmmoRecipe.surface_conditions = nil
railgunAmmoRecipe.allow_productivity = false
railgunAmmoRecipe.energy_required = 0.5
railgunAmmoRecipe.ingredients = {
    {type="item", name=og_railgunAmmo.name, amount=1},
    {type="fluid", name="fluoroketone-cold", amount=1}
}
railgunAmmoRecipe.results = {
    {type="item", name=railgunAmmoRecipe.name, amount=1},
    {type="fluid", name="fluoroketone-hot", amount=1}
}
railgunAmmoRecipe.hide_from_stats = true
railgunAmmoRecipe.hide_from_player_crafting = true

data:extend{newAmmoCategory, railgunAmmo, newRecipeCategory, railgunAmmoRecipe}

--[[Hidden Assembler to craft Fluoro-Railgun ammo]]
local pipeConn = setPipeConn(settings.startup["railgun-layout"].value)
local pipe_gfx = data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes[1]
local ass3 = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
ass3.name = "fluoro-".. ass3.name--fluoro-assembling-machine-3
ass3.minable.result = ass3.name
ass3.surface_conditions = nil
ass3.fixed_recipe = railgunAmmo.name
ass3.crafting_categories = {newRecipeCategory.name}
ass3.energy_source = {
    type = "void",
    render_no_power_icon = false,
    render_no_network_icon = false
}
ass3.fluid_boxes = {
    {
        production_type = "input",
        volume = 100,
        pipe_connections = {pipeConn.inputOrthogonal()},
        pipe_covers = pipe_gfx.pipe_covers,
        pipe_covers_frozen = pipe_gfx.pipe_covers_frozen,
        pipe_picture = pipe_gfx.pipe_picture,
        pipe_picture_frozen = pipe_gfx.pipe_picture_frozen,
        secondary_draw_orders = {north=-1}
    },
    {
        production_type = "output",
        volume = 100,
        pipe_connections = {pipeConn.outputOrthogonal()},
        pipe_covers = pipe_gfx.pipe_covers,
        pipe_covers_frozen = pipe_gfx.pipe_covers_frozen,
        pipe_picture = pipe_gfx.pipe_picture,
        pipe_picture_frozen = pipe_gfx.pipe_picture_frozen,
        secondary_draw_orders = {north=-1}
    },
}
ass3.module_slots = 0
ass3.vector_to_place_result = {0, -2}
--Properties to make hidden/uninteractable
ass3.heating_energy = "0W"
ass3.selectable_in_game = false
ass3.allow_copy_paste = false
ass3.flags = {
    "not-on-map",
    "not-deconstructable",
    "not-blueprintable",
    "not-in-made-in",
    "not-upgradable",
    "not-repairable",
    "no-automated-item-removal"
}
ass3.graphics_set = nil

local ass3Item = table.deepcopy(data.raw["item"]["assembling-machine-3"])
ass3Item.name = ass3.name
ass3Item.icons = {
    {
        icon = ass3.icon,
        icon_size = ass3.icon_size,
        tint = {r=0.3,g=0,b=0.3,a=0.3}
    },
}
ass3Item.place_result = ass3.name

data:extend{ass3, ass3Item}

--[[Modified hidden assemblers for diagonal pipe connections]]
local ass3nw = table.deepcopy(data.raw["assembling-machine"][ass3.name])
ass3nw.name = "nw-".. ass3nw.name
for k,v in pairs(ass3nw.fluid_boxes) do
    if v.production_type == "input" then v.pipe_connections = {pipeConn.inputNW()} end
    if v.production_type == "output" then v.pipe_connections = {pipeConn.outputNW()} end
end

local ass3ne = table.deepcopy(data.raw["assembling-machine"][ass3.name])
ass3ne.name = "ne-".. ass3ne.name
for k,v in pairs(ass3ne.fluid_boxes) do
    if v.production_type == "input" then v.pipe_connections = {pipeConn.inputNE()} end
    if v.production_type == "output" then v.pipe_connections = {pipeConn.outputNE()} end
end

local ass3sw = table.deepcopy(data.raw["assembling-machine"][ass3.name])
ass3sw.name = "sw-".. ass3sw.name
for k,v in pairs(ass3sw.fluid_boxes) do
    if v.production_type == "input" then v.pipe_connections = {pipeConn.inputSW()} end
    if v.production_type == "output" then v.pipe_connections = {pipeConn.outputSW()} end
end

local ass3se = table.deepcopy(data.raw["assembling-machine"][ass3.name])
ass3se.name = "se-".. ass3se.name
for k,v in pairs(ass3se.fluid_boxes) do
    if v.production_type == "input" then v.pipe_connections = {pipeConn.inputSE()} end
    if v.production_type == "output" then v.pipe_connections = {pipeConn.outputSE()} end
end

data:extend{ass3nw, ass3ne, ass3sw, ass3se}

--[[Railgun]]
local og_railgun = data.raw["ammo-turret"]["railgun-turret"]
og_railgun.created_effect = setOnScriptTriggerEffect(og_railgun.name)
table.insert(og_railgun.flags, "no-automated-item-removal")