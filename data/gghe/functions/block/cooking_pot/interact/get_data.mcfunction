
# Set the temp scores
execute store result score $gghe.level gghe.var run data get storage geegaz:gghe temp.CookingPot.Level
execute store result score $gghe.items gghe.var if data storage geegaz:gghe temp.CookingPot.Items[]
execute store result score @s gghe.var run data get storage geegaz:gghe temp.CookingPot.HasWater

execute as @s[scores={gghe.var=1..}] run tag @s add gghe.cooking_pot.has_water
execute as @s[scores={gghe.var=..0}] run tag @s remove gghe.cooking_pot.has_water