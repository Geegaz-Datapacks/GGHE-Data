# No Water
execute as @s[scores={gghe.var=0}] store success score @s gghe.var if score $gghe.count gghe.var matches 2 if data storage geegaz:gghe temp{CookingPot:{HasWater:0b},Items:[{id:"minecraft:cocoa_beans",Count:2b},{id:"minecraft:milk_bucket"}]} run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/hot_cocoa",Servings:2,CookTime:200}
execute as @s[scores={gghe.var=0}] store success score @s gghe.var if score $gghe.count gghe.var matches 2 if data storage geegaz:gghe temp{CookingPot:{HasWater:0b},Items:[{id:"minecraft:potato",Count:2b},{id:"minecraft:chicken"}]} run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/roast_chicken",Servings:1,CookTime:400}
# Water
execute as @s[scores={gghe.var=0}] store success score @s gghe.var if score $gghe.count gghe.var matches 4 if data storage geegaz:gghe temp{CookingPot:{HasWater:1b},Items:[{id:"minecraft:carrot"},{id:"minecraft:rabbit"},{id:"minecraft:potato"},{item_tags:["gghe:ingredients/mushrooms"]}]} run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/rabbit_stew",Servings:1,CookTime:600}
execute as @s[scores={gghe.var=0}] store success score @s gghe.var if score $gghe.items gghe.var matches 1 if data storage geegaz:gghe temp{CookingPot:{HasWater:1b},Items:[{item_tags:["gghe:ingredients/mushrooms"]}]} run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/mushroom_stew",Servings:1,CookTime:150}
execute as @s[scores={gghe.var=0}] store success score @s gghe.var if score $gghe.items gghe.var matches 2 if score $gghe.count gghe.var matches 2 if data storage geegaz:gghe temp{CookingPot:{HasWater:1b},Items:[{id:"minecraft:brown_mushroom"},{id:"minecraft:red_mushroom"}]} run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/mushroom_stew",Servings:2,CookTime:300}
execute as @s[scores={gghe.var=0}] store success score @s gghe.var if score $gghe.items gghe.var matches 3 if score $gghe.count gghe.var matches 2 if data storage geegaz:gghe temp{CookingPot:{HasWater:1b},Items:[{id:"minecraft:brown_mushroom"},{id:"minecraft:red_mushroom"}]} run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/mushroom_stew",Servings:3,CookTime:450}
execute as @s[scores={gghe.var=0}] store success score @s gghe.var if score $gghe.items gghe.var matches 4 if score $gghe.count gghe.var matches 2 if data storage geegaz:gghe temp{CookingPot:{HasWater:1b},Items:[{id:"minecraft:brown_mushroom"},{id:"minecraft:red_mushroom"}]} run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/mushroom_stew",Servings:4,CookTime:600}
execute as @s[scores={gghe.var=0}] store success score @s gghe.var if score $gghe.count gghe.var matches 1 if data storage geegaz:gghe temp{CookingPot:{HasWater:1b},Items:[{id:"minecraft:beetroot",Count:3b}]} run data modify storage geegaz:gghe temp.CookingPot.Recipe set value {id:"gghe:items/beetroot_soup",Servings:1,CookTime:300}
