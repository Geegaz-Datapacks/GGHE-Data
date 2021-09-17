
# Switch the player's mainhand and the armor stand's chest
data modify storage geegaz:gghe temp.Item set from entity @p[tag=gghe.interact] SelectedItem
item replace entity @p[tag=gghe.interact] weapon.mainhand from entity @s armor.chest
data modify entity @s ArmorItems[2] set from storage geegaz:gghe temp.Item

data remove storage geegaz:gghe temp