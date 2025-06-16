import csv
from robot.api import logger

class CSVLibrary(object):

    def read_csv_file(self, filename):
        '''Read CSV file and return its content as a Python list.
        Use Robot Framework's Collections library to futher manipulate lists.
        '''

        f = open(filename, 'r')
        csvfile = csv.reader(f)
        f.close
        return [row for row in csvfile]

    def empty_csv_file(self, filename):
        '''This keyword will empty (truncate) the CSV file.
        '''

        f = open(filename, "w")
        f.truncate()
        f.close()

    # def append_to_csv_file(self, filename, data):
    # # กรองข้อมูลที่ว่าง
    #  filtered_data = [row for row in data if row.strip()]  # ลบข้อมูลที่เป็นช่องว่าง
    # with open(filename, 'a', newline='') as f:
    #     csvfile = csv.writer(f)
    #     for row in filtered_data:
    #         csvfile.writerow([row])  # เขียนแค่แถวที่มีข้อมูล

    def append_to_csv_file(self, filename, data):
        # เปิดไฟล์ในโหมด append
        with open(filename, 'a', newline='') as f:
         csvfile = csv.writer(f)
         csvfile.writerow(data)  # เขียนแถวใหม่ลงในไฟล์ CSV
        # f = open(filename, 'a')
        # csvfile = csv.writer(f)
        # csvfile.writerow(data)
        # f.close()

    def append_to_csv_file1(self, filename, data):
        '''This keyword will append data to a new or existing CSV file.
        Data should be iterable (e.g. list or tuple)
        '''

        f = open(filename, 'a')
        csvfile = csv.writer(f)
        csvfile.writerow(data)
        # for item in data:
        #     csvfile.writerow([item])
        f.close()