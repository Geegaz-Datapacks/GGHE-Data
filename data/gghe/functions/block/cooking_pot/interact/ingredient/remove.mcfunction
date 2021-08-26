setblock ~ 0 ~ yellow_shulker_box

# Remove the last visual item
scoreboard players operation $gghe.temp gghe.items = @s gghe.items
execute positioned ~ ~1 ~ as @e[type=snowball,distance=..0.5,tag=gghe.cooking_pot.ingredient] if score @s gghe.items = $gghe.temp gghe.items run kill @s
scoreboard players reset $gghe.temp

# Remove the last item and put it in the yellow_shulker_box
data modify block ~ 0 ~ Items append from storage geegaz:gghe temp.CookingPot.Items[-1]
data remove block ~ 0 ~ Items[].Slot
data remove storage geegaz:gghe temp.CookingPot.Items[-1]
scoreboard players remove @s gghe.items 1

# VFX

# SFX
execute as @s[tag=gghe.cooking_pot.has_water] run playsound minecraft:ambient.underwater.exit block @a[distance=..16] ~ ~1 ~ 0.25 1.5
playsound minecraft:entity.item_frame.rotate_item block @a[distance=..16] ~ ~1 ~ 0.5 1.0

loot replace entity @p[tag=gghe.interact.cooking_pot,gamemode=!creative] weapon.mainhand mine ~ 0 ~ air{drop_contents:1b}
#setblock ~ 0 ~ bedrock