
# Fail if there are already 4 ingredients or if the pot has levels
execute store success score @s gghe.var if score $gghe.level gghe.var matches 1..
execute as @s[scores={gghe.var=0}] store success score @s gghe.var if score $gghe.items gghe.var matches 4..

# Create the item and place it at the right place
execute as @s[scores={gghe.var=0}] run function gghe:block/cooking_pot/interact/ingredient/add


