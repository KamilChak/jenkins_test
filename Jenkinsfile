pipeline {
    agent any

    stages {
        stage('Setup Python Environment') {
            steps {
                sh '''
                chmod +x envsetup.sh
                ./envsetup.sh
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                . env/bin/activate
                python3 manage.py test
                '''
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
