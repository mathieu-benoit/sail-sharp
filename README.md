Repo for my presentation "Sail Sharp": An illustrated demonstration with ASP.NET Core, containers and Kubernetes. In this repository I cover a variety of topics and things I've learned in deploying ASP.NET Core applications to Kubernetes. You could find 2 kind of best practices:
- Specific to ASP.NET Core: .NET 5, Entity Framework, gRPC, SQL database, unit testing, optimized and unprivileged container, etc.
- Generic for any workload running on Kubernetes: Continuous Integration (CI) with GitHub Actions, Continuous Deliver (CD) with GitOps (Flux), etc.

- [web-app](https://github.com/mathieu-benoit/dotnet-web-app)
- [grpc-api](https://github.com/mathieu-benoit/dotnet-grpc-api)

FIXME - architecture diagram

FIXME - workflow diagram

Resources
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
  - [Production checklist for web apps on Kuberntes](https://srcco.de/posts/web-service-on-kubernetes-production-checklist-2019.html)
- Istio
  - [Deploy ASP.NET Core app to Google Kubernetes Engine with Istio (Part 1)](https://codelabs.developers.google.com/codelabs/cloud-istio-aspnetcore-part1#0)
  - [Deploy ASP.NET Core app to Google Kubernetes Engine with Istio (Part 2)](https://codelabs.developers.google.com/codelabs/cloud-istio-aspnetcore-part2#0)
- GitHub actions
  - [Automating CI/CD pipelines with GitHub Actions and Google Cloud](https://resources.github.com/webcasts/Automating-CI-CD-Actions-Google-Cloud-thankyou)
  - [How We Set Up a Production Ready CI Workflow Using GitHub Actions](https://hackernoon.com/how-we-set-up-a-production-ready-ci-workflow-using-github-actions-ca2n3w1j)