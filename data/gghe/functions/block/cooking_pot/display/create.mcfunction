
# Create the display item
summon snowball ~ ~1 ~ {NoGravity:1b,Tags:["gghe.new","gghe.cooking_pot.display"]}
data modify entity @e[type=snowball,tag=gghe.cooking_pot.display,tag=gghe.new,limit=1,sort=nearest] Item set from storage geegaz:gghe temp.CookingPot.Recipe.Item
tag @e[type=snowball] remove gghe.new

item replace entity @s weapon.offhand with air

data modify entity @s CustomNameVisible set value true
tag @s add gghe.cooking_pot.has_display