
execute if predicate gghe:has_umbrella_mainhand run tag @s add gghe.mainhand

item replace entity @s[tag=gghe.mainhand] weapon.mainhand with air
item replace entity @s[tag=!gghe.mainhand] weapon.offhand with air

playsound entity.item.break player @s ~ ~ ~
execute anchored eyes run particle item stick ^ ^-0.2 ^0.5 0.02 0.02 0.02 0.1 10

tag @s remove gghe.mainhand

advancement revoke @s only gghe:umbrella/hit_using