#!/usr/bin/env python
# -*- coding: utf-8 -*-

import hmac
import hashlib
import base64
import binascii
import urllib
import datetime
import string
import random
import decimal
import json
import time
import logging
import python_jwt as jwt, jwcrypto.jwk as jwk, datetime
import jwt
from datetime import datetime, timedelta



def generate_jwt(private_key_path, algNum , apikey, apisecret, aud, iss, exp_seconds=3600):
    private_key_path = 'pythonlibs/nonprd_1441_valid.key'
    with open(private_key_path, 'r') as key_file:
        private_key = key_file.read()

    # Define the token payload
    iat = datetime.utcnow()
    exp = iat + timedelta(seconds=exp_seconds)

    payload = {
        'iat': iat,
        'exp': exp,
        'aud': aud,
        'iss': iss,
        'apikey': apikey,
        'apisecret': apisecret,
        'jti': str(iat.timestamp())  # Example jti using timestamp
    }

    # Generate the token
    token = jwt.encode(payload, private_key, algorithm=(algNum))
    return token


def signater(data):
    PRIVATE_KEY_FILE="pythonlibs/nonprd_1441_valid.key"
    # PRIVATE_KEY_FILE="pythonlibs/pkcs8.key"
    with open(PRIVATE_KEY_FILE, "rb") as pemfile:
        private_key = jwk.JWK.from_pem(pemfile.read())
        private_key = private_key.export()
    token = jwt.generate_jwt(data, jwk.JWK.from_json(private_key), 'RS512', datetime.timedelta(minutes=1000000))
    return   token

def validate(token):
    PUBLIC_KEY_FILE="pythonlibs/nonprd_1441_valid.key"
    with open(PUBLIC_KEY_FILE, "rb") as pemfile:
        public_key = jwk.JWK.from_pem(pemfile.read())
        public_key = public_key.export()
    header, claims = jwt.verify_jwt(token, jwk.JWK.from_json(public_key), ['RS512'])
    # result = header.claims
    return   claims



def encodeExcel(file):
    data = open(file, 'rb').read()
    base64_encoded = base64.b64encode(data).decode('UTF-8')
    return   base64_encoded

def encode_jwt_header(Number,type):
    data = {"alg": (Number), "typ": (type)}
    json_string = json.dumps(data).encode('utf-8')
    base64_encoded = base64.urlsafe_b64encode(json_string).rstrip(b'=')
    encoded_string = base64_encoded.decode('utf-8')
    print(encoded_string)
    return encoded_string

# def getnerateEpochTime(time):
#      random_rrn = Math.floor(Math.random() * Math.pow(10, 12));
#      random_trce = Math.floor(Math.random() * Math.pow(10, 6));
#      nodeNum = '1';
#      currentTimeInSeconds = Math.floor(Date.now() / 1000)
#      epochTime = currentTimeInSeconds + (time) * 60 
#      return  epochTime

def getnerateEpochTime(numberTime1):
    numberTime = int(numberTime1)
    current_time_in_seconds = int(time.time())
    epochTime = current_time_in_seconds + (numberTime * 60)
    return epochTime


def encode_jwt_payload(epochTime):
    data = {"apisecret":"888_secret","aud":"000","apikey":"888","iss":"1441","exp":(epochTime),"iat":1718617851,"jti":"testcert"}
    json_string = json.dumps(data).encode('utf-8')
    base64_encoded = base64.urlsafe_b64encode(json_string).rstrip(b'=')
    encoded_string = base64_encoded.decode('utf-8')
    print(encoded_string)
    return encoded_string

def encode_jwt_payload2(epochTime):
    data = {""}
    json_string = json.dumps(data).encode('utf-8')
    base64_encoded = base64.urlsafe_b64encode(json_string).rstrip(b'=')
    encoded_string = base64_encoded.decode('utf-8')
    print(encoded_string)
    return encoded_string
 
def random_6_digits():
    return ''.join([str(random.randint(0,9)) for i in range(6)])

def random_number_with_lenght(lenght,digits):
    return ''.join([str(random.randint(0,lenght-1)) for i in range(digits)])

