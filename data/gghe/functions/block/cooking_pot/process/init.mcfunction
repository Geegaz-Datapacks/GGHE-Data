# Set the max and current progress scores
execute store result score @s gghe.CONST run data get storage geegaz:gghe temp.CookingPot.Recipe.CookTime
scoreboard players operation @s gghe.var = @s gghe.CONST

tag @s[scores={gghe.CONST=1..}] add gghe.cooking_pot.process
tag @s[scores={gghe.CONST=..0}] remove gghe.cooking_pot.process

execute as @s[tag=gghe.cooking_pot.process] run tellraw @a[tag=gghe.debug] [{"translate":"[DEBUG] [Cooking Pot]"},{"text":" Initialized recipe: "},{"nbt":"temp.CookingPot.Recipe.id","storage":"geegaz:gghe","interpret":false},{"text":", "},{"nbt":"temp.CookingPot.Recipe.CookTime","storage":"geegaz:gghe","interpret":false},{"text":" ticks"}]