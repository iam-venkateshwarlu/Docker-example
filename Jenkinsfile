pipeline {
    agent any
    environment {
          DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
            IMAGE_NAME = "venkatesh1409/sample-nodejs-app"
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/iam-venkateshwarlu/Docker-example.git'
            }
        }
        /*
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
        }*/

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:v3 -f app/Dockerfile app'
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
