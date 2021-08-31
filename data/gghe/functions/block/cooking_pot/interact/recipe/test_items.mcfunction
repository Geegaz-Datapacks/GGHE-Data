
# Reset the test variable
scoreboard players set @s gghe.var 1
# Test the item against the ones in the simplified list
execute if score $gghe.items gghe.var matches 1.. run function gghe:block/cooking_pot/interact/recipe/test_item/source
execute as @s[scores={gghe.var=1}] if score $gghe.items gghe.var matches 1.. run function gghe:block/cooking_pot/interact/recipe/test_item/0
execute as @s[scores={gghe.var=1}] if score $gghe.items gghe.var matches 2.. run function gghe:block/cooking_pot/interact/recipe/test_item/1
execute as @s[scores={gghe.var=1}] if score $gghe.items gghe.var matches 3.. run function gghe:block/cooking_pot/interact/recipe/test_item/2
# If the item didn't match any existing one, add it to the simplified list
execute as @s[scores={gghe.var=1}] run function gghe:block/cooking_pot/interact/recipe/append_item
data remove storage geegaz:gghe temp.Items[-1]

# Loop if there still are items to test
execute if data storage geegaz:gghe temp.Items[] run function gghe:block/cooking_pot/interact/recipe/test_items