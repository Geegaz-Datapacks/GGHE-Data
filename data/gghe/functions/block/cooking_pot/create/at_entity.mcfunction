
# Get the pot's data from the item
data modify storage geegaz:gghe temp.CookingPot set from block ~ ~ ~ Items[{tag:{ctc:{id:'cooking_pot',from:'geegaz:gghe'}}}].tag.gghe.CookingPot

# Set the pot's scores
scoreboard players set @s gghe.items 0
execute store result score @s gghe.level run data get storage geegaz:gghe temp.CookingPot.Level
# Set the pot's item
function gghe:block/cooking_pot/update

# Clear the campfire
data remove block ~ ~ ~ Items[{tag:{ctc:{id:'cooking_pot',from:'geegaz:gghe'}}}]

data remove storage geegaz:gghe temp

tag @s remove gghe.new