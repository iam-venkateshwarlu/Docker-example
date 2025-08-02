pipeline {
    agent any
    environment {
        IMAGE_NAME = "venkatesh1409/sample-nodejs-app"
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/iam-venkateshwarlu/Docker-example.git'
            }
        }
        stage('Verify Dockerfile') {
            steps {
                sh 'ls -l'
                sh 'cat Dockerfile'
            }
        }
        stage('Setup Docker Buildx') {
            steps {
                sh '''
                  docker buildx create --use || echo "Buildx builder already exists."
                  docker buildx inspect --bootstrap
                '''
            }
        }
        stage('Login to Docker Hub & Build/Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh '''
                        echo "${DOCKERHUB_PASS}" | docker login --username "${DOCKERHUB_USER}" --password-stdin
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
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
