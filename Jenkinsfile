pipeline {
    agent any

    environment {
        IMAGE_NAME = 'your-dockerhub-username/your-image-name' // Replace with your Docker Hub username and image name
        IMAGE_TAG = 'v3'
    }

    stages {
        // stage('Clean Workspace') {
        //     steps {
        //         deleteDir()
        //     }
        // }

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