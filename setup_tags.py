from pathlib import Path, PurePath
import json

namespace = "gghe"
rel_paths = {
	"tags": f"data/{namespace}/tags/items",
	"predicates": f"data/{namespace}/predicates/tags",
	"function": f"data/{namespace}/functions/block/cooking_pot/interact/recipe"
}

function_content = []
function_name = "query_tags.mcfunction"
last_parent = None

# Recursive globbing
root = rel_paths["tags"]
for path in Path(root).rglob("*.json"):
	rel_path = path.relative_to(root) # Path
	res_path = rel_path.with_suffix('').as_posix() # String
	
	# Prepare predicate
	predicate_content = {
		"condition": "minecraft:entity_properties",
		"entity": "this",
		"predicate": {
			"equipment": {
				"mainhand": {
					"tag": f"{namespace}:{res_path}"
				}
			}
		}
	}
	# Prepare function
	if rel_path.parent != last_parent:
		last_parent = rel_path.parent
		function_content.append(f"# {last_parent.name.capitalize()}\n")
	function_line = f"execute if predicate {namespace}:tags/{res_path} run data modify storage geegaz:gghe temp.item_tags append value \"{namespace}:{res_path}\"\n"
	function_content.append(function_line)

	# Create predicate
	with open(Path(rel_paths["predicates"]).joinpath(rel_path),"w") as predicate_file:
		json.dump(predicate_content, predicate_file, indent=2)

# Create function
with open(Path(rel_paths["function"]).joinpath(function_name),"w") as function_file:
	function_file.writelines(function_content)
