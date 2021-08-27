# Shapeless recipe with 3 items
execute store result score $gghe.ingredient_1 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:chicken"}]
execute store result score $gghe.ingredient_2 gghe.var if data storage geegaz:gghe temp.CookingPot.Items[{id:"minecraft:potato"}]
execute as @s[tag=!gghe.cooking_pot.has_water] if score $gghe.ingredient_1 gghe.var matches 1 if score $gghe.ingredient_2 gghe.var matches 2 run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/roast_chicken",Servings:2,CookTime:400}