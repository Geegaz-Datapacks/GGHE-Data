
tag @s remove gghe.raycast

# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from block ~ ~ ~ Items[{tag:{gghe:{CookingPot:{}}}}].tag.gghe.CookingPot

# Create and update the pot
summon armor_stand ~ ~ ~ {NoGravity:1b,Small:1b,Invisible:1b,Silent:1b,ShowArms:1b,DisabledSlots:4075310,Tags:["global.ignore","gghe.new","gghe.block","gghe.cooking_pot"]}
execute as @e[type=armor_stand,tag=gghe.cooking_pot,tag=gghe.new] run function gghe:block/cooking_pot/create/at_entity

# Clear the campfire
data remove block ~ ~ ~ Items[{tag:{gghe:{CookingPot:{}}}}]

data remove storage geegaz:gghe temp
