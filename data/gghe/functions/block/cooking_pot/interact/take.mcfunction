
# Returns the pot's item
item replace entity @s armor.head from entity @p[tag=gghe.interact.cooking_pot] weapon.mainhand
item replace entity @p[tag=gghe.interact.cooking_pot] weapon.mainhand with air

# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @s ArmorItems[3].tag.gghe.CookingPot

# Fail if there's no items in the pot
tag @s[scores={gghe.items=..0}] add gghe.interact_fail

# Remove the item(s)
execute as @s[tag=!gghe.interact_fail] if entity @p[tag=gghe.interact.cooking_pot,predicate=gghe:is_sneaking] run function gghe:block/cooking_pot/interact/ingredient/remove_all
execute as @s[tag=!gghe.interact_fail] if entity @p[tag=gghe.interact.cooking_pot,predicate=!gghe:is_sneaking] run function gghe:block/cooking_pot/interact/ingredient/remove
# Update recipe
execute as @s[tag=!gghe.interact_fail] run function gghe:block/cooking_pot/interact/recipe/test

function gghe:block/cooking_pot/update

data remove storage geegaz:gghe temp

tag @p[tag=gghe.interact.cooking_pot] remove gghe.interact.cooking_pot
tag @s remove gghe.interact_fail