tag @s add gghe.interact

# Find the cooking pot and check interaction
tag @s add gghe.raycast
execute anchored eyes run function gghe:block/cooking_pot/interact/raycast

tag @s remove gghe.interact
advancement revoke @s only gghe:cooking_pot/interact