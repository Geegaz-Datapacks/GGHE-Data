data modify entity @s DeathLootTable set from storage geegaz:gghe temp.CookingPot.Recipe.id

execute if score $gghe.count gghe.var matches 1.. run loot spawn ~ ~1 ~ kill @s
execute if score $gghe.count gghe.var matches ..0 run loot replace entity @e[type=armor_stand,tag=gghe.cooking_pot,tag=gghe.cooking_pot.recipe_target] weapon.mainhand kill @s
execute if score $gghe.count gghe.var matches ..0 run scoreboard players add $gghe.count gghe.var 1

tp @s ~ -1000 ~