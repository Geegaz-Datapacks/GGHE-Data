
execute store result storage geegaz:gghe temp.CookingPot.Level int 1.0 run scoreboard players get @s gghe.cp.level
execute store success storage geegaz:gghe temp.CookingPot.HasWater byte 1.0 if entity @s[tag=gghe.cooking_pot.has_water]

# Set block's CustomModelData
data modify storage geegaz:gghe temp.CustomModelData set value 1707101
execute as @s[tag=gghe.cooking_pot.has_water] run data modify storage geegaz:gghe temp.CustomModelData set value 1707102
execute as @s[scores={gghe.cp.level=1..}] run data modify storage geegaz:gghe temp.CustomModelData set value 1707103

loot replace entity @s armor.head loot gghe:items/cooking_pot
