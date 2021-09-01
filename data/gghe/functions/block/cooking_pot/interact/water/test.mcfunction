# Get previous state and new state
tag @s[predicate=gghe:items/bucket] add gghe.cooking_pot.remove_water

# Fail if the pot has levels or if trying to empty an already empty cooking pot
execute store success score @s gghe.var if score $gghe.level gghe.var matches 1..
execute as @s[scores={gghe.var=0}] store success score @s gghe.var if entity @s[tag=gghe.cooking_pot.remove_water,tag=!gghe.cooking_pot.has_water]
execute as @s[scores={gghe.var=0},tag=gghe.cooking_pot.remove_water] run function gghe:block/cooking_pot/interact/water/remove
execute as @s[scores={gghe.var=0},tag=!gghe.cooking_pot.remove_water] run function gghe:block/cooking_pot/interact/water/add
tag @s remove gghe.cooking_pot.remove_water
