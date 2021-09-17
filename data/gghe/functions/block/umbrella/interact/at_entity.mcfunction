tag @p[tag=gghe.interact] remove gghe.raycast

execute if entity @s[predicate=gghe:has_chestplate_chest] run tag @s add gghe.chestplate
execute if entity @s[tag=gghe.chestplate] run function gghe:block/umbrella/interact/chestplate
execute if entity @s[tag=!gghe.chestplate] run function gghe:block/umbrella/interact/take
tag @s remove gghe.chestplate

