say update display

# Set pot's name from the item
item modify entity @s armor.head gghe:name_from_level
data modify entity @s CustomName set from entity @s ArmorItems[3].tag.display.Name

execute if score $gghe.level gghe.var matches ..0 run function gghe:block/cooking_pot/display/remove