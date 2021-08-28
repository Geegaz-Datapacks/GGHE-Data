# Fail if there aren't enough levels left
execute unless score $gghe.level gghe.var matches 1.. run tag @s add gghe.interact_fail

# Lower the pot's level
execute as @s[tag=!gghe.interact_fail] run scoreboard players remove $gghe.level gghe.var 1

# Give the right recipe
tag @s add gghe.cooking_pot.recipe_target
execute as @s[tag=!gghe.interact_fail] run summon bat ~ ~ ~ {Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["gghe.cooking_pot.recipe_provider"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:999999,ShowParticles:0b}]}
execute as @e[type=bat,tag=gghe.cooking_pot.recipe_provider] run function gghe:block/cooking_pot/interact/bowl/provider

# VFX

# SFX
execute as @s[tag=!gghe.interact_fail] run playsound minecraft:item.armor.equip_generic block @a[distance=..16] ~ ~1 ~ 0.5 0.5

tag @s remove gghe.cooking_pot.recipe_target