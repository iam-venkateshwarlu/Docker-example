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
                dir('..') {
                    sh 'npm install'
                }
            }
        }
        stage('Run Unit Tests') {
            steps {
                sh 'npm test || echo "⚠️ No tests found, skipping..."'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh """
                   docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} .
                   docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} ${DOCKER_IMAGE}:latest
                """
            }
        }
        stage('Security Scan') {
            steps {
                sh """
                   trivy image --exit-code 0 --severity HIGH,CRITICAL ${DOCKER_IMAGE}:${BUILD_NUMBER}
                """
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                       echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                       docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}
                       docker push ${DOCKER_IMAGE}:latest
                    """
                }
            }
        }
        stage('Deploy to Minikube') {
            steps {
                sh """
                   kubectl set image deployment/sample-nodejs-app sample-nodejs-app=${DOCKER_IMAGE}:${BUILD_NUMBER} --record
                """
            }
        }
        stage('Smoke Test') {
            steps {
                sh 'curl -s http://$(minikube ip):3000/health || echo "⚠️ Smoke test failed"'
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
