pipeline {
    agent any

    stages {
        stage('Cleanup') {
            steps {
                sh 'docker stop $(docker ps -aq) && docker rm -f $(docker ps -aq)'
                sh 'docker rmi -f $(docker images -q)'
            }
        }
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/cgqspider/FIS-Case-Study.git'
            }
        }
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
