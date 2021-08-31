
# Set the amount of items when creating the entity
execute unless score @s gghe.var = @s gghe.var run scoreboard players operation @s gghe.var = $gghe.items gghe.var

execute as @s[scores={gghe.var=1}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[0]
execute as @s[scores={gghe.var=2}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[1]
execute as @s[scores={gghe.var=3}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[2]
execute as @s[scores={gghe.var=4}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[3]

# Test if the current item is a container
execute as @s[tag=gghe.provider.containers,predicate=gghe:tags/containers] run loot spawn ~ ~1 ~ loot gghe:cooking_pot/containers
# Test tags for the current item
execute as @s[tag=gghe.provider.item_tags] run function gghe:block/cooking_pot/interact/recipe/test_tags

# Loop to next item
scoreboard players remove @s gghe.var 1
execute as @s[scores={gghe.var=1..}] run function gghe:block/cooking_pot/interact/recipe/provider

kill @s[scores={gghe.var=..0}]