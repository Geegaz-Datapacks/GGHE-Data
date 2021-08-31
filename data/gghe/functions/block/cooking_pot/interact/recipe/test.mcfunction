
# Setup data and scores
# - temp.Items stores unique items in a simplified list
# - $gghe.items stores the number of unique items
scoreboard players set $gghe.items gghe.var 0
data modify storage geegaz:gghe temp.Items set value []

# Simplify items
function gghe:block/cooking_pot/interact/recipe/query_items
# Store the simplified list
data modify storage geegaz:gghe temp.CookingPot.Items set from storage geegaz:gghe temp.Items

# Apply item tags on the simplified list
summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Tags:["gghe.cooking_pot.ingredient_provider","gghe.provider.item_tags"]}
execute as @e[type=armor_stand,tag=gghe.cooking_pot.ingredient_provider] run function gghe:block/cooking_pot/interact/recipe/provider

# Test the recipes
function #gghe:cooking_pot/recipes

