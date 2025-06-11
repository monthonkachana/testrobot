
# setup a virtual environment. Install the package:
python -m pip install --user virtualenv
# Create the virtual environment
python -m venv .venv
# Activate the virtual environment
.venv\Scripts\activate.bat

# install library 
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org pip robotframework==7.0.1
pip install robotframework-datetime

# Run Command
python -m robot.run -L TRACE -d result -v ENV:dev -e not_ready testcases/

python -m robot.run -L TRACE --name "API" -v ENV:dev -v totalrun:2 -t clear* -i Clear .\Script/api/DownloadFile.robot