def random_number_warrant(digits2):
    digits = int(digits2)
    return ''.join([str(random.randint(0,9)) for i in range(digits)])

def random_5_digits():
    return ''.join([str(random.randint(0,9)) for i in range(5)])

def random_18_digits():
    return ''.join([str(random.randint(0,9)) for i in range(18)])

def random_number(var):
    n = int(var)
    return ''.join([str(random.randint(0,9)) for i in range(n)])

def random_number_transaction(val):
    n = int(val)
    return ''.join([str(random.randint(1,100)) for i in range(n)])

def random_amount():
    return float(decimal.Decimal(random.randrange(155, 10000))/100)

def random_ip_address():
    return '{}.{}.{}.{}'.format(*__import__('random').sample(range(0,255),4))

def random_hour():
    h=  random.randint(0,23)
    if h<10:
        return  '0' + str(h)
    else:
        return h

def random_minute():
    h=  random.randint(0,59)
    if h<10:
        return  '0' + str(h)
    else:
        return h
    
def random_case_type():
    case_list = ['หลอกลวงซื้อขายสินค้า หรือบริการ', 'หลอกลวงเป็นบุคคลอื่นเพื่อยืมเงิน', 
                 'หลอกลวงให้รักแล้วโอนเงิน', 'หลอกลวงให้โอนเงินเพื่อรับรางวัล หรือวัตถุประสงค์อื่นๆ', 
                 'หลอกลวงให้กู้เงินอันมีลักษณะฉ้อโกง กรรโชก หรือรีดเอาทรัพย์', 'หลอกลวงให้โอนเงินเพื่อทํางานหารายได้พิเศษ', 
                 'ข่มขู่ทางโทรศัพท์ให้เกิดความกลัวแล้วหลอกให้โอนเงิน', 'หลอกลวงให้ติดตั้งโปรแกรมควบคุมระบบในเครื่องโทรศัพท์', 
                 'กระทําต่อระบบหรือข้อมูลคอมพิวเตอร์โดยผิดกฎหมาย (Hacking) เพื่อฉ้อโกง กรรโชก หรือรีดเอาทรัพย์', 'เข้ารหัสข้อมูลคอมพิวเตอร์ของผู้อื่นโดยมิชอบเพื่อกรรโชก หรือรีดเอาทรัพย์ (Ransomware)', 
                 'หลอกลวงให้ลงทุนผ่านระบบคอมพิวเตอร์', 'หลอกลวงให้ลงทุนที่เป็นความผิดตาม พ.ร.ก.กู้ยืมเงินฯ', 'กรณีอื่นๆที่พิจารณาแล้วเข้าข่ายตามมาตรา 3']
    return random.choice(case_list)

def random_BankCode():
    case_list = ['002','004','006','008','011','014','017','018','020','023','024','025']
    return random.choice(case_list)

def random_case_type_nobuyer():
    case_list = ['หลอกลวงเป็นบุคคลอื่นเพื่อยืมเงิน', 
                 'หลอกลวงให้รักแล้วโอนเงิน', 'หลอกลวงให้โอนเงินเพื่อรับรางวัล หรือวัตถุประสงค์อื่นๆ', 
                 'หลอกลวงให้กู้เงินอันมีลักษณะฉ้อโกง กรรโชก หรือรีดเอาทรัพย์', 'หลอกลวงให้โอนเงินเพื่อทํางานหารายได้พิเศษ', 
                 'ข่มขู่ทางโทรศัพท์ให้เกิดความกลัวแล้วหลอกให้โอนเงิน', 'หลอกลวงให้ติดตั้งโปรแกรมควบคุมระบบในเครื่องโทรศัพท์', 
                 'กระทําต่อระบบหรือข้อมูลคอมพิวเตอร์โดยผิดกฎหมาย (Hacking) เพื่อฉ้อโกง กรรโชก หรือรีดเอาทรัพย์', 'เข้ารหัสข้อมูลคอมพิวเตอร์ของผู้อื่นโดยมิชอบเพื่อกรรโชก หรือรีดเอาทรัพย์ (Ransomware)', 
                 'หลอกลวงให้ลงทุนผ่านระบบคอมพิวเตอร์', 'หลอกลวงให้ลงทุนที่เป็นความผิดตาม พ.ร.ก.กู้ยืมเงินฯ', 'กรณีอื่นๆที่พิจารณาแล้วเข้าข่ายตามมาตรา 3']
    return random.choice(case_list)


