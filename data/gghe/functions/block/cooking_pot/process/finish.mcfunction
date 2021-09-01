# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @s ArmorItems[3].tag.gghe.CookingPot
function gghe:block/cooking_pot/interact/get_data

# Store items in a separate Items list
data modify storage geegaz:gghe temp.Items set from storage geegaz:gghe temp.CookingPot.Items
# Drop the containers
function gghe:block/cooking_pot/interact/recipe/test_containers

# Get the recipe item in storage
tag @s add gghe.cooking_pot.display_target
summon bat ~ ~ ~ {Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["gghe.cooking_pot.display_provider"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:999999,ShowParticles:0b}]}
execute as @e[type=bat,tag=gghe.cooking_pot.display_provider] run function gghe:block/cooking_pot/display/provider
tag @s remove gghe.cooking_pot.display_target

# Set the pot's level and score from the recipe
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

# Stop process and reset animation
data modify entity @s Pose.Head set value [0.0f,0.0f,0.0f]
tag @s remove gghe.cooking_pot.process

# VFX
particle minecraft:happy_villager ~ ~1.5 ~ 0.2 0.25 0.2 0 5
# SFX
playsound minecraft:item.armor.equip_generic block @a[distance=..16] ~ ~1 ~ 0.5 0.5

scoreboard players reset @s
data remove storage geegaz:gghe temp
