pipeline {
    agent any
    environment {
        IMAGE_NAME = "venkatesh1409/sample-nodejs-app"
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
    }
    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir()
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
                sh 'docker build -t $IMAGE_NAME:v3 .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                sh 'docker push $IMAGE_NAME:latest'
            }
        }
    }
}
