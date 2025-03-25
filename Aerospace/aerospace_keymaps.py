import json
import subprocess

keybinds_request = subprocess.run(
    ["aerospace", "config", "--json", "--get", "mode"],
    capture_output=True,
    text=True,
)
if keybinds_request.returncode != 0:
    print("Error: Failed to fetch keybinds")


# # Prepare the results for Alfred in JSON format
results = {"items": []}

# Load the JSON data from the output of the command
data = json.loads(keybinds_request.stdout)
modes = {}
for mode in data:
    for key in data.get(mode, {}).get("binding", {}):
        action = data.get(mode, {}).get("binding", {}).get(key, {})
        results["items"].append(
            {
                "title": f"{action}",
                "subtitle": f"({mode}): {key}",
                "match": f"{mode} {key} {action}",
                "arg": [mode, key],
            }
        )

# Output the results to Alfred
print(json.dumps(results))
