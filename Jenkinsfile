pipeline {
    agent any

    environment {
        IMAGE_NAME = 'venkatesh1409/sample-nodejs-app'
        IMAGE_TAG = 'v3'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/iam-venkateshwarlu/Docker-example.git'
            }
        }

      stage('Verify Files') {
    steps {
        sh 'pwd'
        sh 'ls -l'
        sh 'cat Dockerfile || echo "Dockerfile missing!"'
    }
}


        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh '''
                        echo "${DOCKERHUB_PASS}" | docker login --username "${DOCKERHUB_USER}" --password-stdin
                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
                    '''
                }
            }
        }
    }
}