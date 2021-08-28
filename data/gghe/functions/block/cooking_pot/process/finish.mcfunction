# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @s ArmorItems[3].tag.gghe.CookingPot
function gghe:block/cooking_pot/interact/get_data

# Drop the containers
summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Tags:["gghe.cooking_pot.ingredient_provider"]}
scoreboard players operation @e[type=armor_stand,tag=gghe.cooking_pot.ingredient_provider] gghe.var = $gghe.items gghe.var
execute as @e[type=armor_stand,tag=gghe.cooking_pot.ingredient_provider,limit=1,sort=nearest] run function gghe:block/cooking_pot/interact/recipe/check_containers

# Set the pot's scores
execute store result score $gghe.level gghe.var run data get storage geegaz:gghe temp.CookingPot.Recipe.Servings
tag @s remove gghe.cooking_pot.has_water

# Remove all items from storage
data remove storage geegaz:gghe temp.CookingPot.Items
scoreboard players set $gghe.items gghe.var 0
# Remove all visual items
execute positioned ~ ~1 ~ as @e[type=snowball,distance=..0.5,tag=gghe.cooking_pot.ingredient] run kill @s

# Update the pot
function gghe:block/cooking_pot/interact/set_data
loot replace entity @s armor.head loot gghe:items/cooking_pot

# VFX
particle minecraft:happy_villager ~ ~1.5 ~ 0.2 0.25 0.2 0 5
# SFX
playsound minecraft:block.brewing_stand.brew block @a[distance=..16] ~ ~1 ~ 0.2 0.5
playsound minecraft:entity.player.swim block @a ~ ~ ~ 0.5 1.5

tellraw @a[tag=gghe.debug] [{"translate":"[DEBUG] [Cooking Pot]"},{"text":" Finished recipe: "},{"nbt":"temp.CookingPot.Recipe.id","storage":"geegaz:gghe","interpret":false}]

scoreboard players reset @s gghe.CONST
scoreboard players reset @s gghe.time

data remove storage geegaz:gghe temp

tag @s remove gghe.cooking_pot.process
