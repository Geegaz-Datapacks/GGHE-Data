
# Set loot table to the recipe id
data modify entity @s DeathLootTable set from storage geegaz:gghe temp.CookingPot.Recipe.id
# Loot the recipe in mainhand and copy it in storage
loot replace entity @s weapon.mainhand kill @s
data modify storage geegaz:gghe temp.CookingPot.Recipe.Item set from entity @s HandItems[0]

function gghe:entity/delete