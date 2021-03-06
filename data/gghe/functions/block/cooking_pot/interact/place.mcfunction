
# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @s ArmorItems[3].tag.gghe.CookingPot
function gghe:block/cooking_pot/interact/get_data

# Store the remaining number of items in the player's hand in a score
execute as @p[tag=gghe.interact] store result score $gghe.count gghe.var run data get entity @s SelectedItem.Count

# Fails if the item cannot be used on the cooking pot
execute store success score @s gghe.var unless predicate gghe:tags/cooking_pot_valid
# Test the current item
execute as @s[scores={gghe.var=0},predicate=gghe:items/bowl] run function gghe:block/cooking_pot/interact/bowl/test
execute as @s[scores={gghe.var=0},predicate=gghe:items/any_bucket] run function gghe:block/cooking_pot/interact/water/test
execute as @s[scores={gghe.var=0},predicate=gghe:tags/ingredients] run function gghe:block/cooking_pot/interact/ingredient/test

# Restore the item in the hand of the player
execute as @s[scores={gghe.var=1}] as @p[tag=gghe.interact,gamemode=!creative] run scoreboard players add $gghe.count gghe.var 1
item replace entity @p[tag=gghe.interact] weapon.mainhand from entity @s weapon.mainhand gghe:count_from_score

# Update the pot
function gghe:block/cooking_pot/interact/set_data

data remove storage geegaz:gghe temp