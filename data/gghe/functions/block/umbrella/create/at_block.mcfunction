
tag @s remove gghe.raycast

execute if predicate gghe:has_umbrella_mainhand run tag @s add gghe.mainhand
data modify storage geegaz:gghe temp.Item set from entity @s[tag=gghe.mainhand] SelectedItem
data modify storage geegaz:gghe temp.Item set from entity @s[tag=!gghe.mainhand] Inventory[{Slot:-106b}]

summon armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Silent:1b,DisabledSlots:4142903,Tags:["global.ignore","gghe.block","gghe.umbrella","gghe.new"]}
execute as @e[type=armor_stand,tag=gghe.new,tag=gghe.umbrella] run function gghe:block/umbrella/create/at_entity

item replace entity @s[tag=gghe.mainhand] weapon.mainhand with air
item replace entity @s[tag=!gghe.mainhand] weapon.offhand with air

tag @s remove gghe.mainhand
tag @s remove gghe.umbrella.open
data remove storage geegaz:gghe temp