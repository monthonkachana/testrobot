import gnupg
import logging
import os
# import gnupg
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives import serialization

def sign_and_encrypt_csv(private_key_path, data, input_csv_path, output_gpg_path, recipient_key, passphrase):
    try:
        # ตั้งค่าตัวแปร GPG_TTY สำหรับระบบ Unix (Linux/macOS)
        os.environ['GPG_TTY'] = os.popen('tty').read().strip()

        # สร้าง GPG object
        gpg = gnupg.GPG()

        # นำเข้ากุญแจส่วนตัวจากไฟล์ .sec
        with open(private_key_path, 'rb') as key_file:
            import_result = gpg.import_keys(key_file.read())
        
        # ดึง keyid ของกุญแจที่นำเข้า (ใช้กุญแจแรกที่นำเข้า)
        keyid = import_result.fingerprints[0] if import_result.fingerprints else None

        if not keyid:
            raise Exception("ไม่พบ keyid หลังการนำเข้ากุญแจ")

        # ขั้นตอนที่ 1: เซ็นชื่อข้อมูล
        with open(data, "r", encoding="utf-8") as file:
            data_content = file.read()

        # เซ็นชื่อด้วยกุญแจที่นำเข้า โดยใช้ keyid และ passphrase
        signed_data = gpg.sign(data_content, keyid=keyid, passphrase=passphrase)

        # สร้างไฟล์ลายเซ็นชั่วคราว
        signature_file_path = "temp_signature.asc"
        with open(signature_file_path, "w") as sig_file:
            sig_file.write(str(signed_data))

        # ขั้นตอนที่ 2: เข้ารหัสไฟล์ CSV พร้อมลายเซ็น
        with open(input_csv_path, "rb") as f:
            status = gpg.encrypt_file(
                f, recipients=[recipient_key], output=output_gpg_path, sign=signature_file_path
            )
        if not status.ok:
            raise Exception("การเข้ารหัสล้มเหลว: " + status.stderr)

        # ลบไฟล์ลายเซ็นชั่วคราว
        os.remove(signature_file_path)

        # ส่งกลับลายเซ็นและพาธของไฟล์ที่เข้ารหัส
        return str(signed_data), output_gpg_path

    except Exception as e:
        raise Exception(f"เกิดข้อผิดพลาด: {str(e)}")


def decrypt_gpg_file(input_file, output_file, passphrase):
    gpg = gnupg.GPG()
    with open(input_file, 'rb') as f:
        status = gpg.decrypt_file(f, passphrase=passphrase, output=output_file)
    if status.ok:
        return "Decryption successful"
    else:
        raise Exception(f"Decryption failed: {status.stderr}")
    
    

def encrypt_gpg_file(input_file, output_file, recipients):
    #  input_path = '/D:/CFR/itmx-cfr-robot/'  
    # file_name = input_file
    # input_file_all = os.path.join(input_path, file_name)    
    """Encrypts a file using GPG.
 
    Args:
        input_file (str): Path to the input file.
        output_file (str): Path to the output encrypted file.
        recipients (list): List of email addresses of recipients.
 
    Returns:
        str: A message indicating success or failure.
    """
 
    gpg = gnupg.GPG()
    with open(input_file, 'rb') as f:
        with open(output_file, 'wb') as out:
            status = gpg.encrypt_file(f, recipients=recipients, output=output_file)
 
    if status.ok:
        return "Encryption successful"
    else:
        raise Exception(f"Encryption failed: {status.stderr}")
    
    
def sign_data(private_key_path):
        with open(private_key_path, "rb") as key_file:
            private_key = serialization.load_pem_private_key(
                key_file.read(),
                password=None  # ใส่รหัสผ่านถ้าจำเป็น
            )
        
        signature = private_key.sign(
            data.encode(),
            padding.PKCS1v15(),
            hashes.SHA256()
        )
        return signature.hex()

def encrypt_file(input_csv_path, output_gpg_path, recipient_key):
        gpg = gnupg.GPG()
        with open(input_csv_path, "rb") as f:
            status = gpg.encrypt_file(
                f, recipients=[recipient_key], output=output_gpg_path
            )
        if not status.ok:
            raise Exception("การเข้ารหัสล้มเหลว: " + status.stderr)
        return output_gpg_path
