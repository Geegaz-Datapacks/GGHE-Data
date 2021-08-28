
# VFX
execute as @s[tag=gghe.cooking_pot.has_water] run particle splash ~ ~1 ~ 0.1 0 0.1 1 5
# SFX
execute as @s[tag=gghe.cooking_pot.has_water] run playsound block.bubble_column.whirlpool_ambient block @a[distance=..16] ~ ~1 ~ 0.5 1.25
execute as @s[tag=!gghe.cooking_pot.has_water] run playsound block.fire.ambient block @a[distance=..16] ~ ~1 ~ 0.5 0.0