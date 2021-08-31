
# Update the recipe if the interation suceeded and the pot doesn't have levels
execute as @s[tag=!gghe.interact_fail] unless score $gghe.level gghe.var matches 1.. run function gghe:block/cooking_pot/interact/recipe

# Update the pot
function gghe:block/cooking_pot/interact/set_data
loot replace entity @s armor.head loot gghe:items/cooking_pot
item replace entity @s weapon.mainhand with air