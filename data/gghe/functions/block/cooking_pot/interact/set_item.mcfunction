
# Set the pot's data from scores and remove water, remove recipe if no levels
execute store result storage geegaz:gghe temp.CookingPot.Level int 1.0 run scoreboard players get $gghe.level gghe.var
data remove storage geegaz:gghe temp.CookingPot.HasWater
execute unless score $gghe.level gghe.var matches 1.. run data remove storage geegaz:gghe temp.CookingPot.Recipe
# Set the pot's CMD
execute if score $gghe.level gghe.var matches 1.. run data modify storage geegaz:gghe temp.CustomModelData set from storage geegaz:gghe temp.CookingPot.CMDStates.HasLevel
execute unless score $gghe.level gghe.var matches 1.. run data remove storage geegaz:gghe temp.CustomModelData

# Reset the temp scores
scoreboard players reset $gghe.level
scoreboard players reset $gghe.items
scoreboard players reset $gghe.count
