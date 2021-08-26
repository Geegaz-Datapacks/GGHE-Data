
# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @s ArmorItems[3].tag.gghe.CookingPot
data modify storage geegaz:gghe temp.Item set from entity @s HandItems[0]

execute as @p[tag=gghe.interact.cooking_pot] store result score $gghe.count gghe.var run data get entity @s SelectedItem.Count

# Fails if the item cannot be used on the cooking pot
execute unless predicate gghe:tag/cooking_pot_valid run tag @s add gghe.interact_fail

# Test if player is removing the items
execute if entity @p[tag=gghe.interact.cooking_pot,predicate=gghe:is_sneaking] run tag @s add gghe.interact_fail
execute as @s[scores={gghe.items=1..}] if entity @p[tag=gghe.interact.cooking_pot,predicate=gghe:is_sneaking] run function gghe:block/cooking_pot/interact/ingredient/remove_all
# Test the current item
execute as @s[predicate=gghe:item/bowl,tag=!gghe.interact_fail] run function gghe:block/cooking_pot/interact/bowl/test
execute as @s[predicate=gghe:item/any_bucket,tag=!gghe.interact_fail] run function gghe:block/cooking_pot/interact/water/test
execute as @s[predicate=gghe:tag/ingredients,tag=!gghe.interact_fail] run function gghe:block/cooking_pot/interact/ingredient/test
# Test recipes
#execute as @s[tag=!gghe.interact_fail] run function gghe:block/cooking_pot/recipes/test

# Restore the item in the hand of the player
execute as @s[tag=gghe.interact_fail] as @p[tag=gghe.interact.cooking_pot,gamemode=!creative] run scoreboard players add $gghe.count gghe.var 1
item replace entity @p[tag=gghe.interact.cooking_pot] weapon.mainhand from entity @s weapon.mainhand gghe:count_from_score
scoreboard players reset $gghe.count

# Set the pot's items
function gghe:block/cooking_pot/update
item replace entity @s weapon.mainhand with air

data remove storage geegaz:gghe temp

tag @p[tag=gghe.interact.cooking_pot] remove gghe.interact.cooking_pot
tag @s remove gghe.interact_fail