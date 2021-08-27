# Reset recipe
data remove storage geegaz:gghe temp.CookingPot.Recipe

# Get amount of items with tags
#summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Tags:["gghe.cooking_pot.ingredient_provider"]}
#scoreboard players operation @e[type=armor_stand,tag=gghe.cooking_pot.ingredient_provider] gghe.cp.items = @s gghe.cp.items
#execute as @e[type=armor_stand,tag=gghe.cooking_pot.ingredient_provider,limit=1,sort=nearest] run function gghe:block/cooking_pot/interact/recipe/check_ingredients

execute as @s[scores={gghe.cp.items=1}] run function #gghe:cooking_pot/recipes_1
execute as @s[scores={gghe.cp.items=2}] run function #gghe:cooking_pot/recipes_2
execute as @s[scores={gghe.cp.items=3}] run function #gghe:cooking_pot/recipes_3
execute as @s[scores={gghe.cp.items=4}] run function #gghe:cooking_pot/recipes_4

execute if data storage geegaz:gghe temp.CookingPot.Recipe run tellraw @a [{"text":"[Debug] Recipe: "},{"nbt":"temp.CookingPot.Recipe","storage":"geegaz:gghe","interpret":false}]

scoreboard players reset $gghe.ingredient_1
scoreboard players reset $gghe.ingredient_2
scoreboard players reset $gghe.ingredient_3
scoreboard players reset $gghe.ingredient_4

#scoreboard players reset $gghe.tag.fishes
#scoreboard players reset $gghe.tag.fruits
#scoreboard players reset $gghe.tag.meats
#scoreboard players reset $gghe.tag.mushrooms
#scoreboard players reset $gghe.tag.sweets
#scoreboard players reset $gghe.tag.vegetables