# Custom GitHub Actions Runner Image

Docker image based on the [official GitHub Actions runner](https://github.com/actions/runner) with extra tools preinstalled for CI workflows. The image is kept small by installing packages in a single layer and removing apt cache.

## Preinstalled tools

- **make** – Build automation
- **git** – Version control
- **yq** – YAML/JSON processing in scripts
- **curl** – HTTP client
- **wget** – File download
- **tar** – Archive creation and extraction
- **xz-utils** – `.xz` / LZMA archives
- **zip** / **unzip** – Archive handling
- **bash** – Shell
- **ca-certificates** – TLS/HTTPS certificates
- **jq** – JSON processing in scripts
- **build-essential** – C/C++ compiler toolchain (gcc, g++, etc.)
- **openssh-client** – `ssh`, `scp`, `ssh-keyscan` (GitHub host key pre-seeded in `known_hosts`)
- **ffmpeg** – Audio/video processing
- **fonts-liberation**, **fonts-dejavu**, **fonts-freefont-ttf** – Fonts for headless rendering
- **nodejs** / **npm** – JavaScript runtime and package manager
- **Chromium** (via Playwright) – Headless browser for E2E tests (`npx playwright` already available)

## Usage

Use this image when configuring a self-hosted runner (e.g. in Kubernetes or Docker) that needs these tools. See [GitHub’s documentation](https://docs.github.com/en/actions/hosting-your-own-runners) for setting up self-hosted runners.

Example local run (after configuring the runner):

```bash
docker run -e RUNNER_TOKEN=... -e RUNNER_ORG=... your-dockerhub-username/gha-runner:latest
```

## Building locally

```bash
make build
# or: docker build -t gha-runner .
```

## Publishing the image

1. Log in to Docker Hub: `docker login`
2. Build and push with your username:

```bash
make push DOCKER_USER=your-dockerhub-username
```

The image will be pushed as `your-dockerhub-username/gha-runner:latest` and `your-dockerhub-username/gha-runner:<git-sha>`. To make it public, set the repository visibility to **Public** in [Docker Hub](https://hub.docker.com/) (Repository settings → Make Public).

Alternatively, each push to `main` triggers the GitHub Actions workflow which builds and pushes the image using the `DOCKERHUB_USERNAME` and `DOCKERHUB_PAT` secrets.