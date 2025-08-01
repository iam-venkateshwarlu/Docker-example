pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
  }
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/iam-venkateshwarlu/Docker-example.git'
      }
    }
    stage('Build') {
      steps {
        script {
          docker.build("venkatesh1409/sample-nodejs-app:${BUILD_NUMBER}")
        }
      }
    }
    stage('Push') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds') {
            docker.image("yourusername/sample-nodejs-app:${BUILD_NUMBER}").push()
          }
        }
      }
    }
    stage('Deploy') {
      steps {
        script {
          // Remove old container if exists
          sh 'docker rm -f node-app || true'
          // Run new container
          sh 'docker run -d --name node-app -p 3000:3000 venkatesh1409/sample-nodejs-app:${BUILD_NUMBER}'
        }
      }
    }
  }
}
