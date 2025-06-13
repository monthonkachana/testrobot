from hashlib import sha256
import base64

def hash_zip_file(file):
    with open(file, "rb") as f:
         hash = sha256(f.read())
         hx = base64.b64encode(hash.digest()).decode()
    print('hx: ', hx)
    return hx