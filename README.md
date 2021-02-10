`Sail Sharp, .NET Core & Kubernetes` is an opiniated implementation to illustrate best practices to build and deploy .NET Core apps on Kubernetes.

It consists on 2 aspects:
- [.NET Core app](https://github.com/mathieu-benoit/cartservice) repo to host the code of the app and the Continuous Integration (CI) part
- [Kubernetes manifests](https://github.com/mathieu-benoit/my-kubernetes-deployments/tree/main/namespaces/onlineboutique) repo to host the manifest files ready to be deployed in Kubernetes via a GitOps CD way

## Architecture

![architecture diagram](architecture.png)

## Workflow & personas

![workflow diagram & personas](personas.png)

## Resources

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
  - [Production checklist for web apps on Kubernetes](https://srcco.de/posts/web-service-on-kubernetes-production-checklist-2019.html)
  - [Health checking your gRPC servers on Kubernetes](https://cloud.google.com/blog/topics/developers-practitioners/health-checking-your-grpc-servers-gke)
- Istio
  - [Istio by example](https://www.istiobyexample.dev/)
  - [Deploy ASP.NET Core app to Google Kubernetes Engine with Istio (Part 1)](https://codelabs.developers.google.com/codelabs/cloud-istio-aspnetcore-part1#0)
  - [Deploy ASP.NET Core app to Google Kubernetes Engine with Istio (Part 2)](https://codelabs.developers.google.com/codelabs/cloud-istio-aspnetcore-part2#0)
- GitHub actions
  - [Automating CI/CD pipelines with GitHub Actions and Google Cloud](https://resources.github.com/webcasts/Automating-CI-CD-Actions-Google-Cloud-thankyou)
  - [How We Set Up a Production Ready CI Workflow Using GitHub Actions](https://hackernoon.com/how-we-set-up-a-production-ready-ci-workflow-using-github-actions-ca2n3w1j)
