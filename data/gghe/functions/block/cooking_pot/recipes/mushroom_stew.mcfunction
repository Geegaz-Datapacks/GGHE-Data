# Recipe with a variable number of a single vanilla ingredient, with 2 possible values

execute store result score $gghe.ingredient_1 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:brown_mushroom"}]
execute store result score $gghe.ingredient_2 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:red_mushroom"}]
scoreboard players operation $gghe.ingredient_1 gghe.var += $gghe.ingredient_2 gghe.var
execute as @s[tag=gghe.cooking_pot.has_water] if score $gghe.compat.vanilla gghe.var = $gghe.ingredient_1 gghe.var run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/mushroom_stew",Servings:0,CookTime:400}
execute as @s[tag=gghe.cooking_pot.has_water] if score $gghe.compat.vanilla gghe.var = $gghe.ingredient_1 gghe.var store result storage geegaz:gghe temp.CookingPot.Recipe.Servings int 1.0 run scoreboard players get $gghe.ingredient_1 gghe.var