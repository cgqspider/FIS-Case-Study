pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t my-app .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 8082:80 my-app'
            }
        }
    }
}
