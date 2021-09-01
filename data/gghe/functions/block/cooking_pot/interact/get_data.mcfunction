
# Set items score
execute store result score $gghe.items gghe.var if data storage geegaz:gghe temp.CookingPot.Items[]
# Set level score
execute store result score $gghe.level gghe.var run data get storage geegaz:gghe temp.CookingPot.Level
# Set has_water tag
execute store result score @s gghe.var run data get storage geegaz:gghe temp.CookingPot.HasWater
tag @s[scores={gghe.var=0}] remove gghe.cooking_pot.has_water
tag @s[scores={gghe.var=1}] add gghe.cooking_pot.has_water