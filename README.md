# Install dependencies

pip install -r requirements.txt

# Run the appium

appium --address 127.0.0.1 --port 4723 --base-path /wd/hub

# Run the test
python -m robot.run -L TRACE -d results -v ENV:max testcases/

# Run Command   * ต้องรัน real device set in \resources\settings\device_max.yaml
python -m robot.run -L TRACE -d result -v ENV:max testcases/tc_ttb_01.robot
