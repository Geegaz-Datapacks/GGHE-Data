
from pathlib import Path, PurePath
import json

DEVNAME = "geegaz"
NAMESPACE = "gghe"

COLORS = [
    "black",
    "gray",
    "light_gray",
    "white",
    "yellow",
    "orange",
    "brown",
    "red",
    "pink",
    "magenta",
    "purple",
    "blue",
    "cyan",
    "light_blue",
    "lime",
    "green"
]

class Type:
    RECIPE = "recipes"
    ADVANCEMENT = "advancements"
    LOOT_TABLE = "loot_tables"
    FUNCTION = "functions"

class CustomItem:

    id: str
    cmd: int

    recipe: dict
    advancement: dict
    loot_table: dict
    function: list

    PATHS = {
        Type.RECIPE: "",
        Type.ADVANCEMENT: "recipes/",
        Type.LOOT_TABLE: "items/",
        Type.FUNCTION: "recipes/"
    }

    def __init__(self, base_item: str, id: str, cmd: int, traits=[]) -> None:
        self.id = id
        self.cmd = cmd
        self.recipe = {
            "type": "minecraft:crafting_shaped",
            "pattern": [],
            "key": {},
            "result": {
                "item": "minecraft:knowledge_book",
                "count": 1
            }
        }
        self.advancement = {
            "criteria": {
                "requirement": {
                    "trigger": "minecraft:recipe_unlocked",
                    "conditions": {
                        "recipe": f"{NAMESPACE}:{self.PATHS[Type.RECIPE]}{self.id}"
                    }
                }
            },
            "rewards": {
                "function": f"{NAMESPACE}:{self.PATHS[Type.FUNCTION]}{self.id}",
                "loot": [
                    f"{NAMESPACE}:{self.PATHS[Type.LOOT_TABLE]}{self.id}"
                ]
            }
        }
        self.loot_table = {
            "pools": [
                {
                    "rolls": 1,
                    "entries": [
                        {
                            "type": "minecraft:item",
                            "name": base_item,
                            "functions": [
                                {
                                    "function": "minecraft:set_name",
                                    "name": {
                                        "translate": f"{NAMESPACE}.item.{self.id}",
                                        "italic": False
                                    }
                                },
                                {
                                    "function": "minecraft:set_nbt",
                                    "tag": f"{{ctc:{{id:'{self.id}',from:'{DEVNAME}:{NAMESPACE}',traits:{traits}}},CustomModelData:{self.cmd}}}"
                                }
                            ]
                        }
                    ]
                }
            ]
        }
        self.function = [
            "clear @s knowledge_book 1"
            f"recipe take @s {NAMESPACE}:{self.PATHS[Type.RECIPE]}{self.id}",
            f"advancement revoke @s only {NAMESPACE}:{self.PATHS[Type.ADVANCEMENT]}{self.id}"
        ]

    def generate(self):
        print("Generating", self.id)

        path: Path
        data = {
            Type.RECIPE: json.dumps(self.recipe,indent=4),
            Type.ADVANCEMENT: json.dumps(self.advancement,indent=4),
            Type.LOOT_TABLE: json.dumps(self.loot_table,indent=4),
            Type.FUNCTION: "\n".join(self.function)
        }
        for key, value in self.PATHS:
            # Create path
            path = Path(f"data/{NAMESPACE}/{key}/{value}/{self.id}")
            path.mkdir(parents=True, exist_ok=True)
            if key == Type.FUNCTION:
                path.joinpath(".mcfunction")
            else:
                path.joinpath(".json")

            path.write_text(data[key])
