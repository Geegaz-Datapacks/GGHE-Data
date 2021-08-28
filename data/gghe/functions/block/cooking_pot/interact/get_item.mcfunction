
# Remove ingredients
execute if score $gghe.items gghe.var matches 1.. run function gghe:block/cooking_pot/interact/ingredient/remove_all

# Give/spawn the item
function gghe:block/cooking_pot/interact/set_item
loot replace entity @p[tag=gghe.interact.cooking_pot] weapon.mainhand loot gghe:items/cooking_pot
execute unless entity @p[tag=gghe.interact.cooking_pot] run loot spawn ~ ~0.5 ~ loot gghe:items/cooking_pot

# VFX
execute as @s[tag=gghe.cooking_pot.has_water] run particle minecraft:splash ~ ~1 ~ 0.1 0 0.1 1 20
# SFX
execute as @s[tag=gghe.cooking_pot.has_water] run playsound item.bucket.empty block @a[distance=..16] ~ ~1 ~ 0.5 1.0
execute if entity @p[tag=gghe.interact.cooking_pot] run playsound minecraft:entity.item_frame.remove_item block @a[distance=..16] ~ ~1 ~ 0.8 1.0

kill @s