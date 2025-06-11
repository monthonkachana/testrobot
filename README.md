
# setup a virtual environment. Install the package:
python -m pip install --user virtualenv
# Create the virtual environment
python -m venv .venv
# Activate the virtual environment
.venv\Scripts\activate.bat

# install library 
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org pip robotframework==7.0.1


# Run Command
python -m robot.run -L TRACE -d result -v ENV:dev -e not_ready testcases/

TS004_UAT_TC004_002