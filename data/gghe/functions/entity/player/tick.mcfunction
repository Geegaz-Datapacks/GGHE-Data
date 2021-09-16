# Player tick

execute if entity @s[tag=gghe.umbrella.open,advancements={gghe:use_umbrella=false}] run function gghe:item/umbrella/close

scoreboard players set @s gghe.sneak 0
scoreboard players set @s gghe.use_coas 0

advancement revoke @s only gghe:use_umbrella