local ass3 = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
ass3.name = "fluoro-".. ass3.name--fluoro-assembling-machine-3
ass3.minable.result = ass3.name
ass3.surface_conditions = nil
ass3.fixed_recipe = "fluoro-railgun-ammo"--defined in fluoro-railgun-ammo.lua
ass3.crafting_categories = {"fluoro-crafting"}--defined in fluoro-railgun-ammo.lua
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
--Properties to make hidden/uninteractable
ass3.heating_energy = "0W"
ass3.selectable_in_game = false
ass3.allow_copy_paste = false
ass3.flags = {
    --"hide-alt-info",
    "not-on-map",
    "not-deconstructable",
    "not-blueprintable",
    "not-in-made-in",
    "not-upgradable",
    "not-repairable",
    "no-automated-item-removal"
}
ass3.graphics_set = nil

local ass3Recipe = table.deepcopy(data.raw["recipe"]["assembling-machine-3"])
ass3Recipe.name = ass3.name
ass3Recipe.results = {{type="item", name=ass3.name, amount=1}}
ass3Recipe.enabled = false
ass3Recipe.hide_from_stats = true
ass3Recipe.hide_from_player_crafting = true

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

data:extend{ass3, ass3Recipe, ass3Item}

--[[Modified hidden assemblers for diagonal pipe connections]]
local ass3nw = table.deepcopy(data.raw["assembling-machine"][ass3.name])
ass3nw.name = "nw-".. ass3nw.name
for k,v in pairs(ass3nw.fluid_boxes) do
    if v.production_type == "input" then
        v.pipe_connections = {
            {
                direction = defines.direction.east,
                flow_direction = "input",
                position = {1, 0}
            }
        }
    end
    if v.production_type == "output" then
        v.pipe_connections = {
            {
                direction = defines.direction.south,
                flow_direction = "output",
                position = {-1, 1}
            }
        }
    end
end

local ass3ne = table.deepcopy(data.raw["assembling-machine"][ass3.name])
ass3ne.name = "ne-".. ass3ne.name
for k,v in pairs(ass3ne.fluid_boxes) do
    if v.production_type == "input" then
        v.pipe_connections = {
            {
                direction = defines.direction.west,
                flow_direction = "input",
                position = {-1, 0}
            }
        }
    end
    if v.production_type == "output" then
        v.pipe_connections = {
            {
                direction = defines.direction.south,
                flow_direction = "output",
                position = {1, 1}
            }
        }
    end
end

local ass3sw = table.deepcopy(data.raw["assembling-machine"][ass3.name])
ass3sw.name = "sw-".. ass3sw.name
for k,v in pairs(ass3sw.fluid_boxes) do
    if v.production_type == "input" then
        v.pipe_connections = {
            {
                direction = defines.direction.west,
                flow_direction = "input",
                position = {-1, 0}
            }
        }
    end
    if v.production_type == "output" then
        v.pipe_connections = {
            {
                direction = defines.direction.south,
                flow_direction = "output",
                position = {1, 1}
            }
        }
    end
end

local ass3se = table.deepcopy(data.raw["assembling-machine"][ass3.name])
ass3se.name = "se-".. ass3se.name
for k,v in pairs(ass3se.fluid_boxes) do
    if v.production_type == "input" then
        v.pipe_connections = {
            {
                direction = defines.direction.east,
                flow_direction = "input",
                position = {1, 0}
            }
        }
    end
    if v.production_type == "output" then
        v.pipe_connections = {
            {
                direction = defines.direction.south,
                flow_direction = "output",
                position = {-1, 1}
            }
        }
    end
end

data:extend{ass3nw, ass3ne, ass3sw, ass3se}