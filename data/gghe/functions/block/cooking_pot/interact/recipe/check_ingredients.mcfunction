# Unused in the datapack, but kept for reference

execute as @s[scores={gghe.items=1}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[0]
execute as @s[scores={gghe.items=2}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[1]
execute as @s[scores={gghe.items=3}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[2]
execute as @s[scores={gghe.items=4}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[3]

# Check ingredient tags for the current item
execute as @s[predicate=gghe:tag/ingredients/fishes] run scoreboard players add $gghe.tag.fishes gghe.var 1
execute as @s[predicate=gghe:tag/ingredients/fruits] run scoreboard players add $gghe.tag.fruits gghe.var 1
execute as @s[predicate=gghe:tag/ingredients/meats] run scoreboard players add $gghe.tag.meats gghe.var 1
execute as @s[predicate=gghe:tag/ingredients/mushrooms] run scoreboard players add $gghe.tag.mushrooms gghe.var 1
execute as @s[predicate=gghe:tag/ingredients/sweets] run scoreboard players add $gghe.tag.sweets gghe.var 1
execute as @s[predicate=gghe:tag/ingredients/vegetables] run scoreboard players add $gghe.tag.vegetables gghe.var 1

# Loop to next item
scoreboard players remove @s gghe.items 1
execute as @s[scores={gghe.items=1..}] run function gghe:block/cooking_pot/interact/recipe/check_ingredients

kill @s[scores={gghe.items=..0}]