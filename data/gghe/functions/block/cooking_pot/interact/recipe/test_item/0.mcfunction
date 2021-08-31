
# Get item from the simplified list
data modify storage geegaz:gghe temp.Item.B set from storage geegaz:gghe temp.Items[0]
data remove storage geegaz:gghe temp.Item.B.Count

# Test current item against the simplified list item
execute store success score @s gghe.var run data modify storage geegaz:gghe temp.Item.B set from storage geegaz:gghe temp.Item.A
# If it matched, increase the simplified list item's Count using a rounding precision trick
execute as @s[scores={gghe.var=0}] store result storage geegaz:gghe temp.Items[0].Count byte -1.0 run data get storage geegaz:gghe temp.Items[0].Count -1.0001


