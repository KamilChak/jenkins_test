pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t jenkinsTest .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    sh 'docker run --rm jenkinsTest python3 manage.py test'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p 8000:8000 jenkinsTest'
                }
            }
        }
/*
        stage('Gunicorn setup'){
            steps{
                sh '''
                chmod +x gunicorn.sh
                ./gunicorn.sh
                '''
            }
        }

        stage('Nginx setup'){
            steps{
                sh '''
                chmod +x nginx.sh
                ./nginx.sh
                '''
            }
        }
    }*/

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
}