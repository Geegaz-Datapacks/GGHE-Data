
execute as @s[scores={gghe.var=1}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[0]
execute as @s[scores={gghe.var=2}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[1]
execute as @s[scores={gghe.var=3}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[2]
execute as @s[scores={gghe.var=4}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[3]

# If current item is a container, drop it
execute as @s[predicate=gghe:tag/containers/bottles] run loot spawn ~ ~1 ~ loot gghe:items/glass_bottle
execute as @s[predicate=gghe:tag/containers/buckets] run loot spawn ~ ~1 ~ loot gghe:items/bucket

# Loop to next item
scoreboard players remove @s gghe.var 1
execute as @s[scores={gghe.var=1..}] run function gghe:block/cooking_pot/interact/recipe/check_containers

kill @s[scores={gghe.var=..0}]