# Fail if there aren't enough levels left
tag @s[scores={gghe.cp.level=..0}] add gghe.interact.fail

scoreboard players remove @s[tag=!gghe.interact.fail] gghe.cp.level 1

# Give the right recipe
tag @s add gghe.cooking_pot.recipe_target
execute as @s[tag=!gghe.interact.fail] run summon bat ~ ~ ~ {Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["gghe.cooking_pot.recipe_provider"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:999999,ShowParticles:0b}]}
execute as @e[type=bat,tag=gghe.cooking_pot.recipe_provider] run function gghe:block/cooking_pot/interact/bowl/provider

# VFX

# SFX
execute as @s[tag=!gghe.interact.fail] run playsound minecraft:item.bucket.fill_powder_snow block @a[distance=..16] ~ ~1 ~ 2 0.8

tag @s remove gghe.cooking_pot.recipe_target