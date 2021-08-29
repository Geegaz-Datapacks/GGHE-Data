# This function will run on datapack loading

scoreboard objectives add gghe.var dummy
scoreboard objectives add gghe.time dummy
scoreboard objectives add gghe.CONST dummy

scoreboard players set $8 gghe.CONST 8
scoreboard players set $10 gghe.CONST 10
scoreboard players set $90 gghe.CONST 90

scoreboard objectives add gghe.sneak custom:sneak_time

# Start the second clock
function gghe:second