
execute if entity @p[tag=gghe.interact.cooking_pot,gamemode=!creative] run item replace entity @s weapon.mainhand with bucket
execute if entity @p[tag=gghe.interact.cooking_pot,gamemode=!creative] run scoreboard players add $gghe.count gghe.var 1

# VFX
#particle minecraft:splash ~ ~1 ~ 0.1 0 0.1 1 10 -> parity with cauldron
# SFX
playsound item.bucket.empty block @a[distance=..16] ~ ~1 ~
tag @s add gghe.cooking_pot.has_water
