# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @p[tag=gghe.interact.cooking_pot] SelectedItem.tag.gghe.CookingPot

# Fails if player used a helmet on the pot
tag @s[predicate=gghe:has_item_head] add gghe.interact.helmet

execute if entity @p[tag=gghe.interact.cooking_pot,scores={gghe.sneak=1..}] run tag @s add gghe.interact.sneak

execute as @s[tag=!gghe.interact.helmet] run item replace entity @p[tag=gghe.interact.cooking_pot] weapon.mainhand with air
execute as @s[tag=gghe.interact.helmet] run item replace entity @p[tag=gghe.interact.cooking_pot] weapon.mainhand from entity @s armor.head

# Test cases
execute as @s[tag=!gghe.interact.helmet,tag=gghe.interact.sneak] run function gghe:block/cooking_pot/destroy/get_item
execute as @s[tag=!gghe.interact.helmet,tag=!gghe.interact.sneak,scores={gghe.cp.items=1..}] run function gghe:block/cooking_pot/interact/ingredient/remove

execute as @s[tag=!gghe.interact.sneak] run function gghe:block/cooking_pot/update

data remove storage geegaz:gghe temp

tag @s remove gghe.interact.helmet
tag @s remove gghe.interact.sneak