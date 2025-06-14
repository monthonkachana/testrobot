from robot.libraries.BuiltIn import BuiltIn
import time

def android_press_search_custom():
    lib = BuiltIn().get_library_instance('AppiumLibrary')
    driver = lib._current_application()
    
    driver.execute_script('mobile: shell', {
    'command': 'ime',
    'args': ['set', 'io.appium.settings/.UnicodeIME' ],
    'includeStderr': True,
    'timeout': 5000
    })
    time.sleep(2)
    driver.execute_script('mobile: shell', {
    'command': 'ime',
    'args': ['set', 'io.appium.settings/.AppiumIME' ],
    'includeStderr': True,
    'timeout': 5000
    })
    time.sleep(2)
    driver.execute_script('mobile: performEditorAction', {'action': 'search'})
