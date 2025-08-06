FROM jenkins/jenkins:lts

USER root

# Install git and docker CLI
RUN apt-get update && \
    apt-get install -y git docker.io && \
    rm -rf /var/lib/apt/lists/*

# Give Jenkins user access to docker.sock
RUN usermod -aG docker jenkins

USER jenkins
