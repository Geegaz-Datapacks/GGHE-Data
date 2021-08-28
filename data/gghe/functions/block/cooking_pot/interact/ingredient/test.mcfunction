
# Fail if there are already 4 ingredients or if the pot has levels
execute if score $gghe.level gghe.var matches 1.. run tag @s add gghe.interact_fail
execute if score $gghe.items gghe.var matches 4.. run tag @s add gghe.interact_fail

# Create the item and place it at the right place
execute as @s[tag=!gghe.interact_fail] run function gghe:block/cooking_pot/interact/ingredient/add


