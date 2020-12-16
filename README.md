![web-ci](https://github.com/mathieu-benoit/dotnet-on-kubernetes/workflows/web-ci/badge.svg?branch=main) ![api-ci](https://github.com/mathieu-benoit/dotnet-on-kubernetes/workflows/api-ci/badge.svg?branch=main)

Repo for my presentation "Sail Sharp": An illustrated demonstration with ASP.NET Core, containers and Kubernetes. In this repository I cover a variety of topics and things I've learned in deploying ASP.NET Core applications to Kubernetes. You could find 2 kind of best practices:
- Specific to ASP.NET Core: .NET 5, Entity Framework, gRPC, SQL database, unit testing, optimized and unprivileged container, etc.
- Generic for any workload running on Kubernetes: Continuous Integration (CI) with GitHub Actions, Continuous Deliver (CD) with GitOps (Flux), etc.

FIXME - architecture diagram

FIXME - workflow diagram

## Setup

- GKE
- Linux versus Windows?

## Build locally

```
docker-compose up -d
```

```
cd web/src
docker build -t web .
docker run -d -p 8080:8080 web
docker run -p 8080:8080 \
  --network host \
  --read-only \
  --cap-drop=ALL \
  --user=1000 \
  -e API_URL="http://localhost:5001" \
  web

cd api/src
docker build -t api .
docker run -d -p 5001:5001 api
docker run -d -p 5001:5001 \
  --read-only \
  --cap-drop=ALL \
  --user=1000 \
  api
```

## Scenario

- Web
  - .NET 5
- API
  - .NET 5
  - gRPC
- Database
  - Entity Framework
  - SQL container
  - Cloud SQL with sql-proxy
- Docker
  - Dockerfile
  - Size, unit tests, unpriviledged
  - Dockercompose
- Kubernetes
  - pod security context, healthchecks
  - startup, liveness, ready probes
  - network policies
  - Linux versus Windows?
  - KCC
- CI
  - Azure DevOps
  - Helm
  - Dependabot
- CD
  - GitOps or Azure DevOps
  - Integration tests: https://docs.microsoft.com/en-us/aspnet/core/test/integration-tests?view=aspnetcore-5.0
- Istio

Resources:
- .NET
  - [Series: Deploying ASP.NET Core applications to Kubernetes](https://andrewlock.net/series/deploying-asp-net-core-applications-to-kubernetes/)
  - [Single-File Executables in .NET](https://levelup.gitconnected.com/single-file-executables-in-net-core-3-1-and-the-quest-for-a-sub-50mb-docker-container-f44cb1274121)
  - [App Trimming in .NET 5](https://devblogs.microsoft.com/dotnet/app-trimming-in-net-5/)
  - [Build High-performance Microservices with gRPC and .NET](https://www.youtube.com/watch?v=EJ8M2Em5Zzc) + [gRPC Web with .NET](https://channel9.msdn.com/Shows/On-NET/gRPC-Web-with-NET)
- Docker
  - [Runtime privilege and Linux capabilities](https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities)
- Kubernetes
  - [container security context on kubernetes](https://alwaysupalwayson.com/pod-security-context/)
  - [kubernetes network policies](https://alwaysupalwayson.com/posts/2019/09/calico/)
  - [Intro to Microservice Patterns for .NET Developers](https://www.youtube.com/watch?v=zW4INO353Xg)
- Istio
  - [Deploy ASP.NET Core app to Google Kubernetes Engine with Istio (Part 1)](https://codelabs.developers.google.com/codelabs/cloud-istio-aspnetcore-part1#0)
  - [Deploy ASP.NET Core app to Google Kubernetes Engine with Istio (Part 2)](https://codelabs.developers.google.com/codelabs/cloud-istio-aspnetcore-part2#0)