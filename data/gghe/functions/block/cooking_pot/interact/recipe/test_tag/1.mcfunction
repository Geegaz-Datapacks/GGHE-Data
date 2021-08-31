

data modify entity @s HandItems[0] set from storage geegaz:gghe temp.Items[1]

function #gghe:cooking_pot/query_tags

data modify storage geegaz:gghe temp.Items[1].item_tags set from storage geegaz:gghe temp.item_tags
data remove storage geegaz:gghe temp.item_tags
