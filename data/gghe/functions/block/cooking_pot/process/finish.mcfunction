# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @s ArmorItems[3].tag.gghe.CookingPot
function gghe:block/cooking_pot/interact/get_data

# Drop the containers
summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Tags:["gghe.cooking_pot.ingredient_provider","gghe.provider.containers"]}
execute as @e[type=armor_stand,tag=gghe.cooking_pot.ingredient_provider] run function gghe:block/cooking_pot/interact/recipe/provider

# Set the pot's level from the recipe
execute store result score $gghe.level gghe.var run data get storage geegaz:gghe temp.CookingPot.Recipe.Servings
# Remove water
tag @s remove gghe.cooking_pot.has_water

# Remove all items from storage
data remove storage geegaz:gghe temp.CookingPot.Items
scoreboard players set $gghe.items gghe.var 0
# Remove all visual items
execute positioned ~ ~1 ~ as @e[type=snowball,distance=..0.5,tag=gghe.cooking_pot.ingredient] run kill @s

# Update the pot
function gghe:block/cooking_pot/interact/set_data
loot replace entity @s armor.head loot gghe:items/cooking_pot

# Reset animation
data modify entity @s Pose.Head set value [0.0f,0.0f,0.0f]

# VFX
particle minecraft:happy_villager ~ ~1.5 ~ 0.2 0.25 0.2 0 5
# SFX
playsound minecraft:item.armor.equip_generic block @a[distance=..16] ~ ~1 ~ 0.5 0.5

scoreboard players reset @s gghe.CONST
scoreboard players reset @s gghe.time

data remove storage geegaz:gghe temp

tag @s remove gghe.cooking_pot.process
