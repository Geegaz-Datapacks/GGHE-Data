
# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from block ~ ~ ~ Items[{tag:{gghe:{CookingPot:{}}}}].tag.gghe.CookingPot
function gghe:block/cooking_pot/interact/get_data

# Fail if there's already a pot
execute if entity @e[type=armor_stand,tag=gghe.cooking_pot,distance=..0.5] run tag @s add gghe.create_fail

# Create and update the pot
execute as @s[tag=!gghe.create_fail] run summon armor_stand ~ ~ ~ {NoGravity:1b,Small:1b,Invisible:1b,Silent:1b,ShowArms:1b,DisabledSlots:4075310,Tags:["global.ignore","gghe.new","gghe.block","gghe.cooking_pot"]}
execute as @e[type=armor_stand,tag=gghe.cooking_pot,tag=gghe.new] run function gghe:block/cooking_pot/create/at_entity

# If placing the pot failed, give the item back
execute as @s[tag=gghe.create_fail] run function gghe:block/cooking_pot/interact/set_item
execute as @s[tag=gghe.create_fail,gamemode=!creative] run loot give @s loot gghe:items/cooking_pot

# Clear the campfire
data remove block ~ ~ ~ Items[{tag:{gghe:{CookingPot:{}}}}]

data remove storage geegaz:gghe temp

tag @s remove gghe.create_fail