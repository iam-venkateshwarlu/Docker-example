FROM jenkins/jenkins:lts

USER root

# Install git and docker CLI
# RUN apt-get update && \
#     apt-get install -y git docker.io && \
#     rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y git docker.io curl apt-transport-https gnupg && \
    curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" \
        > /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl && \
    rm -rf /var/lib/apt/lists/*

# Add docker group (with placeholder GID) and add jenkins user to it
ARG DOCKER_GID=1
RUN groupadd -g ${DOCKER_GID} docker || true && \
usermod -aG docker jenkins

USER jenkins
