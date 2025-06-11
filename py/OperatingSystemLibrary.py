from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

class OperatingSystemLibrary:

    @keyword
    def read_file_content(self, file_path):
        with open(file_path, 'r') as file:
            return file.read()

    @keyword
    def remove_from_list(self, list_, index):
        index = int(index) - 1  # converting to 0-based index
        if index < 0 or index >= len(list_):
            raise ValueError(f"Index {index + 1} is out of range for the list.")
        return list_[:index] + list_[index + 1:]