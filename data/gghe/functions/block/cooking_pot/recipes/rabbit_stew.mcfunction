# Recipe with 4 vanilla ingredients, one with 2 possible values

execute store result score $gghe.ingredient_1 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:rabbit"}]
execute store result score $gghe.ingredient_2 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:potato"}]
execute store result score $gghe.ingredient_3 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:carrot"}]
execute store result score $gghe.ingredient_4 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:red_mushroom"}]
execute store result score $gghe.additional_1 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:brown_mushroom"}]
scoreboard players operation $gghe.ingredient_4 gghe.var += $gghe.additional_1 gghe.var
execute as @s[tag=gghe.cooking_pot.has_water] if score $gghe.compat.vanilla gghe.var matches 4 if score $gghe.ingredient_1 gghe.var matches 1 if score $gghe.ingredient_2 gghe.var matches 1 if score $gghe.ingredient_3 gghe.var matches 1 if score $gghe.ingredient_2 gghe.var matches 1 run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/rabbit_stew",Servings:2,CookTime:600}
scoreboard players reset $gghe.additional_1