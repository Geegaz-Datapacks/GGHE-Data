
# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @p[tag=gghe.interact] SelectedItem.tag.gghe.CookingPot
function gghe:block/cooking_pot/interact/get_data

# Test if the player is sneaking
execute if entity @p[tag=gghe.interact,scores={gghe.sneak=1..}] run tag @s add gghe.interact_sneak

# Fails if player used a helmet on the pot
execute store success score @s gghe.var if predicate gghe:has_item_head
item replace entity @p[tag=gghe.interact] weapon.mainhand from entity @s armor.head
# Test cases
execute as @s[scores={gghe.var=0},tag=gghe.interact_sneak] run function gghe:block/cooking_pot/interact/set_item
execute as @s[scores={gghe.var=0},tag=!gghe.interact_sneak] if score $gghe.items gghe.var matches 1.. run function gghe:block/cooking_pot/interact/ingredient/remove

# Update the pot
function gghe:block/cooking_pot/interact/set_data

data remove storage geegaz:gghe temp
tag @s remove gghe.interact_sneak