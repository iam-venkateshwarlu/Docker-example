FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y git docker.io && \
    rm -rf /var/lib/apt/lists/*

# Add jenkins to docker group
ARG DOCKER_GID=20
RUN groupadd -g ${DOCKER_GID} docker || true && \
    usermod -aG docker jenkins

# 👇 Don't switch back to jenkins
# USER jenkins
