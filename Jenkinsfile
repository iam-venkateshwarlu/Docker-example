pipeline {
    agent any

    environment {
        IMAGE_NAME = 'venkatesh1409/sample-nodejs-app' // Replace with your Docker Hub username and image name
        IMAGE_TAG = 'v2' // Replace with your desired image tag
    }

    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir() // Cleans the workspace to ensure a fresh build
            }
        }

        stage('Checkout Code') {
            steps {
                git 'https://github.com/iam-venkateshwarlu/Docker-example.git' // Replace with your repo URL
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install' // Installs Node.js dependencies
            }
        }

        stage('Verify Files') {
            steps {
                sh 'pwd' // Prints the current working directory
                sh 'ls -l' // Lists all files in the directory
                sh 'cat Dockerfile || echo "NO DOCKERFILE FOUND"' // Verifies the Dockerfile exists
            }
        }

        // stage('Build Docker Image') {
        //     steps {
        //         sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ." // Builds the Docker image
        //     }
        // }

        stage('Push Docker Image') {
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

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}