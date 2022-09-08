`Sail Sharp, .NET Core & Kubernetes` is an opiniated implementation to illustrate best practices to build and deploy .NET Core apps on Kubernetes. See the entire story [there]().

## 1. App

### 1.1. Health check

```

```

### 1.2. Dependencies version

```
1.0.0 not 1
```

### 1.3. Dependencies update

```
Dependabot, Renovate, etc.
```

## 2. `Dockerfile`

### 2.1. multi-stage build

```
FROM mcr.microsoft.com/dotnet/sdk:7 as builder
...
FROM mcr.microsoft.com/dotnet/runtime-deps:7-alpine3.16-amd64 as final
...
COPY --from=builder...
...
```
- `mcr.microsoft.com/dotnet/sdk:7` --> FIXME MB
- `mcr.microsoft.com/dotnet/runtime-deps:7.0.0-alpine3.16-amd64` --> 10.1MB

### 2.2 small final base image: `alpine`

```
...
FROM mcr.microsoft.com/dotnet/runtime-deps:7.0.0-alpine3.16-amd64
...
```
- Note: `mcr.microsoft.com/dotnet/runtime-deps:7.0.0-cbl-mariner2.0-distroless-amd64` --> 25MB

### 2.3. optimized `dotnet publish`

```
dotnet publish \
    -p:PublishSingleFile=true \
    -r linux-musl-x64 \
    --self-contained true \
    -p:PublishTrimmed=True \
    -p:TrimMode=Link \
    -c release
```

### 2.4. embedded `grpc_health_probe` component

```

```

### 2.5. Non-root settings

```
EXPOSE 7070
ENV DOTNET_EnableDiagnostics=0 \
    ASPNETCORE_URLS=http://*:7070
USER 1000
```

### 2.6. `.dockerignore` file

```
**/bin/
**/obj/
**/out/
Dockerfile*
**/*.md
```

## 3. Continuous Integration (CI)

### 3.1. FIXME

## 4. Kubernetes

### 4.1. FIXME
