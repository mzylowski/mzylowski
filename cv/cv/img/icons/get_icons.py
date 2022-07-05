import json
import os

import requests
import xml.etree.ElementTree as ET
from cairosvg import svg2png


def fill_with_color(filename, color):
    xml = ET.parse(f"svg/{filename}.svg")
    root = xml.getroot()
    root.set('fill', color)
    xml.write(f"{filename}.svg", xml_declaration=False)
    svg2png(file_obj=open(f"{filename}.svg"), write_to=f"png/{filename}.png", scale=10)
    os.remove(f"{filename}.svg")


with open("icons.json", 'r') as f:
    icons_json = json.load(f)
    for icon in icons_json["icons"]:
        if not os.path.exists(f"svg/{icon['name']}.svg"):
            r = requests.get(f"https://simpleicons.org/icons/{icon['name']}.svg")
            open(f"svg/{icon['name']}.svg", 'wb').write(r.content)
        fill_with_color(f"{icon['name']}", icons_json["color"])
