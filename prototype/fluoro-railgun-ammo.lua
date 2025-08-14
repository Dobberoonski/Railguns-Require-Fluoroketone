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
railgunAmmo.order = "e[railgun-ammo]-ab[basic]"
og_railgunAmmo.ammo_category = newAmmoCategory.name--disable usage of railgun-ammo

local newRecipeCategory = {type="recipe-category", name="fluoro-crafting"}
local og_railgunAmmoRecipe = data.raw["recipe"]["railgun-ammo"]
local railgunAmmoRecipe = table.deepcopy(og_railgunAmmoRecipe)
railgunAmmoRecipe.name = railgunAmmo.name
railgunAmmoRecipe.icon = railgunAmmo.icon--required for recipies with many outputs
railgunAmmoRecipe.category = "fluoro-crafting"
railgunAmmoRecipe.enabled = true--for testing only
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