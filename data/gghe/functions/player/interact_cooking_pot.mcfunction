tag @s add gghe.interact.cooking_pot

execute as @e[type=armor_stand,tag=gghe.cooking_pot,distance=..6,predicate=gghe:has_item_mainhand] at @s run function gghe:block/cooking_pot/interact/place
execute as @e[type=armor_stand,tag=gghe.cooking_pot,distance=..6,predicate=!gghe:has_cooking_pot_head] at @s run function gghe:block/cooking_pot/interact/take

tag @s remove gghe.interact.cooking_pot
advancement revoke @s only gghe:interact_cooking_pot