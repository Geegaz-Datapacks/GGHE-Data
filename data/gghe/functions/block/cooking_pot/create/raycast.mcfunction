
execute if entity @s[distance=..6] unless block ~ ~ ~ #campfires positioned ^ ^ ^0.02 run function gghe:block/cooking_pot/create/raycast
execute if block ~ ~ ~ #campfires align xyz positioned ~0.5 ~ ~0.5 run function gghe:block/cooking_pot/create/at_block