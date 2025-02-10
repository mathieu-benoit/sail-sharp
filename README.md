# Sail Sharp - Security best practices with .NET Core & Kubernetes

[![push-tag](https://github.com/mathieu-benoit/sail-sharp/actions/workflows/push-tag.yml/badge.svg)](https://github.com/mathieu-benoit/sail-sharp/actions/workflows/push-tag.yml)
[![promote-env](https://github.com/mathieu-benoit/sail-sharp/actions/workflows/promote-env.yml/badge.svg)](https://github.com/mathieu-benoit/sail-sharp/actions/workflows/promote-env.yml)
[![open-pr](https://github.com/mathieu-benoit/sail-sharp/actions/workflows/open-pr.yml/badge.svg)](https://github.com/mathieu-benoit/sail-sharp/actions/workflows/open-pr.yml)
[![close-pr](https://github.com/mathieu-benoit/sail-sharp/actions/workflows/close-pr.yml/badge.svg)](https://github.com/mathieu-benoit/sail-sharp/actions/workflows/close-pr.yml)


## 🌏  Open in the Cloud 
Click any of the buttons below to start a new development environment to demo or contribute to the codebase:

[![Open in VS Code](https://img.shields.io/badge/Open%20in-VS%20Code-blue?logo=visualstudiocode)](https://vscode.dev/github/mathieu-benoit/sail-sharp)
[![Open in Glitch](https://img.shields.io/badge/Open%20in-Glitch-blue?logo=glitch)](https://glitch.com/edit/#!/import/github/mathieu-benoit/sail-sharp)
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/mathieu-benoit/sail-sharp)
[![Edit in Codesandbox](https://codesandbox.io/static/img/play-codesandbox.svg)](https://codesandbox.io/s/github/mathieu-benoit/sail-sharp)
[![Open in StackBlitz](https://developer.stackblitz.com/img/open_in_stackblitz.svg)](https://stackblitz.com/github/mathieu-benoit/sail-sharp)
[![Open in Repl.it](https://replit.com/badge/github/withastro/astro)](https://replit.com/github/mathieu-benoit/sail-sharp)
[![Open in Codeanywhere](https://codeanywhere.com/img/open-in-codeanywhere-btn.svg)](https://app.codeanywhere.com/#https://github.com/mathieu-benoit/sail-sharp)
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/mathieu-benoit/sail-sharp)

Associated blog posts:
- [Sail Sharp, 8 tips to optimize and secure your .NET containers for Kubernetes](https://medium.com/p/c68ba253844a)
- [alpine, distroless or scratch?](https://medium.com/google-cloud/alpine-distroless-or-scratch-caac35250e0b)
- [Keyless Google Cloud Authentication to push your containers to Artifact Registry from GitHub Actions](https://medium.com/p/3932dce678b8)

## Deploy the pre-built container with `docker` and `kubectl`

Run the pre-built container with Docker:
```bash
docker run \
    -d \
    -p 8080:8080 \
    --read-only \
    --cap-drop=ALL \
    --user=65532 \
    ghcr.io/mathieu-benoit/my-sample-workload:latest
```

Deploy the pre-built container on Kubernetes:
```bash
kubectl apply \
    -f deployment.yaml
kubectl apply \
    -f service.yaml
```

## Build and deploy the container with Score with `docker compose`, `kubectl` and `humctl`

Build and run the container with Docker Compose:
```bash
make compose-up

make compose-test
```

Deploy the container in a local Kind cluster:
```bash
make kind-create-cluster

make kind-load-image

make k8s-up

make k8s-test
```

Deploy the pre-built container with Score/Humanitec:
```bash
humctl score deploy \
    --token ${HUMANITEC_TOKEN} \
    --org ${HUMANITEC_ORG} \
    --app ${APP_ID} \
    --env ${ENVIRONMENT_ID} \
    -f score/score.yaml \
    -i ghcr.io/mathieu-benoit/my-sample-workload:latest \
    --wait
```
