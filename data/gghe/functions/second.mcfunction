# This function runs every second
schedule function gghe:second 1s replace

execute as @e[type=armor_stand,tag=gghe.cooking_pot] at @s run function gghe:block/cooking_pot/second