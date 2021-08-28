
execute as @s[tag=gghe.cooking_pot.disabled] if block ~ ~ ~ #minecraft:campfires[lit=true] run function gghe:block/cooking_pot/process/start
execute as @s[tag=!gghe.cooking_pot.disabled] if block ~ ~ ~ #minecraft:campfires[lit=false] run function gghe:block/cooking_pot/process/stop

execute as @s[tag=gghe.cooking_pot.process,tag=!gghe.cooking_pot.disabled] run function gghe:block/cooking_pot/process
execute as @s[tag=gghe.cooking_pot.process,tag=gghe.cooking_pot.disabled] if score @s gghe.time < @s gghe.CONST run scoreboard players add @s gghe.time 1

execute unless block ~ ~ ~ #campfires run function gghe:block/cooking_pot/destroy