execute as @e[type=armor_stand,tag=gghe.cooking_pot,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] at @s run function gghe:block/cooking_pot/interact/at_entity
execute if entity @s[distance=..6,tag=gghe.raycast] positioned ^ ^ ^0.02 run function gghe:block/cooking_pot/interact/raycast