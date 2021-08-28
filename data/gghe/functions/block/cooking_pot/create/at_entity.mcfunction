
# Update the pot
function gghe:block/cooking_pot/interact/set_data
loot replace entity @s armor.head loot gghe:items/cooking_pot

tellraw @a[tag=gghe.debug] [{"translate":"[DEBUG] [Cooking Pot]"},{"text":" Placed Cooking Pot: "},{"nbt":"temp.CookingPot","storage":"geegaz:gghe","interpret":false}]

tag @s remove gghe.new