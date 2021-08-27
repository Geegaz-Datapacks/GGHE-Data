
execute as @s[scores={gghe.cp.items=1}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[0]
execute as @s[scores={gghe.cp.items=2}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[1]
execute as @s[scores={gghe.cp.items=3}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[2]
execute as @s[scores={gghe.cp.items=4}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[3]

# Check containers for the current item
execute as @s[predicate=gghe:tag/containers/bottles] run scoreboard players add $gghe.container.bottle gghe.var 1
execute as @s[predicate=gghe:tag/containers/buckets] run scoreboard players add $gghe.container.bucket gghe.var 1

# Loop to next item
scoreboard players remove @s gghe.cp.items 1
execute as @s[scores={gghe.cp.items=1..}] run function gghe:block/cooking_pot/interact/recipe/check_containers

kill @s[scores={gghe.cp.items=..0}]