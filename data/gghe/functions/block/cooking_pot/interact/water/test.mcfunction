# Get previous state and new state
tag @s[predicate=gghe:item/bucket] add gghe.cooking_pot.remove_water

# Fail if trying to empty an already empty cooking pot or if the pot has levels
tag @s[scores={gghe.level=1..}] add gghe.interact_fail
tag @s[tag=!gghe.cooking_pot.has_water,tag=gghe.cooking_pot.remove_water] add gghe.interact_fail
execute as @s[tag=!gghe.interact_fail,tag=gghe.cooking_pot.remove_water] run function gghe:block/cooking_pot/interact/water/remove
execute as @s[tag=!gghe.interact_fail,tag=!gghe.cooking_pot.remove_water] run function gghe:block/cooking_pot/interact/water/add

tag @s remove gghe.cooking_pot.remove_water