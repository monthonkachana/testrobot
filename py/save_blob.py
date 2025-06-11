import sys
from cx_Oracle import LOB

def save_blob_to_file(blob_data, file_path):
    """อ่านข้อมูล BLOB และบันทึกเป็นไฟล์ไบนารี"""
    with open(file_path, 'wb') as file:
        file.write(blob_data.read())

if __name__ == "__main__":
    blob_data = sys.argv[1]  # ดึงข้อมูลจาก Argument ที่ส่งเข้ามา
    file_path = sys.argv[2]  # ที่อยู่ไฟล์ที่จะบันทึก
    save_blob_to_file(blob_data, file_path)