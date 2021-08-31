
# Get item from the simplified list
data modify storage geegaz:gghe temp.ItemB set from storage geegaz:gghe temp.SimplifiedItems[1]
data remove storage geegaz:gghe temp.ItemB.Count

# Test current item against the simplified list item
execute store success score @s gghe.var run data modify storage geegaz:gghe temp.ItemB set from storage geegaz:gghe temp.ItemA
# If it matched, increase the simplified list item's Count using a rounding precision trick
execute as @s[scores={gghe.var=0}] store result storage geegaz:gghe temp.SimplifiedItems[1].Count byte -1.0 run data get storage geegaz:gghe temp.SimplifiedItems[1].Count -1.0001


