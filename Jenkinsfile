pipeline {
    agent any
     tools { nodejs "NodeJS24" }
    environment {
        DOCKER_IMAGE = "venkatesh1409/sample-nodejs-app"
        DOCKER_TAG = "v${env.BUILD_NUMBER}"
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/iam-venkateshwarlu/Docker-example.git'
            }
        }
         stage('Install Dependencies') {
            steps {
                dir('app') {
                    sh 'npm install'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push $DOCKER_IMAGE:$DOCKER_TAG'
                }
            }
        }
    }
    post {
        success {
            echo "✅ Docker image pushed successfully: $DOCKER_IMAGE:$DOCKER_TAG"
        }
        failure {
            echo "❌ Pipeline failed! Check console logs."
        }
    }
}
