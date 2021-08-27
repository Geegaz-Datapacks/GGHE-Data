# Recipe with a single vanilla ingredient

execute store result score $gghe.ingredient_1 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:beetroot"}]
execute as @s[tag=gghe.cooking_pot.has_water] if score $gghe.compat.vanilla gghe.var matches 4 if score $gghe.ingredient_1 gghe.var matches 4 run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/beetroot_soup",Servings:2,CookTime:400}
