# Recipe with a variable number of a single vanilla ingredient, using a tag

execute store result score $gghe.ingredient_1 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{item_tags:["gghe:ingredients/mushrooms"]}]
execute store success score @s gghe.var as @s[tag=gghe.cooking_pot.has_water] if score $gghe.compat.vanilla gghe.var = $gghe.ingredient_1 gghe.var
execute as @s[scores={gghe.var=1..}] run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/mushroom_stew",Servings:0,CookTime:0}
execute as @s[scores={gghe.var=1..}] store result storage geegaz:gghe temp.CookingPot.Recipe.Servings int 1.0 run scoreboard players get $gghe.ingredient_1 gghe.var
execute as @s[scores={gghe.var=1..}] store result storage geegaz:gghe temp.CookingPot.Recipe.CookTime int 150.0 run scoreboard players get $gghe.ingredient_1 gghe.var