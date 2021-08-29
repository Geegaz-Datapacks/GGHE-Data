
function #gghe:cooking_pot/query_tags

execute as @s[scores={gghe.var=1}] run data modify storage geegaz:gghe temp.CookingPot.Items[0].item_tags set from storage geegaz:gghe temp.item_tags
execute as @s[scores={gghe.var=2}] run data modify storage geegaz:gghe temp.CookingPot.Items[1].item_tags set from storage geegaz:gghe temp.item_tags
execute as @s[scores={gghe.var=3}] run data modify storage geegaz:gghe temp.CookingPot.Items[2].item_tags set from storage geegaz:gghe temp.item_tags
execute as @s[scores={gghe.var=4}] run data modify storage geegaz:gghe temp.CookingPot.Items[3].item_tags set from storage geegaz:gghe temp.item_tags

data remove storage geegaz:gghe temp.item_tags