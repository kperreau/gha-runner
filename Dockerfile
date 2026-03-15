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
 && rm -rf /var/lib/apt/lists/*

USER runner
