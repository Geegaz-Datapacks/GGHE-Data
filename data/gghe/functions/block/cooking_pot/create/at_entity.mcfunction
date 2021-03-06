
# Get the pot's data
function gghe:block/cooking_pot/interact/get_data

# Fail if there's already a pot
execute store success score @s gghe.var if entity @e[type=armor_stand,tag=gghe.cooking_pot,tag=!gghe.new,distance=..0.5]

# If placing the pot failed, give the item back
execute as @s[scores={gghe.var=1}] run loot give @p[tag=gghe.create,gamemode=!creative] loot gghe:cooking_pot/item
execute as @s[scores={gghe.var=0}] run function gghe:block/cooking_pot/interact/set_data

# VFX

# SFX
execute as @s[scores={gghe.var=0}] run playsound minecraft:block.copper.place block @a ~ ~ ~

tag @s remove gghe.new
kill @s[scores={gghe.var=1}]