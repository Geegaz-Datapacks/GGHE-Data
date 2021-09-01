
# Set the pot's data from tags and scores
execute store result storage geegaz:gghe temp.CookingPot.Level int 1.0 run scoreboard players get $gghe.level gghe.var
execute store success storage geegaz:gghe temp.CookingPot.HasWater byte 1.0 if entity @s[tag=gghe.cooking_pot.has_water]

# Update the recipe if the interation suceeded and the pot doesn't have levels
execute as @s[scores={gghe.var=0}] unless score $gghe.level gghe.var matches 1.. run function gghe:block/cooking_pot/interact/recipe

# Update the pot 
# - whole data is copied to the item
loot replace entity @s armor.head loot gghe:cooking_pot/block
item replace entity @s weapon.mainhand with air

# Update the display if the player wasn't sneaking
execute as @s[tag=!gghe.interact_sneak] run function gghe:block/cooking_pot/display/test

# Reset the temp scores
scoreboard players reset $gghe.level
scoreboard players reset $gghe.items