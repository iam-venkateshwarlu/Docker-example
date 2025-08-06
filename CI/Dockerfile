FROM jenkins/jenkins:lts

USER root

# Install git and docker CLI
RUN apt-get update && \
    apt-get install -y git docker.io && \
    rm -rf /var/lib/apt/lists/*

# Add docker group (with placeholder GID) and add jenkins user to it
ARG DOCKER_GID=1
RUN groupadd -g ${DOCKER_GID} docker || true && \
usermod -aG docker jenkins

USER jenkins
