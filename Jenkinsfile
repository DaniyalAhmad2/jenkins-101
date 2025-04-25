pipeline {
    agent { node { label 'docker-agent-python' } }

    triggers { pollSCM('* * * * *') }

    stages {

        stage('Build') {
            steps {
                echo 'Building …'
                sh '''
                    # always start in workspace root
                    python3 -m venv .venv          # create isolated site-packages
                    . .venv/bin/activate           # activate it
                    pip install --upgrade pip
                    pip install -r myapp/requirements.txt
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Testing …'
                sh '''
                    . .venv/bin/activate           # re-activate in this step
                    python myapp/hello.py
                    python myapp/hello.py --name Brad
                    python myapp/hello.py --name Daniyal
                '''
            }
        }

        stage('Deliver') {
            steps {
                echo 'Deliver …'
                sh 'echo "doing delivery stuff …"'
            }
        }
    }
}
