
execute as @s[scores={gghe.cp.items=1}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[0]
execute as @s[scores={gghe.cp.items=2}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[1]
execute as @s[scores={gghe.cp.items=3}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[2]
execute as @s[scores={gghe.cp.items=4}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[3]

# Check modifiers for the current item
execute as @s[predicate=gghe:tag/modifiers/golden] run scoreboard players add $gghe.modifier.golden gghe.var 1
execute as @s[predicate=gghe:tag/modifiers/has_bottle] run scoreboard players add $gghe.modifier.has_bottle gghe.var 1
execute as @s[predicate=gghe:tag/modifiers/has_bucket] run scoreboard players add $gghe.modifier.has_bucket gghe.var 1
execute as @s[predicate=gghe:tag/modifiers/unhealthy] run scoreboard players add $gghe.modifier.unhealthy gghe.var 1

# Loop to next item
scoreboard players remove @s gghe.cp.items 1
execute as @s[scores={gghe.cp.items=1..}] run function gghe:block/cooking_pot/interact/recipe/check_modifiers

kill @s[scores={gghe.cp.items=..0}]