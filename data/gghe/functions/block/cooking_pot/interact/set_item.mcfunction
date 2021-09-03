
# Remove ingredients
execute if score $gghe.items gghe.var matches 1.. run function gghe:block/cooking_pot/interact/ingredient/remove_all
# Remove the display
execute as @s[tag=gghe.cooking_pot.has_display] run function gghe:block/cooking_pot/display/remove

# Set the pot's data from scores
execute store result storage geegaz:gghe temp.CookingPot.Level int 1.0 run scoreboard players get $gghe.level gghe.var
execute unless score $gghe.level gghe.var matches 1.. run data remove storage geegaz:gghe temp.CookingPot.Recipe

# Give/spawn the item depending on if there's a player around
# - only Level and Recipe data is copied to the item
# - if $gghe.level is > 0, sets lore from Level and Recipe
loot replace entity @p[tag=gghe.interact] weapon.mainhand loot gghe:cooking_pot/item
execute unless entity @p[tag=gghe.interact] run loot spawn ~ ~0.5 ~ loot gghe:cooking_pot/item

# Reset the temp scores
scoreboard players reset $gghe.level
scoreboard players reset $gghe.items
scoreboard players reset $gghe.count

# VFX
execute as @s[tag=gghe.cooking_pot.has_water] run particle minecraft:splash ~ ~1 ~ 0.1 0 0.1 1 20
# SFX
execute as @s[tag=gghe.cooking_pot.has_water] run playsound item.bucket.empty block @a[distance=..16] ~ ~1 ~ 0.5 1.0
execute if entity @p[tag=gghe.interact] run playsound minecraft:entity.item_frame.remove_item block @a[distance=..16] ~ ~1 ~ 0.8 1.0

scoreboard players reset @s 
kill @s