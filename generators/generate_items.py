
from items import *
import csv

def make_umbrellas(generator: ItemGenerator) -> None:
    for color in COLORS:
        umbrella = CustomItem(
            base_item="minecraft:shield",
            id=f"{color}_umbrella",
            cmd=1707231 + COLORS.index(color),
            traits=["item", "umbrella"],
            generator=generator
        )

        # Make the data
        umbrella.create_advancement()
        umbrella.create_loot_table()
        umbrella.create_function()
        umbrella.create_recipe({
            "type": "minecraft:crafting_shaped",
            "pattern": [
                "###",
                " / ",
                " / "
            ],
            "key": {
                "#": {
                    "item": f"minecraft:{color}_carpet"
                },
                "/": {
                    "item": "minecraft:stick"
                }
            },
            "result": {
                "item": "minecraft:knowledge_book",
                "count": 1
            }
        })

def make_cooking_pot(generator: ItemGenerator) -> None:
    cooking_pot = CustomItem(
        base_item="minecraft:raw_copper",
        id="cooking_pot",
        cmd=1707201,
        traits=['block', 'cooking_pot', 'metal/copper'],
        generator=generator
    )
    cooking_pot.create_advancement()
    cooking_pot.create_function()
    cooking_pot.create_recipe({
            "type": "minecraft:crafting_shaped",
            "pattern": [
                "   ",
                "u u",
                " u "
            ],
            "key": {
                "u": {
                    "item": "minecraft:copper_ingot"
                }
            },
            "result": {
                "item": "minecraft:knowledge_book",
                "count": 1
            }
        })


#-------- Generate --------#
generator = ItemGenerator("geegaz", "gghe")
make_umbrellas(generator)
make_cooking_pot(generator)

generator.generate_all()
