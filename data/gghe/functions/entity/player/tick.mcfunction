# Player tick

# If the umbrella was open last tick but not anymore, close it
execute if entity @s[tag=!gghe.umbrella.open,tag=gghe.umbrella.last_tick_open] run function gghe:item/umbrella/close
tag @s[tag=gghe.umbrella.open] add gghe.umbrella.last_tick_open

scoreboard players set @s gghe.sneak 0
scoreboard players set @s gghe.use_coas 0

tag @s remove gghe.umbrella.open
