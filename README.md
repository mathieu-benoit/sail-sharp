# Sail Sharp - Security best practices with .NET Core & Kubernetes

[![push-tag](https://github.com/mathieu-benoit/sail-sharp/actions/workflows/push-tag.yml/badge.svg)](https://github.com/mathieu-benoit/sail-sharp/actions/workflows/push-tag.yml)

Associated blog posts:
- [Sail Sharp, 8 tips to optimize and secure your .NET containers for Kubernetes](https://medium.com/p/c68ba253844a)
- [Keyless Google Cloud Authentication to push your containers to Artifact Registry from GitHub Actions](https://medium.com/p/3932dce678b8)

## Deploy the pre-built container

Run the pre-built container:
```bash
docker run \
    -d \
    -p 8080:8080 \
    --read-only \
    --cap-drop=ALL \
    --user=65532 \
    ghcr.io/mathieu-benoit/my-sample-app:latest
```

Deploy the pre-built container on Kubernetes:
```bash
kubectl apply \
    -f deployment.yaml
kubectl apply \
    -f service.yaml
```

Deploy the pre-built container with Score/Humanitec:
```bash
humctl score deploy \
    --token ${HUMANITEC_TOKEN} \
    --org ${HUMANITEC_ORG} \
    --app ${APP_ID} \
    --env ${ENVIRONMENT_ID} \
    -f score/score.yaml \
    -i ghcr.io/mathieu-benoit/my-sample-app:latest \
    --wait
```

## Build and test the application locally

Build the application:
```bash
docker build \
    --tag my-sample-app \
    app/
```

Run the application:
```bash
docker run \
    -d \
    -p 8080:8080 \
    --read-only \
    --cap-drop=ALL \
    --user=65532 \
    my-sample-app
```

Test the application:
```bash
curl localhost:8080
```
