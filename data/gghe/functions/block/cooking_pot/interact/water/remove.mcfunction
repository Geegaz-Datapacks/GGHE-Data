
execute if score $gghe.count gghe.var matches 1.. run give @p[tag=gghe.interact.cooking_pot,gamemode=!creative] water_bucket
execute if score $gghe.count gghe.var matches ..0 run item replace entity @s weapon.mainhand with water_bucket
execute if score $gghe.count gghe.var matches ..0 run scoreboard players add $gghe.count gghe.var 1

# VFX

# SFX
playsound item.bucket.fill block @a[distance=..16] ~ ~1 ~
tag @s remove gghe.cooking_pot.has_water