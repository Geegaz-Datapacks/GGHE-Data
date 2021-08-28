# Score progress
execute as @s[tag=!gghe.cooking_pot.disabled] run scoreboard players remove @s gghe.time 1
execute as @s[tag=gghe.cooking_pot.disabled] if score @s gghe.time < @s gghe.CONST run scoreboard players add @s gghe.time 1

execute if score @s gghe.time < @s gghe.CONST run function gghe:block/cooking_pot/process/animate
execute as @s[scores={gghe.time=..0}] run function gghe:block/cooking_pot/process/finish

# VFX
execute as @s[tag=!gghe.cooking_pot.disabled,tag=gghe.cooking_pot.has_water] run particle minecraft:bubble_pop ~ ~1.15 ~ 0.12 0 0.12 0 1
# SFX
