import random
import string


def generate_random_string_and_number(length_str, length_num):
    # สุ่มตัวอักษร
    random_str = ''.join(random.choice(string.ascii_letters) for _ in range(length_str))
    
    # สุ่มตัวเลข
    random_num = ''.join(random.choice(string.digits) for _ in range(length_num))
    
    # นำมาประกอบกัน
    combined = random_str + random_num
    
    return combined