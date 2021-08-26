data modify entity @s DeathLootTable set from storage geegaz:gghe temp.tag.gghe.CookingPot.Recipe

execute if score $gghe.count gghe.var matches 1.. run loot spawn ~ ~0.5 ~ kill @s
execute if score $gghe.count gghe.var matches 0 run loot replace entity @p[tag=gghe.interact.cooking_pot] weapon.mainhand kill @s

function gghe:entity/delete