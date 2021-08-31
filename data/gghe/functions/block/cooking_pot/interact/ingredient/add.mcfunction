
# Get the item's data in storage
data modify storage geegaz:gghe temp.Item set from entity @s HandItems[0]
data remove storage geegaz:gghe temp.Item.Count
data remove storage geegaz:gghe temp.Item.Slot

scoreboard players add $gghe.items gghe.var 1

# Create visual item
execute if score $gghe.items gghe.var matches 1 run summon snowball ~0.1 ~1 ~-0.1 {NoGravity:1b,Tags:["gghe.new","gghe.cooking_pot.ingredient"]}
execute if score $gghe.items gghe.var matches 2 run summon snowball ~0.1 ~1 ~0.1 {NoGravity:1b,Tags:["gghe.new","gghe.cooking_pot.ingredient"]}
execute if score $gghe.items gghe.var matches 3 run summon snowball ~-0.1 ~1 ~0.1 {NoGravity:1b,Tags:["gghe.new","gghe.cooking_pot.ingredient"]}
execute if score $gghe.items gghe.var matches 4 run summon snowball ~-0.1 ~1 ~-0.1 {NoGravity:1b,Tags:["gghe.new","gghe.cooking_pot.ingredient"]}

scoreboard players operation @e[type=snowball,tag=gghe.new,tag=gghe.cooking_pot.ingredient] gghe.CONST = $gghe.items gghe.var
data modify entity @e[type=snowball,tag=gghe.new,tag=gghe.cooking_pot.ingredient,limit=1,sort=nearest] Item set from storage geegaz:gghe temp.Item

# Add the new item to the pot's data
data modify storage geegaz:gghe temp.CookingPot.Items append from storage geegaz:gghe temp.Item

# VFX
execute as @s[tag=gghe.cooking_pot.has_water] run particle minecraft:splash ~ ~1 ~ 0.1 0 0.1 1 10
# SFX
execute as @s[tag=gghe.cooking_pot.has_water] run playsound minecraft:ambient.underwater.enter block @a[distance=..16] ~ ~1 ~ 0.5 1.5
execute as @s[tag=!gghe.cooking_pot.has_water] run playsound minecraft:item.armor.equip_generic block @a[distance=..16] ~ ~1 ~ 0.5 0.8
playsound minecraft:block.copper.step block @a[distance=..16] ~ ~1 ~ 0.8 0.5

tag @e[type=snowball] remove gghe.new