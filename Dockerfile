FROM ghcr.io/actions/actions-runner:latest

USER root

# Install common CI tools in a single layer; remove apt lists to keep image small
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
 && rm -rf /var/lib/apt/lists/*

USER runner
