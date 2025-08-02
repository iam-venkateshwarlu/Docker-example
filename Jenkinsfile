pipeline {
    agent any

    environment {
        DOCKERHUB_USER = credentials('dockerhub-creds').username
        DOCKERHUB_PASS = credentials('dockerhub-creds').password
        IMAGE_NAME     = "venkatesh1409/sample-nodejs-app"
        IMAGE_TAG      =  "v3" //"${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/iam-venkateshwarlu/Docker-example.git'
            }
        }
        stage('Setup Docker Buildx') {
            steps {
                sh '''
                  # Ensure buildx is set up; ignore error if already exists
                  docker buildx create --use || echo "Buildx builder already exists."
                  docker buildx inspect --bootstrap
                '''
            }
        }
        stage('Login to Docker Hub') {
            steps {
                sh '''
                  echo "${DOCKERHUB_PASS}" | docker login --username "${DOCKERHUB_USER}" --password-stdin
                '''
            }
        }
        stage('Build with Buildx') {
            steps {
                sh '''
                  docker buildx build \
                    --platform linux/amd64 \
                    --tag ${IMAGE_NAME}:${IMAGE_TAG} \
                    --tag ${IMAGE_NAME}:latest \
                    --push \
                    -f Dockerfile .
                '''
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
