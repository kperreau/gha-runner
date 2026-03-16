FROM ghcr.io/actions/actions-runner:latest

USER root

# Install common CI tools + C compiler
RUN apt-get update && apt-get install -y \
    make \
    git \
    yq \
    curl \
    wget \
    tar \
    zip \
    unzip \
    bash \
    ca-certificates \
    jq \
    build-essential \
    openssh-client \
 && rm -rf /var/lib/apt/lists/*

USER runner

RUN mkdir -p /home/runner/.ssh \
 && chmod 700 /home/runner/.ssh \
 && touch /home/runner/.ssh/known_hosts \
 && chmod 644 /home/runner/.ssh/known_hosts \
 && ssh-keyscan github.com >> /home/runner/.ssh/known_hosts
