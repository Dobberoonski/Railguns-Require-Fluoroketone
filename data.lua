--data.lua
--[[Ammo.]]
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

--[[Assembly Machine (Compound Entity, Hidden)]]
local og_ass3 = data.raw["assembling-machine"]["assembling-machine-3"]
local ass3 = table.deepcopy(og_ass3)
ass3.name = "fluoro-".. og_ass3.name--fluoro-assembling-machine-3
ass3.minable.result = ass3.name
ass3.surface_conditions = nil
ass3.fixed_recipe = railgunAmmoRecipe.name
ass3.crafting_categories = {"crafting", newRecipeCategory.name}
ass3.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    drain = "0W"
}
ass3.energy_usage = "1W"--must be strictly > 0 ;3;
ass3.fluid_boxes = {
    {
        production_type = "input",
        volume = 100,
        pipe_connections = {
            {
                direction = defines.direction.south,
                flow_direction = "input",
                position = {1, 1}
            }
        },
        pipe_covers = {
            east = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            },
            north = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            },
            south = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            },
            west = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            }
        },--//pipe_covers
        pipe_covers_frozen = {
            east = {
              filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-east.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            north = {
              filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-north.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            south = {
              filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-south.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            west = {
              filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-west.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            }
        },--//pipe_covers_frozen
        pipe_picture = {
            east = {
              filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-E.png",
              height = 76,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                -0.765625,
                0.03125
              },
              width = 42
            },
            north = {
              filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-N.png",
              height = 38,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0.0703125,
                0.421875
              },
              width = 71
            },
            south = {
              filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-S.png",
              height = 61,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0,
                -0.9765625
              },
              width = 88
            },
            west = {
              filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-W.png",
              height = 73,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0.8046875,
                0.0390625
              },
              width = 39
            }
        },--//pipe_picture
        pipe_picture_frozen = {
            east = {
              filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-E-frozen.png",
              height = 76,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                -0.765625,
                0.03125
              },
              width = 42
            },
            north = {
              filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-N-frozen.png",
              height = 38,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0.0703125,
                0.421875
              },
              width = 71
            },
            south = {
              filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-S-frozen.png",
              height = 61,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0,
                -0.9765625
              },
              width = 88
            },
            west = {
              filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-W-frozen.png",
              height = 73,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0.8046875,
                0.0390625
              },
              width = 39
            }
        },--//pipe_picture_frozen
        secondary_draw_orders = {
            north = -1
        },
    },
    {
        production_type = "output",
        volume = 100,
        pipe_connections = {
            {
                direction = defines.direction.south,
                flow_direction = "output",
                position = {-1, 1}
            }
        },
        pipe_covers = {
            east = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            },
            north = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            },
            south = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            },
            west = {
              layers = {
                {
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                },
                {
                  draw_as_shadow = true,
                  filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
                  height = 128,
                  priority = "extra-high",
                  scale = 0.5,
                  width = 128
                }
              }
            }
        },--//pipe_covers
        pipe_covers_frozen = {
            east = {
              filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-east.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            north = {
              filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-north.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            south = {
              filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-south.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            },
            west = {
              filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-west.png",
              height = 128,
              priority = "extra-high",
              scale = 0.5,
              width = 128
            }
        },--//pipe_covers_frozen
        pipe_picture = {
            east = {
              filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-E.png",
              height = 76,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                -0.765625,
                0.03125
              },
              width = 42
            },
            north = {
              filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-N.png",
              height = 38,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0.0703125,
                0.421875
              },
              width = 71
            },
            south = {
              filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-S.png",
              height = 61,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0,
                -0.9765625
              },
              width = 88
            },
            west = {
              filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-W.png",
              height = 73,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0.8046875,
                0.0390625
              },
              width = 39
            }
        },--//pipe_picture
        pipe_picture_frozen = {
            east = {
              filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-E-frozen.png",
              height = 76,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                -0.765625,
                0.03125
              },
              width = 42
            },
            north = {
              filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-N-frozen.png",
              height = 38,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0.0703125,
                0.421875
              },
              width = 71
            },
            south = {
              filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-S-frozen.png",
              height = 61,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0,
                -0.9765625
              },
              width = 88
            },
            west = {
              filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-W-frozen.png",
              height = 73,
              priority = "extra-high",
              scale = 0.5,
              shift = {
                0.8046875,
                0.0390625
              },
              width = 39
            }
        },--//pipe_picture_frozen
        secondary_draw_orders = {
            north = -1
        },
    },
}--//ass3.fluid_boxes
ass3.module_slots = 0
ass3.vector_to_place_result = {0, -2}

local og_ass3Recipe = data.raw["recipe"]["assembling-machine-3"]
local ass3Recipe = table.deepcopy(og_ass3Recipe)
ass3Recipe.name = ass3.name
ass3Recipe.results = {{type="item", name=ass3.name, amount=1}}
ass3Recipe.enabled = true--for testing only

local og_ass3Item = data.raw["item"]["assembling-machine-3"]
local ass3Item = table.deepcopy(og_ass3Item)
ass3Item.name = ass3.name
ass3Item.icons = {
    {
        icon = og_ass3.icon,
        icon_size = og_ass3.icon_size,
        tint = {r=0.3,g=0,b=0.3,a=0.3}
    },
}
ass3Item.place_result = ass3.name

--[[Railgun (Compound Entity, Parent)]]
--TODO: set building-direction-8-way to nil on railgun properties to prevent diagonal rotations
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

data:extend{newAmmoCategory, railgunAmmo, newRecipeCategory, railgunAmmoRecipe, ass3, ass3Recipe, ass3Item, og_railgun}