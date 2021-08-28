# Recipe with 3 vanilla ingredients

execute store result score $gghe.ingredient_1 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:milk_bucket"}]
execute store result score $gghe.ingredient_2 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:cocoa_beans"}]
execute as @s[tag=!gghe.cooking_pot.has_water] if score $gghe.compat.vanilla gghe.var matches 3 if score $gghe.ingredient_1 gghe.var matches 1 if score $gghe.ingredient_2 gghe.var matches 2 run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/hot_cocoa",Servings:2,CookTime:200}