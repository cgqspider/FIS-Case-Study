pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/cgqspider/FIS-Case-Study.git'
            }
        }
        stage('Build') {
            steps {
                sh 'sudo docker build -t my-app .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'sudo docker run -d -p 8082:80 my-app'
            }
        }
    }
}
