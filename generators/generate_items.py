
from items import *
import csv

def make_umbrellas(generator: ItemGenerator) -> None:
    for color in COLORS:
        umbrella = CustomItem(
            base_item="minecraft:shield",
            id=f"{color}_umbrella",
            cmd=1707231 + COLORS.index(color),
            traits=["item", "umbrella"],
            generator=generator)

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


#-------- Generate --------#
generator = ItemGenerator("geegaz", "gghe")
make_umbrellas(generator)

generator.generate_all()
