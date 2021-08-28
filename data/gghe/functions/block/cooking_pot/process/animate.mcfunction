
scoreboard players set $gghe.frames gghe.var 8

scoreboard players operation @s gghe.var = @s gghe.time
scoreboard players operation @s gghe.var %= $gghe.frames gghe.var

execute as @s[scores={gghe.var=0}] run data modify entity @s Pose.Head set value [2f,0f,0f]
execute as @s[scores={gghe.var=1}] run data modify entity @s Pose.Head set value [2f,0f,2f]
execute as @s[scores={gghe.var=2}] run data modify entity @s Pose.Head set value [0f,0f,2f]
execute as @s[scores={gghe.var=3}] run data modify entity @s Pose.Head set value [358f,0f,2f]
execute as @s[scores={gghe.var=4}] run data modify entity @s Pose.Head set value [358f,0f,0f]
execute as @s[scores={gghe.var=5}] run data modify entity @s Pose.Head set value [358f,0f,358f]
execute as @s[scores={gghe.var=6}] run data modify entity @s Pose.Head set value [0f,0f,358f]
execute as @s[scores={gghe.var=7}] run data modify entity @s Pose.Head set value [2f,0f,358f]