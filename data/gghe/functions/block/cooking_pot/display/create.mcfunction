say create display
# Put the item in the offhand of the pot
tag @s add gghe.cooking_pot.display_target
summon bat ~ ~ ~ {Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["gghe.cooking_pot.display_provider"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:999999,ShowParticles:0b}]}
execute as @e[type=bat,tag=gghe.cooking_pot.display_provider] run function gghe:block/cooking_pot/display/provider
tag @s remove gghe.cooking_pot.display_target

# Create the display item
summon snowball ~ ~1 ~ {NoGravity:1b,Tags:["gghe.new","gghe.cooking_pot.display"]}
data modify entity @e[type=snowball,tag=gghe.cooking_pot.display,tag=gghe.new,limit=1,sort=nearest] Item set from entity @s HandItems[1]
tag @e[type=snowball] remove gghe.new

item replace entity @s weapon.offhand with air

data modify entity @s CustomNameVisible set value true
tag @s add gghe.cooking_pot.has_display