FROM ghcr.io/actions/actions-runner:latest

USER root

# Base tools + ffmpeg + fonts
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - \
 && apt-get update \
 && apt-get install -y \
    make \
    git \
    yq \
    curl \
    wget \
    tar \
    xz-utils \
    zip \
    unzip \
    bash \
    ca-certificates \
    jq \
    build-essential \
    openssh-client \
    ffmpeg \
    fonts-liberation \
    fonts-dejavu \
    fonts-freefont-ttf \
    nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

USER runner

# Preseed GitHub's SSH host key in known_hosts
RUN mkdir -p /home/runner/.ssh \
 && chmod 700 /home/runner/.ssh \
 && touch /home/runner/.ssh/known_hosts \
 && chmod 644 /home/runner/.ssh/known_hosts \
 && ssh-keyscan github.com >> /home/runner/.ssh/known_hosts

# Install headless Chromium and its dependencies (Playwright handles everything)
RUN npx -y playwright@latest install chromium \
 && npm cache clean --force