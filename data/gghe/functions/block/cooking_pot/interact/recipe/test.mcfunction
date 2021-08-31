
# Setup data and scores
# - temp.Items is the original list of items
# - temp.SimplifiedItems stores unique items with their amount
# - $gghe.items stores the number of unique items
data modify storage geegaz:gghe temp.Items set from storage geegaz:gghe temp.CookingPot.Items
data modify storage geegaz:gghe temp.SimplifiedItems set value []
scoreboard players set $gghe.items gghe.var 0

# Simplify items
function gghe:block/cooking_pot/interact/recipe/test_items
# Store the simplified list
data modify storage geegaz:gghe temp.Items set from storage geegaz:gghe temp.SimplifiedItems
# Apply item tags on the simplified list
function gghe:block/cooking_pot/interact/recipe/test_tags

tellraw @a {"nbt":"temp.Items","storage":"geegaz:gghe","interpret":false}

# Reset the test variable
scoreboard players set @s gghe.var 0
# Test the recipes
function #gghe:cooking_pot/recipes

