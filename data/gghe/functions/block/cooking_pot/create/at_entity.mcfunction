
# Get the pot's data
function gghe:block/cooking_pot/interact/get_data

# Fail if there's already a pot
execute if entity @e[type=armor_stand,tag=gghe.cooking_pot,tag=!gghe.new,distance=..0.5] run tag @s add gghe.create_fail

# If placing the pot failed, give the item back
execute as @s[tag=gghe.create_fail] run loot give @p[tag=gghe.create.cooking_pot,gamemode=!creative] loot gghe:cooking_pot/item
execute as @s[tag=!gghe.create_fail] run function gghe:block/cooking_pot/interact/set_data

# VFX

# SFX
execute as @s[tag=!gghe.create_fail] run playsound minecraft:block.copper.place block @a ~ ~ ~

tag @s remove gghe.new
kill @s[tag=gghe.create_fail]