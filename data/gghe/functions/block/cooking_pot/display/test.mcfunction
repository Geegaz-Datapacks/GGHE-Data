say test display

execute as @s[tag=!gghe.cooking_pot.has_display] if score $gghe.level gghe.var matches 1.. run function gghe:block/cooking_pot/display/create
execute as @s[tag=gghe.cooking_pot.has_display] unless score $gghe.level gghe.var matches 1.. run function gghe:block/cooking_pot/display/remove

execute as @s[tag=gghe.cooking_pot.has_display] run function gghe:block/cooking_pot/display/update