from robot.libraries.BuiltIn import BuiltIn
from AppiumLibrary import AppiumLibrary
import base64
import time
import subprocess
from robot.api.deco import keyword

class AdbUtils:
    def get_driver_instance(self):
        return BuiltIn().get_library_instance('AppiumLibrary')._current_application()

    @keyword("Disable IME Keyboard Using ADB")
    def disable_ime_keyboard_using_adb(self):
        driver = self.get_driver_instance()
        driver.execute_script('mobile: shell', {
            'command': 'ime',
            'args': ['disable', 'io.appium.settings/.AppiumIME'],
            'includeStderr': True,
            'timeout': 5000
        })
        time.sleep(2)

    @keyword("Enable IME Keyboard Using ADB")
    def enable_ime_keyboard_using_adb(self):
        driver = self.get_driver_instance()
        driver.execute_script('mobile: shell', {
            'command': 'ime',
            'args': ['enable', 'io.appium.settings/.AppiumIME'],
            'includeStderr': True,
            'timeout': 5000
        })
        time.sleep(2)

    @keyword("Press Search Button On Appium IME Using ADB")
    def press_search_button_on_appium_ime_using_adb(self):
        driver = self.get_driver_instance()
        driver.execute_script('mobile: shell', {
            'command': 'ime',
            'args': ['set', 'io.appium.settings/.UnicodeIME'],
            'includeStderr': True,
            'timeout': 5000
        })
        time.sleep(2)
        driver.execute_script('mobile: shell', {
            'command': 'ime',
            'args': ['set', 'io.appium.settings/.AppiumIME'],
            'includeStderr': True,
            'timeout': 5000
        })
        time.sleep(2)
        driver.execute_script('mobile: performEditorAction', {'action': 'search'})

    @keyword("Check Notification Sound")
    def check_notification_sound(self):
        try:
            time.sleep(3)
            subprocess.run(['adb', 'logcat', '-c'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            time.sleep(7)
            result = subprocess.run(['adb', 'shell', 'logcat', '-d'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            log_output = result.stdout.decode('utf-8', errors='ignore')
            if "AudioTrack" in log_output:
                return True
            else:
                return False
        except FileNotFoundError:
            print("ADB not found. Make sure it is installed and added to PATH.")
            return False

    @keyword("Check Vibration")
    def check_vibration(self):
        try:
            subprocess.run(['adb', 'logcat', '-c'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            time.sleep(7)
            result = subprocess.run(['adb', 'shell', 'logcat', '-d'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            dumpsys_output = result.stdout.decode('utf-8', errors='ignore')
            if "vibrator" in dumpsys_output.lower():
                return True
            else:
                return False
        except FileNotFoundError:
            print("ADB not found. Make sure it is installed and added to PATH.")
            return False

    @keyword("Check noti sound and vibration")
    def check_vibration(self):
        try:
            time.sleep(3)
            subprocess.run(['adb', 'logcat', '-c'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            time.sleep(7)
            result = subprocess.run(['adb', 'shell', 'logcat', '-d'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            log_output = result.stdout.decode('utf-8', errors='ignore')
            if "Vibrator" in log_output and "AudioTrack" in log_output:
                return True
            else:
                return False
        except FileNotFoundError:
            print("ADB not found. Make sure it is installed and added to PATH.")
            return False