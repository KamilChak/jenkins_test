pipeline {
    agent any

    stages {

        stage('Install Dependencies') {
            steps {
                sh 'pip install --user -r requirements.txt'
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
        
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
