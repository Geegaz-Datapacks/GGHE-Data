setblock ~ 0 ~ yellow_shulker_box

# Set needed data
#data modify storage geegaz:gghe temp.CookingPot.Items[].Count set value 1b
execute if score $gghe.items gghe.var matches 1.. run data modify storage geegaz:gghe temp.CookingPot.Items[0].Slot set value 0b
execute if score $gghe.items gghe.var matches 2.. run data modify storage geegaz:gghe temp.CookingPot.Items[1].Slot set value 1b
execute if score $gghe.items gghe.var matches 3.. run data modify storage geegaz:gghe temp.CookingPot.Items[2].Slot set value 2b
execute if score $gghe.items gghe.var matches 4.. run data modify storage geegaz:gghe temp.CookingPot.Items[3].Slot set value 3b

# Put all items in the yellow_shulker_box and remove them from storage
data modify block ~ 0 ~ Items set from storage geegaz:gghe temp.CookingPot.Items
data remove storage geegaz:gghe temp.CookingPot.Items
# Remove all visual items
execute positioned ~ ~1 ~ as @e[type=snowball,distance=..0.5,tag=gghe.cooking_pot.ingredient] run kill @s

loot spawn ~ ~1 ~ mine ~ 0 ~ air{drop_contents:1b}
setblock ~ 0 ~ bedrock