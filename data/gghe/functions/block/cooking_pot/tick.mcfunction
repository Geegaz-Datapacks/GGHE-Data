
execute if predicate gghe:has_item_mainhand run function gghe:block/cooking_pot/interact/place
execute unless predicate gghe:has_item_head run function gghe:block/cooking_pot/interact/take
execute unless block ~ ~ ~ #campfires run function gghe:block/cooking_pot/destroy

execute as @s[tag=gghe.cooking_pot.process] run function gghe:block/cooking_pot/process

execute as @s[tag=gghe.cooking_pot.disabled] if block ~ ~ ~ #minecraft:campfires[lit=true] run tag @s remove gghe.cooking_pot.disabled
execute as @s[tag=!gghe.cooking_pot.disabled] if block ~ ~ ~ #minecraft:campfires[lit=false] run tag @s add gghe.cooking_pot.disabled

# VFX
execute as @s[tag=!gghe.cooking_pot.disabled,tag=gghe.cooking_pot.has_water] run particle minecraft:bubble_pop ~ ~1.15 ~ 0.12 0 0.12 0 1
# SFX