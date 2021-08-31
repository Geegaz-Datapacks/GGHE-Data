
# Get the item 
data modify entity @s HandItems[0] set from storage geegaz:gghe temp.Items[-1]
data remove storage geegaz:gghe temp.Items[-1]
# Spawn the container using a loot table
loot spawn ~ ~1 ~ loot gghe:cooking_pot/containers

# Loop if there still are items to test
execute if data storage geegaz:gghe temp.Items[] run function gghe:block/cooking_pot/interact/recipe/test_containers