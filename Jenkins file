pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/hemanthtadi/Automated-java-app-deployment-using-terraform.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t java-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8080:8080 java-app'
            }
        }
    }
}
