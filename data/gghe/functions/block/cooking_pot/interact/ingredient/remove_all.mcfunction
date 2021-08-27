setblock ~ 0 ~ yellow_shulker_box

# Put all items in the yellow_shulker_box
data modify block ~ 0 ~ Items set from storage geegaz:gghe temp.CookingPot.Items

# Remove all visual items
execute positioned ~ ~1 ~ as @e[type=snowball,distance=..0.5,tag=gghe.cooking_pot.ingredient] run kill @s

scoreboard players set @s gghe.cp.items 0

loot spawn ~ ~1 ~ mine ~ 0 ~ air{drop_contents:1b}
setblock ~ 0 ~ bedrock