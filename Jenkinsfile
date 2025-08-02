pipeline {
    agent any

    stages {
        stage('Allocate Node') {
            steps {
                script {
                    echo "Running on node: ${env.NODE_NAME}"
                }
            }
        }

        stage('Checkout') {
            steps {
                git 'https://github.com/iam-venkateshwarlu/Docker-example.git'
            }
        }

        stage('Verify Files') {
            steps {
                sh 'pwd'
                sh 'ls -l'
                sh 'cat Dockerfile || echo "NO DOCKERFILE FOUND"'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }
    }
}