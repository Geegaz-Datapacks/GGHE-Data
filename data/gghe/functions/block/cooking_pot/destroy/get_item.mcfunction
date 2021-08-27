
# Remove ingredients
execute as @s[scores={gghe.cp.items=1..}] run function gghe:block/cooking_pot/interact/ingredient/remove_all

# Setup the item's CustomModelData
execute as @s[scores={gghe.cp.level=1..}] run data modify storage geegaz:gghe temp.CustomModelData set value 1707202
# Remove irrelevant data
execute as @s[scores={gghe.cp.level=..0}] run data remove storage geegaz:gghe temp.CookingPot.Recipe
data remove storage geegaz:gghe temp.CookingPot.HasWater
data remove storage geegaz:gghe temp.CookingPot.Items

# Give/spawn the item
execute unless entity @p[tag=gghe.interact.cooking_pot] run loot spawn ~ ~0.5 ~ loot gghe:items/cooking_pot
loot replace entity @p[tag=gghe.interact.cooking_pot] weapon.mainhand loot gghe:items/cooking_pot

# VFX
execute as @s[tag=gghe.cooking_pot.has_water] run particle minecraft:splash ~ ~1 ~ 0.1 0 0.1 1 10
# SFX
execute as @s[tag=gghe.cooking_pot.has_water] run playsound item.bucket.empty block @a[distance=..16] ~ ~1 ~ 0.5
playsound minecraft:entity.item_frame.remove_item block @a[distance=..16] ~ ~1 ~ 0.25 1.0

kill @s