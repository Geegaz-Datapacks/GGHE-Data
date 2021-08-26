
# Find the campfire and create the pot
execute anchored eyes positioned ^ ^ ^ run function gghe:block/cooking_pot/create/raycast
execute as @e[type=armor_stand, tag=gghe.new, tag=gghe.cooking_pot] at @s run function gghe:block/cooking_pot/create/at_entity

execute as @s[tag=gghe.create_fail,gamemode=!creative] run loot give @s loot gghe:items/cooking_pot

# VFX

# SFX
execute as @s[tag=!gghe.create_fail] run playsound minecraft:block.copper.place block @a ~ ~ ~

tag @s remove gghe.create_fail
advancement revoke @s only gghe:create_cooking_pot