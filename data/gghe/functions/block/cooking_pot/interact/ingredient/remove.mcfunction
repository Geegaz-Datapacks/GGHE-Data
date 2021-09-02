setblock ~ 0 ~ yellow_shulker_box

# Remove the last item and put it in the yellow_shulker_box
data modify block ~ 0 ~ Items append from storage geegaz:gghe temp.CookingPot.Items[-1]
data remove storage geegaz:gghe temp.CookingPot.Items[-1]
# Remove the last visual item
execute positioned ~ ~1 ~ as @e[type=snowball,distance=..0.5,tag=gghe.cooking_pot.ingredient] if score @s gghe.CONST = $gghe.items gghe.var run kill @s

# Give the ingredient back
loot give @p[tag=gghe.interact.cooking_pot,gamemode=!creative] mine ~ 0 ~ air{drop_contents:1b}

# VFX

# SFX
execute as @s[tag=gghe.cooking_pot.has_water] run playsound minecraft:ambient.underwater.exit block @a[distance=..16] ~ ~1 ~ 0.5 1.5
playsound minecraft:entity.item_frame.remove_item block @a[distance=..16] ~ ~1 ~ 0.8 1.0

scoreboard players remove $gghe.items gghe.var 1

setblock ~ 0 ~ bedrock