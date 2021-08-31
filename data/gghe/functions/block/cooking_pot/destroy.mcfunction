
# Get the pot's data in storage
data modify storage geegaz:gghe temp.CookingPot set from entity @s ArmorItems[3].tag.gghe.CookingPot
function gghe:block/cooking_pot/interact/get_data
function gghe:block/cooking_pot/interact/get_item

# VFX
particle block copper_block ~ ~0.5 ~ 0.2 0.2 0.2 0 16 normal
# SFX
playsound minecraft:block.copper.break block @a ~ ~ ~

data remove storage geegaz:gghe temp
