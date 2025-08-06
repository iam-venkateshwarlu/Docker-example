FROM jenkins/jenkins:lts

USER root

# Install git and docker CLI only (not daemon)
RUN apt-get update && \
    apt-get install -y git curl && \
    curl -fsSL https://get.docker.com/rootless | sh && \
    ln -s /usr/bin/docker /usr/local/bin/docker && \
    rm -rf /var/lib/apt/lists/*

# Add Jenkins to docker group dynamically (host GID)
ARG DOCKER_GID=999
RUN groupadd -for -g ${DOCKER_GID} docker && \
    usermod -aG docker jenkins

USER jenkins
