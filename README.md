# dotnet-on-kubernetes

FIXME - architecture diagram

FIXME - workflow diagram

## Setup

- GKE

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
  - network policies
  - KCC
- CI
  - Azure DevOps
  - Helm
  - Dependabot
- CD
  - GitOps or Azure DevOps
- Istio:
  - gRPC: https://www.istiobyexample.dev/grpc
  - Retry: https://www.istiobyexample.dev/retry
  - Fault Injection: https://www.istiobyexample.dev/fault-injection
  - Databases: https://www.istiobyexample.dev/databases
  
 Ideas for demo source code:
 - https://github.com/dotnet/AspNetCore.Docs/tree/master/aspnetcore/data/ef-mvc/intro/samples
 - https://github.com/karoldeland/DotnetMSAPatterns
 - https://github.com/grpc/grpc-dotnet/blob/master/examples/
 - https://github.com/dotnet/tye/tree/master/samples
 - https://github.com/GoogleCloudPlatform/cloud-code-samples/tree/master/dotnet/dotnet-guestbook
  
 Resources:
 - [container security context on kubernetes](https://alwaysupalwayson.com/pod-security-context/)
 - [kubernetes network policies](https://alwaysupalwayson.com/posts/2019/09/calico/)
 - [Intro to Microservice Patterns for .NET Developers](https://www.youtube.com/watch?v=zW4INO353Xg)
 - [Build High-performance Microservices with gRPC and .NET](https://www.youtube.com/watch?v=EJ8M2Em5Zzc) + [gRPC Web with .NET](https://channel9.msdn.com/Shows/On-NET/gRPC-Web-with-NET)
 - [Deploy ASP.NET Core app to Google Kubernetes Engine with Istio (Part 1)](https://codelabs.developers.google.com/codelabs/cloud-istio-aspnetcore-part1#0)
 - [Deploy ASP.NET Core app to Google Kubernetes Engine with Istio (Part 2)](https://codelabs.developers.google.com/codelabs/cloud-istio-aspnetcore-part2#0)
