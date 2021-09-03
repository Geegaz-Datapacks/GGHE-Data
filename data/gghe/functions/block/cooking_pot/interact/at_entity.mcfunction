tag @p[tag=gghe.interact] remove gghe.raycast

# Test how the pot was interacted with
execute if predicate gghe:has_item_mainhand run function gghe:block/cooking_pot/interact/place
execute unless predicate gghe:has_cooking_pot_head run function gghe:block/cooking_pot/interact/take