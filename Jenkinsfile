pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/your-repo/your-project.git'
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
