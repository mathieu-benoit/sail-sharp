**Associate blog post: [Sail Sharp, 8 tips to optimize and secure your .NET containers for Kubernetes](https://medium.com/p/c68ba253844a).**

## Deploy the application

Run the pre-built container:
```bash
docker run \
    -d \
    -p 8080:8080 \
    --read-only \
    --cap-drop=ALL \
    --user=1000 \
    ghcr.io/mathieu-benoit/my-sample-app:latest
```

Deploy the application on Kubernetes:
```bash
kubectl apply \
    -f deployment.yaml
```

Expose publicly the application on Kubernetes:
```bash
kubectl apply \
    -f service.yaml
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
    --user=1000 \
    my-sample-app
```

Test the application:
```bash
curl localhost:8080
```