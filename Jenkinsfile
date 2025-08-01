pipeline {
  agent any
  environment {
    DOCKER_BUILDKIT = "1"
    DOCKER_CLI_EXPERIMENTAL = "enabled"
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
        //   docker.build("venkatesh1409/sample-nodejs-app:${BUILD_NUMBER}")
        // Verify files exist before building
          sh 'ls -l'
          // If your Dockerfile is in the repo root, keep "."
          // If it’s in a subdirectory (e.g., app/), update -f accordingly
            sh "docker buildx build --platform linux/amd64 -t venkatesh1409/sample-nodejs-app:${BUILD_NUMBER} -f Dockerfile ."
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
