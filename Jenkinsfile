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
          // Ensure Docker Buildx is set up
          sh '''
            docker buildx create --use || true
            docker buildx inspect --bootstrap
          '''
            // Build using buildx
            sh """
            docker buildx build \
  --platform linux/amd64 \
  -t venkatesh1409/multiplatform:v3 \
  -f Dockerfile . \
  --load
          """
        }
      }
    }
    stage('Push') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds') {
            docker.image("venkatesh1409/sample-nodejs-app:v3").push()
          }
        }
      }
    }
    // stage('Deploy') {
    //   steps {
    //     script {
    //       // Remove old container if exists
    //       sh 'docker rm -f node-app || true'
    //       // Run new container
    //       sh 'docker run -d --name node-app -p 3000:3000 venkatesh1409/sample-nodejs-app:${BUILD_NUMBER}'
    //     }
    //   }
    // }
  }
}
