
# Update the recipe if the interation suceeded and the pot doesn't have levels
execute as @s[tag=!gghe.interact_fail] unless score $gghe.level gghe.var matches 1.. run function gghe:block/cooking_pot/interact/recipe

# Set the pot's data from tags and scores
execute store result storage geegaz:gghe temp.CookingPot.Level int 1.0 run scoreboard players get $gghe.level gghe.var
execute store success storage geegaz:gghe temp.CookingPot.HasWater byte 1.0 if entity @s[tag=gghe.cooking_pot.has_water]
# Set the pot's CMD
execute if score $gghe.level gghe.var matches 1.. run data modify storage geegaz:gghe temp.CustomModelData set from storage geegaz:gghe temp.CookingPot.CMDStates.BlockHasLevel
execute unless score $gghe.level gghe.var matches 1.. as @s[tag=gghe.cooking_pot.has_water] run data modify storage geegaz:gghe temp.CustomModelData set from storage geegaz:gghe temp.CookingPot.CMDStates.BlockHasWater
execute unless score $gghe.level gghe.var matches 1.. as @s[tag=!gghe.cooking_pot.has_water] run data modify storage geegaz:gghe temp.CustomModelData set from storage geegaz:gghe temp.CookingPot.CMDStates.Block

# Update the pot
loot replace entity @s armor.head loot gghe:items/cooking_pot
item replace entity @s weapon.mainhand with air

# Reset the temp scores
scoreboard players reset $gghe.level
scoreboard players reset $gghe.items
scoreboard players reset $gghe.count