
# Get the last item from temp.Items
data modify storage geegaz:gghe temp.ItemA set from storage geegaz:gghe temp.Items[-1]
data remove storage geegaz:gghe temp.ItemA.Count
# Skip other tests if the item is air
execute store success score @s gghe.var unless data storage geegaz:gghe temp.ItemA{id:"minecraft:air"}