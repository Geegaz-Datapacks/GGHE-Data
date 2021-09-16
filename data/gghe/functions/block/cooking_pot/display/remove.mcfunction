
# Put the item in the offhand of the pot
tag @s add gghe.cooking_pot.display_target
summon bat ~ ~ ~ {Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["gghe.cooking_pot.display_provider"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:999999,ShowParticles:0b}]}
execute as @e[type=bat,tag=gghe.cooking_pot.display_provider] run function gghe:block/cooking_pot/display/provider
tag @s remove gghe.cooking_pot.display_target

# Set the entity's name from the recipe item's name
data modify entity @s CustomName set from entity @s HandItems[0].tag.display.Name
item replace entity @s weapon.mainhand with air

# Remove the display item
execute positioned ~ ~1 ~ run kill @e[type=snowball,tag=gghe.cooking_pot.display,distance=..0.5]

data modify entity @s CustomNameVisible set value false
tag @s remove gghe.cooking_pot.has_display