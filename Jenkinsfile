pipeline {
    agent any

    triggers {
        githubPush()
    }

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
                script {
                    def randomName = UUID.randomUUID().toString().replaceAll('-', '')
                    env.IMAGE_NAME = randomName
                    sh "docker build -t ${randomName} ."
                }
            }
        }
        stage('Deploy') {
            steps {
                sh "docker run -d -p 8082:80 ${env.IMAGE_NAME}"
            }
        }
    }
}
