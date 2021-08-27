
# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @s ArmorItems[3].tag.gghe.CookingPot
data modify storage geegaz:gghe temp.Item set from entity @s HandItems[0]

execute as @p[tag=gghe.interact.cooking_pot] store result score $gghe.count gghe.var run data get entity @s SelectedItem.Count

# Fails if the item cannot be used on the cooking pot
execute as @s[predicate=!gghe:tag/cooking_pot_valid] run tag @s add gghe.interact_fail

# Test the current item
execute as @s[predicate=gghe:item/bowl,tag=!gghe.interact_fail] run function gghe:block/cooking_pot/interact/bowl/test
execute as @s[predicate=gghe:item/any_bucket,tag=!gghe.interact_fail] run function gghe:block/cooking_pot/interact/water/test
execute as @s[predicate=gghe:tag/ingredients,tag=!gghe.interact_fail] run function gghe:block/cooking_pot/interact/ingredient/test
# Update recipe
execute if entity @s[tag=!gghe.interact_fail,scores={gghe.cp.level=..0}] run function gghe:block/cooking_pot/interact/recipe/test

# Restore the item in the hand of the player
execute as @s[tag=gghe.interact_fail] as @p[tag=gghe.interact.cooking_pot,gamemode=!creative] run scoreboard players add $gghe.count gghe.var 1
item replace entity @p[tag=gghe.interact.cooking_pot] weapon.mainhand from entity @s weapon.mainhand gghe:count_from_score

function gghe:block/cooking_pot/update
item replace entity @s weapon.mainhand with air

scoreboard players reset $gghe.count

data remove storage geegaz:gghe temp

tag @s remove gghe.interact_fail