
# Get the last item from temp.CookingPot.Items
data modify storage geegaz:gghe temp.Item.A set from storage geegaz:gghe temp.CookingPot.Items[-1]
data remove storage geegaz:gghe temp.Item.A.Count
# Skip other tests if the item is air
execute store success score @s gghe.var unless data storage geegaz:gghe temp.Item.A{id:"minecraft:air"}

