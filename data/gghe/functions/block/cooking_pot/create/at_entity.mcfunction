
# Get the pot's data from the item
data modify storage geegaz:gghe temp.CookingPot set from block ~ ~ ~ Items[{tag:{ctc:{id:'cooking_pot',from:'geegaz:gghe'}}}].tag.gghe.CookingPot

# Set the pot's scores
execute store result score @s gghe.cp.level run data get storage geegaz:gghe temp.CookingPot.Level
scoreboard players set @s gghe.cp.items 0

tellraw @a[tag=gghe.debug] [{"translate":"[DEBUG] [Cooking Pot]"},{"text":" Placed Cooking Pot: "},{"nbt":"temp.CookingPot","storage":"geegaz:gghe","interpret":false}]

function gghe:block/cooking_pot/update

data remove storage geegaz:gghe temp

tag @s remove gghe.new