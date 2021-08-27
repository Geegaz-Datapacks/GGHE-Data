# Score progress
execute as @s[tag=!gghe.cooking_pot.disabled] run scoreboard players remove @s gghe.var 1
execute as @s[tag=gghe.cooking_pot.disabled] if score @s gghe.var < @s gghe.CONST run scoreboard players add @s gghe.var 1

execute as @s[scores={gghe.var=..0}] run function gghe:block/cooking_pot/process/finish

# VFX

# SFX
