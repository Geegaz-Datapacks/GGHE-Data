# This function will run on datapack loading

scoreboard objectives add gghe.var dummy
scoreboard objectives add gghe.CONST dummy

# Cooking Pot scores
scoreboard objectives add gghe.cp.level dummy
scoreboard objectives add gghe.cp.items dummy

scoreboard objectives add gghe.sneak custom:sneak_time

# Start the second clock
function gghe:second