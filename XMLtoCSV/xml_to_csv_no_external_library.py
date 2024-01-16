import os
from xml.etree import ElementTree
import csv


def process_xml_file(original_file_path, original_directory, output_directory):
    # TODO: test with actual files to convert and clear errors if any
    tree = ElementTree.parse(original_file_path)
    root = tree.getroot()

    relative_path = os.path.relpath(original_file_path, start=original_directory)
    output_path = os.path.join(output_directory, relative_path)
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    new_file = output_path.replace('.xml', '.csv')
    # You can change the second argument of *** output_path.replace() *** for more explicit names
    # e.g '_file_for_translation.csv'
    # output will be OriginalFileName_file_for_translation.csv

    with open(new_file, 'w', newline='', encoding='utf-8') as csvfile:
        csv_writer = csv.writer(csvfile)

        # crating column headers change where applicable
        csv_writer.writerow(['Property value', 'xName'])

        # Iterate through the XML elements and write data to CSV
        for property_tag in root.findall('.//xProperty'):
            name_tag = property_tag.get('xName')
            property_value = property_tag.text.strip() if property_tag.text else ''
            csv_writer.writerow([property_value, name_tag])

    # only for visuals in the console to know something is happening
    print(f'CSV file created: {new_file}')


# Use next row if the script is inside the root directory of the files to convert
# root_directory = os.path.dirname(os.path.abspath(__file__))
# else use hardcoded path
# Don`t forget to escape the escape symbol :D
root_directory = 'D:\\XML to excel\\Base folder\\Folders'

# Specify the directory to write new files
output_folder_location = 'D:\\XML to excel\\Base folder\\output_folders'


for folder_name, sub_folders, file_names in os.walk(root_directory):
    for file_name in file_names:
        if file_name.endswith('.xml'):
            xml_file_path = os.path.join(folder_name, file_name)
            process_xml_file(xml_file_path, root_directory, output_folder_location)
