# 
execute if predicate gghe:tags/containers run data modify storage geegaz:gghe temp.item_tags append value "gghe:containers"
execute if predicate gghe:tags/cooking_pot_valid run data modify storage geegaz:gghe temp.item_tags append value "gghe:cooking_pot_valid"
execute if predicate gghe:tags/ingredients run data modify storage geegaz:gghe temp.item_tags append value "gghe:ingredients"
# Containers
execute if predicate gghe:tags/containers/bottles run data modify storage geegaz:gghe temp.item_tags append value "gghe:containers/bottles"
execute if predicate gghe:tags/containers/bowls run data modify storage geegaz:gghe temp.item_tags append value "gghe:containers/bowls"
execute if predicate gghe:tags/containers/buckets run data modify storage geegaz:gghe temp.item_tags append value "gghe:containers/buckets"
# Ingredients
execute if predicate gghe:tags/ingredients/eggs run data modify storage geegaz:gghe temp.item_tags append value "gghe:ingredients/eggs"
execute if predicate gghe:tags/ingredients/fishes run data modify storage geegaz:gghe temp.item_tags append value "gghe:ingredients/fishes"
execute if predicate gghe:tags/ingredients/fruits run data modify storage geegaz:gghe temp.item_tags append value "gghe:ingredients/fruits"
execute if predicate gghe:tags/ingredients/meats run data modify storage geegaz:gghe temp.item_tags append value "gghe:ingredients/meats"
execute if predicate gghe:tags/ingredients/mushrooms run data modify storage geegaz:gghe temp.item_tags append value "gghe:ingredients/mushrooms"
execute if predicate gghe:tags/ingredients/sweets run data modify storage geegaz:gghe temp.item_tags append value "gghe:ingredients/sweets"
execute if predicate gghe:tags/ingredients/vegetables run data modify storage geegaz:gghe temp.item_tags append value "gghe:ingredients/vegetables"
