FROM jenkins/jenkins:lts

USER root

# Install tools
RUN apt-get update && \
    apt-get install -y git docker.io && \
    rm -rf /var/lib/apt/lists/*

# Pass GID at build time to match host Docker socket group
ARG DOCKER_GID=1
RUN groupadd -g ${DOCKER_GID} docker || true && \
    usermod -aG docker jenkins

# 👇 Switch back to Jenkins user so pipelines run with correct permissions
USER jenkins
