setblock ~ 0 ~ yellow_shulker_box

# Remove all visual items
execute positioned ~ ~1 ~ as @e[type=snowball,distance=..0.5,tag=gghe.cooking_pot.ingredient] run kill @s

# Remove all items and put them in the yellow_shulker_box
data modify block ~ 0 ~ Items set from storage geegaz:gghe temp.CookingPot.Items
data remove storage geegaz:gghe temp.CookingPot.Items[]
scoreboard players set @s gghe.items 0

# VFX
execute as @s[tag=gghe.cooking_pot.has_water] run particle minecraft:splash ~ ~1 ~ 0.1 0 0.1 1 10
# SFX
execute as @s[tag=gghe.cooking_pot.has_water] run playsound minecraft:ambient.underwater.exit block @a[distance=..16] ~ ~1 ~ 0.25 1.5
playsound minecraft:entity.item_frame.remove_item block @a[distance=..16] ~ ~1 ~ 0.5 1.0

loot spawn ~ ~0.5 ~ mine ~ 0 ~ air{drop_contents:1b}
setblock ~ 0 ~ bedrock