def random_bank():
    bank_list = ['ธนาคารกรุงเทพ จำกัด (มหาชน)', 'ธนาคารกสิกรไทย จำกัด (มหาชน)', 
                 'ธนาคารกรุงไทย จำกัด (มหาชน)', 'ธนาคาร เจพีมอร์แกน เชส',
                 'ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด', 'ธนาคารทหารไทยธนชาต จำกัด (มหาชน)',
                 'ธนาคารไทยพาณิชย์ จำกัด (มหาชน)', 'ธนาคารซิตี้แบงก์', 
                 'ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น', 'ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)', 
                 'ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)', 'ธนาคาร อาร์ เอช บี จำกัด', 
                 'ธนาคารยูโอบี จำกัด (มหาชน)', 'ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)', 
                 'ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)', 'ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น', 
                 'ธนาคารอินเดียนโอเวอร์ซีส์', 'ธนาคารออมสิน', 'ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด', 
                 'ธนาคารดอยซ์แบงก์', 'ธนาคารอาคารสงเคราะห์', 'ธนาคารเพื่อการเกษตรและสหกรณ์', 
                 'ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย', 'ธนาคารมิซูโฮ จำกัด', 
                 'ธนาคารบีเอ็นพี พารีบาส์', 'ธนาคารแห่งประเทศจีน จำกัด', 'ธนาคารอิสลามแห่งประเทศไทย', 
                 'ธนาคารทิสโก้ จำกัด (มหาชน)', 'ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)', 
                 'ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)', 'ธนาคารไทยเครดิต จำกัด (มหาชน)', 
                 'ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)', 'ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)',  
                 'ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย']
    return random.choice(bank_list)

def random_relation():
    relation_list = ['บุตร', 'ญาติ', 'เพื่อน', 'พี่น้อง', 'คู่สมรส']
    return random.choice(relation_list)

def random_bank_block_type():
    bank_block_type_list = ['ระงับเฉพาะยอดเงิน', 'ระงับทั้งบัญชี']
    return random.choice(bank_block_type_list)

def random_polics_block_type():
    bank_block_type_list = ['หมายอายัดเฉพาะยอดเงินที่ระบุ (Q)', 'หมายอายัดทั้งบัญชี (R)']
    return random.choice(bank_block_type_list)

def random_promptpay_type():
    pp_type_list = ['ไม่มี', 'เบอร์โทร', 'หมายเลขบัตรประชาชน', 'เลขนิติบุคคล (Biller Id)', 'e-wallet']
    return random.choice(pp_type_list)

def random_string(val):
    n = int(val)
    special = '/+():.,|- '
    thai = 'กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทธนบปผฝพฟภมยรลวศษสหฬอฮ'
    return ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits + special + thai) for _ in range(n))

# def random_string_eng(val):
#     n = int(val)
#     special = '/+():.,-'
#     thai = 'ABCDEFGHIJKLMNOPQRSTWXYZ'
#     return ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits + special + thai) for _ in range(n))

def random_string_eng(val):
    n = int(val)
    # special = '/+():.,-'
    thai = 'ABCDEFGHIJKLMNOPQRSTWXYZ'
    return ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits + thai) for _ in range(n))

def random_locky_name(filename):
    with open(filename, encoding="utf8") as file: 
        lines = file.readlines() 
        random_line = random.choice(lines) 
    return random_line 

def random_email(val):
     n = int(val)
     email_list = ['@gmail.com', '@hotmail.com']
     email_name =  ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(n))
     return   email_name + random.choice(email_list)

