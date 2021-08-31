# This is adapted from https://github.com/TheNuclearNexus/SmithedCrafter/tree/master/datapack/data/smithed/functions/crafter/block/table/crafting/shapeless_recipes
# Update the recipe

# Reset recipe
data remove storage geegaz:gghe temp.CookingPot.Recipe
# Test recipe only if there are items in the pot
execute if score $gghe.items gghe.var matches 1.. run function gghe:block/cooking_pot/interact/recipe/test

function gghe:block/cooking_pot/process/init