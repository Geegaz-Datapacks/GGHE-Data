
# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @p[tag=gghe.interact.cooking_pot] SelectedItem.tag.gghe.CookingPot
function gghe:block/cooking_pot/interact/get_data

# Fails if player used a helmet on the pot
tag @s[predicate=gghe:has_item_head] add gghe.interact_fail

execute if entity @p[tag=gghe.interact.cooking_pot,scores={gghe.sneak=1..}] run tag @s add gghe.interact_sneak

item replace entity @p[tag=gghe.interact.cooking_pot] weapon.mainhand from entity @s armor.head

# Test cases
execute as @s[tag=!gghe.interact_fail,tag=gghe.interact_sneak] run function gghe:block/cooking_pot/interact/get_item
execute as @s[tag=!gghe.interact_fail,tag=!gghe.interact_sneak] if score $gghe.items gghe.var matches 1.. run function gghe:block/cooking_pot/interact/ingredient/remove

# Update the pot
function gghe:block/cooking_pot/update

data remove storage geegaz:gghe temp
tag @s remove gghe.interact_fail
tag @s remove gghe.interact_sneak