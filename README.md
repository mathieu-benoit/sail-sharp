# dotnet-on-kubernetes

Repo for my presentation "Sail Sharp": ASP.NET Core, containers and Kubernetes. In this repository I cover a variety of topics and things I've learned in deploying ASP.NET Core applications to Kubernetes. You could find 2 kind of best practices:
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
docker run -p 8080:8080 web
```

## Scenario

- Web
  - .NET 5
- API
  - .NET 5
  - gRPC
- Database
  - Entity Framework
  - Migration: https://andrewlock.net/deploying-asp-net-core-applications-to-kubernetes-part-8-running-database-migrations-using-jobs-and-init-containers/
  - SQL container
  - Cloud SQL with sql-proxy
- Docker
  - Dockerfile
  - Size, unit tests, unpriviledged
  - Dockercompose - https://www.stevejgordon.co.uk/docker-for-dotnet-developers-part-4
- Kubernetes
  - pod security context, healthchecks
  - startup, liveness, ready probes
  - network policies
  - Linux versus Windows?
  - KCC
- CI
  - Azure DevOps
  - Helm - https://andrewlock.net/deploying-asp-net-core-applications-to-kubernetes-part-4-creating-a-helm-chart-for-an-aspnetcore-app/
  - Dependabot
- CD
  - GitOps or Azure DevOps
  - Integration tests: https://docs.microsoft.com/en-us/aspnet/core/test/integration-tests?view=aspnetcore-5.0
- Istio:
  - gRPC: https://www.istiobyexample.dev/grpc
  - Retry: https://www.istiobyexample.dev/retry
  - Fault Injection: https://www.istiobyexample.dev/fault-injection
  - Databases: https://www.istiobyexample.dev/databases
  
Ideas for demo source code:
- https://github.com/andrewlock/asp-dot-net-core-in-action-2e
- https://github.com/dotnet/AspNetCore.Docs/tree/master/aspnetcore/data/ef-mvc/intro/samples
- https://github.com/karoldeland/DotnetMSAPatterns
- https://github.com/grpc/grpc-dotnet/blob/master/examples/
- https://github.com/dotnet/tye/tree/master/samples
- https://github.com/GoogleCloudPlatform/cloud-code-samples/tree/master/dotnet/dotnet-guestbook
  
Resources:
- [Series: Deploying ASP.NET Core applications to Kubernetes](https://andrewlock.net/series/deploying-asp-net-core-applications-to-kubernetes/)
- [container security context on kubernetes](https://alwaysupalwayson.com/pod-security-context/)
- [kubernetes network policies](https://alwaysupalwayson.com/posts/2019/09/calico/)
- [Intro to Microservice Patterns for .NET Developers](https://www.youtube.com/watch?v=zW4INO353Xg)
- [Build High-performance Microservices with gRPC and .NET](https://www.youtube.com/watch?v=EJ8M2Em5Zzc) + [gRPC Web with .NET](https://channel9.msdn.com/Shows/On-NET/gRPC-Web-with-NET)
- [Deploy ASP.NET Core app to Google Kubernetes Engine with Istio (Part 1)](https://codelabs.developers.google.com/codelabs/cloud-istio-aspnetcore-part1#0)
- [Deploy ASP.NET Core app to Google Kubernetes Engine with Istio (Part 2)](https://codelabs.developers.google.com/codelabs/cloud-istio-aspnetcore-part2#0)
