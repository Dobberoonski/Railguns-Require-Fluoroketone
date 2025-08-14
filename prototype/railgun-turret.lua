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
og_railgun.flags = og_railgun.flags or {}
table.insert(og_railgun.flags, "no-automated-item-removal")

data:extend{og_railgun}