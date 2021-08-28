
execute as @s[scores={gghe.var=1}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[0]
execute as @s[scores={gghe.var=2}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[1]
execute as @s[scores={gghe.var=3}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[2]
execute as @s[scores={gghe.var=4}] run data modify entity @s HandItems[0] set from storage geegaz:gghe temp.CookingPot.Items[3]

# Check compatibility tags for the current item
execute as @s[predicate=gghe:tag/compat/ctc] run scoreboard players add $gghe.compat.ctc gghe.var 1
execute as @s[predicate=gghe:tag/compat/tcc] run scoreboard players add $gghe.compat.tcc gghe.var 1

# Loop to next item
scoreboard players remove @s gghe.var 1
execute as @s[scores={gghe.var=1..}] run function gghe:block/cooking_pot/interact/recipe/check_compat

kill @s[scores={gghe.var=..0}]