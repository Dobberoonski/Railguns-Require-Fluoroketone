local og_railgun = data.raw["ammo-turret"]["railgun-turret"]
og_railgun.created_effect = {
    type = "direct",
    action_delivery = {
        type = "instant",
        source_effects = {
            type = "script",
            effect_id = og_railgun.name--"railgun-turret"
        }
    }
}

data:extend{og_railgun}