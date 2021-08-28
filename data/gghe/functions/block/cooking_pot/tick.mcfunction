
execute as @s[tag=gghe.cooking_pot.disabled] if block ~ ~ ~ #minecraft:campfires[lit=true] run tag @s remove gghe.cooking_pot.disabled
execute as @s[tag=!gghe.cooking_pot.disabled] if block ~ ~ ~ #minecraft:campfires[lit=false] run tag @s add gghe.cooking_pot.disabled

execute as @s[tag=gghe.cooking_pot.process] run function gghe:block/cooking_pot/process

execute unless block ~ ~ ~ #campfires run function gghe:block/cooking_pot/destroy