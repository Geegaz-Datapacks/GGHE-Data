
from os import name
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


class ItemGenerator:

    dev_name: str
    namespace: str

    items: dict
    lang: dict
    paths: dict

    def __init__(self, dev_name, namespace) -> None:
        self.dev_name = dev_name
        self.namespace = namespace

        self.items = {}
        self.lang = {}
        self.paths = {
            Type.RECIPE: "",
            Type.ADVANCEMENT: "recipes/",
            Type.LOOT_TABLE: "items/",
            Type.FUNCTION: "recipes/"
        }

    def register(self, item) -> None:
        self.items[item.id] = item
        self.lang[item.id] = {"id": f"{NAMESPACE}.item.{item.id}"}

    def generate(self, item) -> None:
        print("Generating", item.id)

        for data_type, data in item.data.items():
            # Create path
            path = Path(f"data/{self.namespace}/{data_type}/{self.paths[data_type]}")
            path.mkdir(parents=True, exist_ok=True)
            if data_type == Type.FUNCTION:
                path = path.joinpath(f"{item.id}.mcfunction")
                str_data = "\n".join(data)
            else:
                path = path.joinpath(f"{item.id}.json")
                str_data = json.dumps(data, indent=4)

            # Write file
            path.write_text(str_data)

    def generate_all(self) -> None:
        for item in self.items.values():
            print(item)
            self.generate(item)


class CustomItem:

    base_item: str
    id: str
    cmd: int
    traits: list

    generator : ItemGenerator

    data: dict

    def __init__(self, generator: ItemGenerator, base_item: str, id: str, cmd: int, traits=[]) -> None:
        self.base_item = base_item
        self.id = id
        self.cmd = cmd
        self.traits = traits
        
        self.generator = generator
        generator.register(self)
        
        self.data = {}

    def create_recipe(self, recipe = None):
        if recipe:
            self.data[Type.RECIPE] = recipe
        else:
            self.data[Type.RECIPE] = {
                "type": "minecraft:crafting_shaped",
                "pattern": [],
                "key": {},
                "result": {
                    "item": "minecraft:knowledge_book",
                    "count": 1
                }
            }

    def create_advancement(self, advancement = None):
        if advancement:
            self.data[Type.ADVANCEMENT] = advancement
        else:
            self.data[Type.ADVANCEMENT] = {
                "criteria": {
                    "requirement": {
                        "trigger": "minecraft:recipe_unlocked",
                        "conditions": {
                            "recipe": f"{self.generator.namespace}:{self.generator.paths[Type.RECIPE]}{self.id}"
                        }
                    }
                },
                "rewards": {
                    "function": f"{self.generator.namespace}:{self.generator.paths[Type.FUNCTION]}{self.id}",
                    "loot": [
                        f"{self.generator.namespace}:{self.generator.paths[Type.LOOT_TABLE]}{self.id}"
                    ]
                }
            }

    def create_loot_table(self, loot_table = None):
        if loot_table:
            self.data[Type.LOOT_TABLE] = loot_table
        else:
            self.data[Type.LOOT_TABLE] = {
                "pools": [
                    {
                        "rolls": 1,
                        "entries": [
                            {
                                "type": "minecraft:item",
                                "name": self.base_item,
                                "functions": [
                                    {
                                        "function": "minecraft:set_name",
                                        "name": {
                                            "translate": f"{self.generator.namespace}.item.{self.id}",
                                            "italic": False
                                        }
                                    },
                                    {
                                        "function": "minecraft:set_nbt",
                                        "tag": f"{{ctc:{{id:'{self.id}',from:'{self.generator.dev_name}:{self.generator.namespace}',traits:{self.traits}}},CustomModelData:{self.cmd}}}"
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }

    def create_function(self, function = None):
        if function:
            self.data[Type.FUNCTION] = function
        else:
            self.data[Type.FUNCTION] = [
                "clear @s knowledge_book 1",
                f"recipe take @s {self.generator.namespace}:{self.generator.paths[Type.RECIPE]}{self.id}",
                f"advancement revoke @s only {self.generator.namespace}:{self.generator.paths[Type.ADVANCEMENT]}{self.id}"
            ]
            
