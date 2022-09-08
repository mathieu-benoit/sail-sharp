`Sail Sharp, .NET Core & Kubernetes` is an opiniated implementation to illustrate best practices to build and deploy .NET Core apps on Kubernetes. See the entire story [there]().

## `Dockerfile`

1. multi-stage build

```
FROM mcr.microsoft.com/dotnet/sdk:7 as builder
...
FROM mcr.microsoft.com/dotnet/runtime-deps:7 as final
...
```

2. small final base image: `alpine`

```
...
FROM mcr.microsoft.com/dotnet/runtime-deps:7.0.0-alpine3.16-amd64
...
```

3. optimized `dotnet publish`: `Trimmed`, `SingleFile`, `SelfContained`

```
dotnet publish -p:PublishSingleFile=true -r linux-musl-x64 --self-contained true -p:PublishTrimmed=True -p:TrimMode=Link -c release
```

4. For grpc, embedded `grpc_health_probe` component

```

```

5. Non-root settings

```
EXPOSE 7070
ENV DOTNET_EnableDiagnostics=0 \
    ASPNETCORE_URLS=http://*:7070
USER 1000
```
