data modify entity @s DeathLootTable set from storage geegaz:gghe temp.CookingPot.Recipe.id
loot replace entity @e[type=armor_stand,tag=gghe.cooking_pot.display_target] weapon.offhand kill @s

function gghe:entity/delete