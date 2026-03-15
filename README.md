# Custom GitHub Actions Runner Image

Docker image based on the [official GitHub Actions runner](https://github.com/actions/runner) with extra tools preinstalled for CI workflows. The image is kept small by installing packages in a single layer and removing apt cache.

## Preinstalled tools

- **make** – Build automation
- **git** – Version control
- **yq** – YAML/JSON processing in scripts
- **curl** – HTTP client
- **wget** – File download
- **tar** – Archive creation and extraction
- **zip** / **unzip** – Archive handling
- **bash** – Shell
- **ca-certificates** – TLS/HTTPS certificates
- **jq** – JSON processing in scripts

## Usage

Use this image when configuring a self-hosted runner (e.g. in Kubernetes or Docker) that needs these tools. See [GitHub’s documentation](https://docs.github.com/en/actions/hosting-your-own-runners) for setting up self-hosted runners.

Example local run (after configuring the runner):

```bash
docker run -e RUNNER_TOKEN=... -e RUNNER_ORG=... your-dockerhub-username/gha-runner:latest
```

## Building locally

```bash
docker build -t gha-runner .
```