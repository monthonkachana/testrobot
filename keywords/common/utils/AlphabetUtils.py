from ast import keyword
from curses import keyname
import os.path
import json
from robot.api import logger
from robot.api.deco import keyword,not_keyword
import re

def Contains_thai(text):
    thai_pattern = re.compile(r'[\u0E00-\u0E7F]+')
    return bool(thai_pattern.search(text))

def Contains_english(text):
    english_pattern = re.compile(r'[A-Za-z]+')
    return bool(english_pattern.search(text))

def Contains_number(text):
    english_pattern = re.compile(r'[0-9]+')
    return bool(english_pattern.search(text))

def Contains_number_zero(text):
    number_zero_pattern = re.compile(r'[0]+')
    return bool(number_zero_pattern.search(text))

def Contains_digits(text):
    digits_pattern = re.compile(r'\d+')
    return bool(digits_pattern.search(text))

def Contains_special_characters(text):
    special_characters_pattern = re.compile(r'[.,!?:;"-+*/=><%&|~^$@#_\']+')
    return bool(special_characters_pattern.search(text))

def Contains_special_characters_dash(text):
    special_characters_dash_pattern = re.compile(r'[-]+')
    return bool(special_characters_dash_pattern.search(text))

def Contains_special_characters_except_dash(text):
    special_characters_except_dash_pattern = re.compile(r'[.,!?:;"+*/=>\<%&|~^$@#_]+')
    return bool(special_characters_except_dash_pattern.search(text))

def Contains_special_characters_not_email(text):
    special_characters_not_email_pattern = re.compile(r'[;>\<]+')
    return bool(special_characters_not_email_pattern.search(text))

def Contains_special_characters_assign(text):
    special_characters_assign_pattern = re.compile(r'[@]+')
    return bool(special_characters_assign_pattern.search(text))

def Contains_special_characters_comma(text):
    special_characters_comma_pattern = re.compile(r'[,]+')
    return bool(special_characters_comma_pattern.search(text))

def Contains_special_characters_slash(text):
    special_characters_slash_pattern = re.compile(r'[/]+')
    return bool(special_characters_slash_pattern.search(text))