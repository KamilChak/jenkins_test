pipeline {
    agent any

    stages {
        stage('Setup Python Environment') {
            steps {
                // Ensure Python and virtualenv are installed
                sh 'python -m venv venv'
                sh 'source venv/bin/activate'
                sh 'pip install --upgrade pip'
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                // Run tests in the venv
                sh '''
                source venv/bin/activate
                python manage.py test
                '''
            }
        }

        stage('Build Static Files') {
            steps {
                // Collect static files in the venv
                sh '''
                source venv/bin/activate
                python manage.py collectstatic --noinput
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the project...'
                // Add your deployment scripts or commands here
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
