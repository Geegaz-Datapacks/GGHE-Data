# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @s ArmorItems[3].tag.gghe.CookingPot

# Get the amount of containers
summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Tags:["gghe.cooking_pot.ingredient_provider"]}
scoreboard players operation @e[type=armor_stand,tag=gghe.cooking_pot.ingredient_provider] gghe.cp.items = @s gghe.cp.items
execute as @e[type=armor_stand,tag=gghe.cooking_pot.ingredient_provider,limit=1,sort=nearest] run function gghe:block/cooking_pot/interact/recipe/check_containers

loot spawn ~ ~0.8 ~ loot gghe:cooking_table/containers

# Set the pot's scores
execute store result score @s gghe.cp.level run data get storage geegaz:gghe temp.CookingPot.Recipe.Servings
scoreboard players set @s gghe.cp.items 0

tag @s remove gghe.cooking_pot.has_water

# Remove all visual items
execute positioned ~ ~1 ~ as @e[type=snowball,distance=..0.5,tag=gghe.cooking_pot.ingredient] run kill @s
# Remove irrelevant data
data remove storage geegaz:gghe temp.CookingPot.HasWater
data remove storage geegaz:gghe temp.CookingPot.Items

function gghe:block/cooking_pot/update

# VFX
particle minecraft:happy_villager ~ ~1.5 ~ 0.2 0.25 0.2 0 5
# SFX
playsound minecraft:block.brewing_stand.brew block @a[distance=..16] ~ ~1 ~ 0.2 0.5
playsound minecraft:entity.player.swim block @a ~ ~ ~ 0.5 1.5

tellraw @a[tag=gghe.debug] [{"translate":"[DEBUG] [Cooking Pot]"},{"text":" Finished recipe: "},{"nbt":"temp.CookingPot.Recipe.id","storage":"geegaz:gghe","interpret":false}]

scoreboard players reset @s gghe.CONST
scoreboard players reset @s gghe.var
scoreboard players reset $gghe.container.bottle gghe.var
scoreboard players reset $gghe.container.bucket gghe.var

data remove storage geegaz:gghe temp

tag @s remove gghe.cooking_pot.process
