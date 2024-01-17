import os
from pandas import ExcelWriter, DataFrame
from xml.etree import ElementTree

# TODO: test with actual files for conversion and clear errors if any

# Settings to make the Excell sheet visually pleasing
FONT_SIZE = 10
FONT_NAME = 'Arial'

HEADER_BACKGROUND_COLOR = "#4F81BD"
HEADER_TEXT_COLOR = "#FFFFFF"

COLORED_DATA_CELL_BACKGROUND = "#DCE6F1"
COLORED_DATA_CELL_TEXT = "#000000"

WHITE_DATA_CELL_BACKGROUND = "#FFFFFF"
WHITE_DATA_CELL_TEXT = "#000000"

BORDER_COLOR = COLORED_DATA_CELL_BACKGROUND


def process_xml_file(original_file_path, original_directory, output_directory):
    tree = ElementTree.parse(original_file_path)
    root = tree.getroot()

    relative_path = os.path.relpath(original_file_path, start=original_directory)
    output_path = os.path.join(output_directory, relative_path)
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    new_file = output_path.replace('.xml', '.xlsx')
    # You can change the second argument of *** output_path.replace() *** for more explicit names
    # e.g '_file_for_translation.xlsx'
    # output will be OriginalFileName_file_for_translation.xlsx

    data = {'Property Value': [], 'xName': []}
    # You can change the key names in data to visualize new column headers
    # e.g. data = {'First Heading': [], 'Second Heading' : []}

    for property_tag in root.findall('.//xProperty'):
        name_tag = property_tag.get('xName')
        property_value = property_tag.text.strip() if property_tag.text else ''
        # if you have changed the data keys, apply changes here as well
        data['Property Value'].append(property_value)
        data['xName'].append(name_tag)

    df = DataFrame(data)

    # Write to Excel with formatting, sorting arrow shortcuts, and cell borders
    with ExcelWriter(new_file, engine='xlsxwriter') as writer:
        # if you want to change the sheet name change both
        # sheet_name='YourDesiredName' and
        # writer.sheets['YourDesiredName']
        df.to_excel(writer, index=False, sheet_name='Sheet1')
        workbook = writer.book
        worksheet = writer.sheets['Sheet1']

        # Keep in mind styles can be added for all boxes in the common_style variable
        # bold italic and underlined are applied if set to true
        # can add explicitly for a box_style_type
        common_style = {
            'font_size': FONT_SIZE,
            'font_name': FONT_NAME,
        }

        header_style = {
            'bg_color': HEADER_BACKGROUND_COLOR,
            'font_color': HEADER_TEXT_COLOR,
            'bold': True,
            # 'italic': True,
            # 'underline': True,

        }
        white_box_style = {
            'bg_color': WHITE_DATA_CELL_BACKGROUND,
            'font_color': WHITE_DATA_CELL_TEXT,

        }
        colored_box_style = {
            'bg_color': COLORED_DATA_CELL_BACKGROUND,
            'font_color': COLORED_DATA_CELL_TEXT,
        }

        # Add sorting arrow shortcut to the header
        worksheet.autofilter(0, 0, 0, df.shape[1] - 1)

        # Apply formatting to the sheet
        for row_num in range(df.shape[0] + 1):
            for col_num in range(df.shape[1]):
                cell_value = df.iloc[row_num - 1, col_num] if row_num > 0 else df.columns[col_num]
                cell_format = common_style.copy()

                if row_num == 0:
                    cell_format.update(header_style)
                elif row_num % 2 == 0:
                    cell_format.update(white_box_style)
                else:
                    cell_format.update(colored_box_style)
                cell_format = workbook.add_format(cell_format)

                worksheet.write(row_num, col_num, cell_value, cell_format)

        # Set column width to ensure the full text is visible
        for i, col in enumerate(df.columns):
            max_header_len = len(col)
            max_data_len = df[col].astype(str).apply(len).max()
            max_len = max(max_header_len, max_data_len)
            worksheet.set_column(i, i, max_len + 2)  # Adding extra space for padding

        # Apply cell borders
        # if you don`t want borders remove code section below
        for row_num in range(1, df.shape[0] + 1):
            for col_num in range(df.shape[1]):
                cell_format = workbook.add_format({'border': 1, 'border_color': BORDER_COLOR})
                worksheet.conditional_format(row_num, col_num, row_num, col_num,
                                             {'type': 'cell', 'criteria': '!=', 'value': '""', 'format': cell_format})

    # only for visuals in the console to know something is happening
    print(f'Excel file created: {new_file}')


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
