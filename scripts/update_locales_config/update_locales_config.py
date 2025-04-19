#!/usr/bin/env python3

import os
import xml.etree.ElementTree as ET

from xml.dom import minidom

# Paths
l10n_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../lib/l10n'))
output_file = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../android/app/src/main/res/xml/locales_config.xml'))

# Collect locale codes
locale_codes = set()
for filename in os.listdir(l10n_dir):
    if filename.startswith('app_') and filename.endswith('.arb'):
        locale = filename[len('app_'):-len('.arb')]
        locale = locale.replace('_', '-')
        locale_codes.add(locale)

# Read existing locales (if file exists)
existing_locales = set()
if os.path.exists(output_file):
    try:
        tree = ET.parse(output_file)
        root = tree.getroot()
        for locale in root.findall('locale'):
            name = locale.attrib.get('{http://schemas.android.com/apk/res/android}name')
            if name:
                existing_locales.add(name)
    except ET.ParseError:
        print("Warning: Could not parse existing locales_config.xml")

# Create XML structure
root = ET.Element('locale-config', {'xmlns:android': 'http://schemas.android.com/apk/res/android'})
for code in sorted(locale_codes):
    ET.SubElement(root, 'locale', {'android:name': code})

# Convert to pretty-printed XML string
rough_string = ET.tostring(root, 'utf-8')
reparsed = minidom.parseString(rough_string)
pretty_xml = reparsed.toprettyxml(indent="    ", encoding="utf-8")

# Ensure the output directory exists
os.makedirs(os.path.dirname(output_file), exist_ok=True)

# Write to file
with open(output_file, 'wb') as f:
    f.write(pretty_xml)

print(f"locales_config.xml updated successfully!")
print(f"Locales before: {len(existing_locales)}")
print(f"Locales now: {len(locale_codes)}")