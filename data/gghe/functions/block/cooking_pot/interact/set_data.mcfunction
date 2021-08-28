
# Set the pot's data from tags and scores
execute store result storage geegaz:gghe temp.CookingPot.Level int 1.0 run scoreboard players get $gghe.level gghe.var
execute store success storage geegaz:gghe temp.CookingPot.HasWater byte 1.0 if entity @s[tag=gghe.cooking_pot.has_water]
# Set the pot's CMD
execute if score $gghe.level gghe.var matches 1.. run data modify storage geegaz:gghe temp.CustomModelData set from storage geegaz:gghe temp.CookingPot.CMDStates.BlockHasLevel
execute as @s[tag=gghe.cooking_pot.has_water] unless score $gghe.level gghe.var matches 1.. run data modify storage geegaz:gghe temp.CustomModelData set from storage geegaz:gghe temp.CookingPot.CMDStates.BlockHasWater
execute as @s[tag=!gghe.cooking_pot.has_water] unless score $gghe.level gghe.var matches 1.. run data modify storage geegaz:gghe temp.CustomModelData set from storage geegaz:gghe temp.CookingPot.CMDStates.Block

# Reset the temp scores
scoreboard players reset $gghe.level
scoreboard players reset $gghe.items