pipeline {
    agent any
    triggers {
        pollSCM('* * * * *') // optional: check every minute for demo
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/A-RefaiRTA/helloservice.git'
            }
        }
        stage('Build') {
            steps {
                sh './mvnw clean package'
            }
        }
        stage('Test') {
            steps {
                sh './mvnw test'
            }
        }
    }
    post {
        success {
            echo 'Build and tests successful!'
        }
        failure {
            echo 'Build or tests failed.'
        }
    }
}
