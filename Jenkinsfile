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
                git branch: 'ain',
                    url: 'https://github.com/cgqspider/FIS-Case-Study.git'
            }
        }
        stage('Build') {
            steps {
                def randomName = UUID.randomUUID().toString().replaceAll('-', '')
                sh "docker build -t ${randomName}."
                env.IMAGE_NAME = randomName
            }
        }
        stage('Deploy') {
            steps {
                sh "docker run -d -p 8082:80 ${IMAGE_NAME}"
            }
        }
    }
}
