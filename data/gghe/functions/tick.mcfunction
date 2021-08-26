# This is the main function, that will run once per tick

execute as @a at @s run function gghe:player/tick
execute as @e[type=armor_stand,tag=gghe.cooking_pot] at @s run function gghe:block/cooking_pot/tick