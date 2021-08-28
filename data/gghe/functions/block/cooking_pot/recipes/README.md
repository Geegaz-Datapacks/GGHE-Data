# How to add recipes

Either I'm reading this 'cause a recipe doesn't work, either you want to learn how to add your own recipes !

## Create the loot table

First step, very simple - add the loot table for your item. I recommend using any kind of stew, since they give back a bowl, or you'll have to use an advancement to give the bowl back - your choice. 

In GGHE I mostly use the suspicious stew, since it allows you to add effects to your food. The most useful effect here is **Saturation** (id 23), to give your food a custom saturation: the EffectDuration is the number of saturation levels added to the stew's regular saturation

An example from `gghe:items/roast_chicken`:
```json
{
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:suspicious_stew",
          "functions": [
            {
              "function": "minecraft:set_name",
              "name": {
                "translate": "gghe.item.roast_chicken.name",
                "italic": false
              }
            },
            {
              "function": "minecraft:set_nbt",
              "tag": "{ctc:{id:'roast_chicken',from:'geegaz:gghe',traits:['item','food','food/meat','food/chicken']},CustomModelData:1707301}"
            },
            {
              "function": "minecraft:set_nbt",
              "tag": "{Effects:[{EffectId:23b,EffectDuration:4}]}"
            }
          ]
        }
      ]
    }
  ]
}
```

## Create the function

Recipe functions are designed to be flexible and compatible with other datapacks and mods.

## Add the function to a tag *(don't forget this !)*

Depending on the number of items in the pot, a different function tag is called (`#gghe:cooking_pot/recipes_<item amount>`) so you need to add your new recipe to the right tag for it to work. The amount of items can go from 1 to 4.

An example from `#gghe:cooking_pot/recipes_3`:
```json
{
  "values": [
    "gghe:block/cooking_pot/recipes/roast_chicken",
    "gghe:block/cooking_pot/recipes/mushroom_stew",
    "gghe:block/cooking_pot/recipes/hot_cocoa"
  ]
}
```