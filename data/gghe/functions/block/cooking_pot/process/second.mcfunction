
# VFX
execute as @s[tag=gghe.cooking_pot.has_water] run particle splash ~ ~1 ~ 0.1 0 0.1 1 5
# SFX
execute as @s[tag=gghe.cooking_pot.has_water] run playsound block.bubble_column.whirlpool_ambient block @a[distance=..16] ~ ~ ~ 0.6 1.25
execute as @s[tag=!gghe.cooking_pot.has_water] run playsound minecraft:item.armor.equip_iron master @s ~ ~ ~ 0.25 0.0