def random_string_case_detail(val):
    n = int(val)
    special = '/+?():.,-'
    thai = 'กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทธนบปผฝพฟภมยรลวศษสหฬอฮ'
    return ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits + special + thai) for _ in range(n))

def random_name(val):
    n = int(val)
    special = '.(), '
    thai = 'กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทธนบปผฝพฟภมยรลวศษสหฬอฮ'
    return ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + special + thai) for _ in range(n))

def generate_thai_citizen_id():
    # Generate random digits (not following the real generation process)
    digits = [str(random.randint(1, 9)) for _ in range(12)]

    # Simulate a checksum digit (replace with actual validation logic)
    checksum = sum(int(digit) * (13 - i) for i, digit in enumerate(digits)) % 11
    checksum = 1 if checksum == 0 else 0 if checksum == 1 else 11 - checksum

    # Combine digits and checksum for display (not a real ID)
    return ''.join(digits + [str(checksum)])

def get_type(val):
    return type(val)

def do_format_string(string, *args):
    x = string % (args)
    return x

def convert_to_unicode(val):
    if val is None:
        return val
    return val.decode('utf-8')

def convert_to_float(val):
    try:
        return float(val)
    except TypeError:
        return None
    
def convert_to_int(val):
    try:
        return int(val)
    except TypeError:
        return None

def list_to_string(separator=",", quote='"' , *vals):
    s = ""
    for val in vals:
        if quote is not None:
            s += quote + val + quote + separator
        else:
            s += val + separator
        
    return s[0:(len(s) - len(separator))]
        
    
def string_start_with(text, startwith):
    return text.startswith(startwith)

def encode_barcode(barcode):
    return barcode.replace("|","%7C").replace(" ","+")

def get_barcode_part_by_index(barcode, idx):
    parts = barcode.split(" ")
    if idx==0:
        return parts[0][1:]
    else:
        return parts[idx]

def get_var_type(var):
    return type(var)

def extract_value_from_strings(text, keyword):
    lines = text.split("\n")
    for line in lines:
        idx = line.find(keyword)
        if idx >= 0:
            return line[idx + len(keyword):].strip()

def encode_base64_SHA256(secret, message):
    secretBytes = bytes(secret).encode('utf-8')    
    messageBytes = bytes(message).encode('utf-8')
    signature = base64.b64encode(hmac.new(secretBytes, messageBytes, digestmod=hashlib.sha256).digest())
    return signature

def encode_hex_SHA256(secret, message):
    secretBytes = bytes(secret).encode('utf-8')    
    messageBytes = bytes(message).encode('utf-8')
    cipher =  hmac.new(secretBytes, messageBytes, digestmod=hashlib.sha256).digest()
    signature = binascii.hexlify(cipher)
    return signature

def encode_hmac_SHA1(secret, message):
    from hashlib import sha1
    import hmac
    cipher = hmac.new(str(secret), str(message), sha1).digest()
    signature = binascii.hexlify(cipher)
    return signature

def encode_MD5(message):
    m = md5.new()
    message = message.encode('utf-8')
    m.update(message)
    cipher = m.hexdigest()
    return cipher


def get_text_between(text, left, right):
    if text is None:
        return ""
    idx = text.find(left)
    if idx < 0:
        return ""
    idx2 = text.find(right, idx + len(left))
    if idx2 < 0:
        return ""
    return text[idx + len(left) : idx2]

def encode_url_pmgw(secret):
       
    secretBytes = secret.encode('utf-8')    
    message = urllib.quote_plus(secretBytes,'=&')

    return message

def date_format (year,month,day,timeformat):
    timee = datetime.date(int(year),int(month),int(day))
    return timee.strftime(timeformat)
	
def float_to_comma(number):
    return format(number, ',.2f');
	
def covert_telno_to_format(telno):
    t = telno[:3];
    e = telno[3:6];
    l = telno[6:10];
    tel = '{0}-{1}-{2}'.format(t,e,l);
    return tel;



# def random_warrantID_digits(Number2):
#      wartantIDTEST  = int(Number2)
#     return ''.join([str(random.randint(0,9)) for i in range(wartantIDTEST)])