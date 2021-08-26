
# Fail if there are already 4 ingredients or if the pot has levels
tag @s[scores={gghe.level=1..}] add gghe.interact_fail
tag @s[scores={gghe.items=4..}] add gghe.interact_fail

# Create the item and place it at the right place
execute as @s[tag=!gghe.interact_fail] run function gghe:block/cooking_pot/interact/ingredient/add


