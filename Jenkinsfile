pipeline {
    agent any

    stages {
        stage('Setup Python') {
            steps {
                sh 'python3 -m venv venv'
                sh '. venv/bin/activate'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '. venv/bin/activate && pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh '. venv/bin/activate && python manage.py test'
            }
        }

        stage('Build') {
            steps {
                sh '. venv/bin/activate && python manage.py collectstatic --noinput'
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "Deploying the project..."'
                //deployment scripts or commands here
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            deleteDir()
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
