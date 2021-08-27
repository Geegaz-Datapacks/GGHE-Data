
# Fail if there's already a pot
execute if entity @e[type=armor_stand,tag=gghe.cooking_pot,distance=..0.5] run tag @s add gghe.create_fail

# Create the pot's entity
execute as @s[tag=!gghe.create_fail] run summon armor_stand ~ ~ ~ {NoGravity:1b,Silent:1b,ShowArms:1b,Small:1b,Invisible:1b,DisabledSlots:4075310,Tags:["gghe.new","gghe.block","gghe.cooking_pot"]}
execute as @e[type=armor_stand, tag=gghe.new, tag=gghe.cooking_pot] run function gghe:block/cooking_pot/create/at_entity

# Clear the campfire
data remove block ~ ~ ~ Items[{tag:{ctc:{id:'cooking_pot',from:'geegaz:gghe'}}}]