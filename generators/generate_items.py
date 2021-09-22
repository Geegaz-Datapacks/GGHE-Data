
from items import *

class Umbrella(CustomItem):

    def __init__(self, color) -> None:
        super().__init__(
            base_item = "minecraft:shield",
            cmd = 1707231 + COLORS.index(color),
            id = f"{color}_umbrella",
            traits=["item", "umbrella"])
        
        self.recipe["pattern"] = [
            "###",
            " / ",
            " / "
        ]
        self.recipe["key"] = {
            "#": {
                "item": f"minecraft:{color}_carpet"
            },
            "/": {
                "item": "minecraft:stick"
            }
        }

def generate_all():
    lang = {}
    for color in COLORS:
        umbrella = Umbrella(color)
        umbrella.generate()
        lang[f"{NAMESPACE}.item.{umbrella.id}"] = ""

#-------- Generate --------#
generate_all()
    