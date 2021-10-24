tag @s add gghe.interact

# Find the umbrella and interact with it - has only been interacted by taking the item
tag @s add gghe.raycast
execute anchored eyes run function gghe:block/umbrella/interact/raycast

tag @s remove gghe.interact
advancement revoke @s only gghe:umbrella/interact