
# Executed when you open the umbrella
execute if entity @s[tag=!gghe.umbrella.last_tick_open] run playsound item.armor.equip_elytra player @a[distance=..16] ~ ~ ~ 1.0 1.5

tag @s add gghe.umbrella.open
execute if predicate gghe:is_sneaking run function gghe:block/umbrella/create

effect give @s[tag=gghe.umbrella.open] slow_falling 999999 0 true
advancement revoke @s only gghe:umbrella/use
