# Reset recipe
data remove storage geegaz:gghe temp.CookingPot.Recipe

# Get the amount of custom items
summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Tags:["gghe.cooking_pot.ingredient_provider"]}
scoreboard players operation @e[type=armor_stand,tag=gghe.cooking_pot.ingredient_provider] gghe.var = $gghe.items gghe.var
execute as @e[type=armor_stand,tag=gghe.cooking_pot.ingredient_provider,limit=1,sort=nearest] run function gghe:block/cooking_pot/interact/recipe/check_compat

scoreboard players operation $gghe.compat.vanilla gghe.var = $gghe.items gghe.var
scoreboard players operation $gghe.compat.vanilla gghe.var -= $gghe.compat.ctc gghe.var
scoreboard players operation $gghe.compat.vanilla gghe.var -= $gghe.compat.tcc gghe.var

# Test the recipes corresponding to the right amount of items
execute if score $gghe.items gghe.var matches 1 run function #gghe:cooking_pot/recipes_1
execute if score $gghe.items gghe.var matches 2 run function #gghe:cooking_pot/recipes_2
execute if score $gghe.items gghe.var matches 3 run function #gghe:cooking_pot/recipes_3
execute if score $gghe.items gghe.var matches 4 run function #gghe:cooking_pot/recipes_4

function gghe:block/cooking_pot/process/init

scoreboard players reset $gghe.ingredient_1
scoreboard players reset $gghe.ingredient_2
scoreboard players reset $gghe.ingredient_3
scoreboard players reset $gghe.ingredient_4

scoreboard players reset $gghe.compat.vanilla
scoreboard players reset $gghe.compat.ctc
scoreboard players reset $gghe.compat.tcc