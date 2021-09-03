tag @s add gghe.create

# Find the campfire and create the pot
tag @s add gghe.raycast
execute anchored eyes run function gghe:block/cooking_pot/create/raycast

tag @s remove gghe.create
advancement revoke @s only gghe:create_cooking_pot