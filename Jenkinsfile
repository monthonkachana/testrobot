pipeline {
    agent any

    environment {
        VIRTUALENV_DIR = 'venv'
    }

    stages {
        stage('Checkout Code From Git') {
            steps {
                git url: 'https://github.com/monthonkachana/testrobot', branch: 'mobile-test-ttb'
            }
        }

        stage('Setup Python & Install Dependencies') {
            steps {
                sh '''
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Test Automate') {
            steps {
                sh '''
                    python -m robot.run -L TRACE -d result -v ENV:max testcases/tc_ttb_01.robot
                '''
            }
        }

        stage('Send Result To Jenkins') {
            steps {
                archiveArtifacts artifacts: 'result/**/*.*', fingerprint: true
                junit 'result/*.xml'
            }
        }
    }
}
