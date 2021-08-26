
# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @s ArmorItems[3].tag.gghe.CookingPot

# Setup the pot's item
execute as @s[scores={gghe.level=1..}] run data modify storage geegaz:gghe temp.CustomModelData set value 1707202
execute as @s[scores={gghe.items=1..}] run function gghe:block/cooking_pot/interact/ingredient/remove_all
# Remove irrelevant data
data remove storage geegaz:gghe temp.CookingPot.HasWater
data remove storage geegaz:gghe temp.CookingPot.Items

loot spawn ~ ~0.5 ~ loot gghe:items/cooking_pot

# VFX
particle block copper_block ~ ~0.5 ~ 0.2 0.2 0.2 0 16 normal
# SFX
playsound minecraft:block.copper.break block @a ~ ~ ~

data remove storage geegaz:gghe temp
kill @s