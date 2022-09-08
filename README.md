`Sail Sharp, .NET Core & Kubernetes` is an opiniated implementation to illustrate best practices to build and deploy .NET Core apps on Kubernetes. See the entire story [there]().

1. `Dockerfile` - multi-stage build

```
FROM mcr.microsoft.com/dotnet/sdk:7 as builder
...
FROM mcr.microsoft.com/dotnet/runtime-deps:7 as final
...
```

2. `Dockerfile` - small final base image

```
...
FROM mcr.microsoft.com/dotnet/runtime-deps:7.0.0-alpine3.16-amd64
...
```
