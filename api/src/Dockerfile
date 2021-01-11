# https://hub.docker.com/_/microsoft-dotnet-sdk/
FROM mcr.microsoft.com/dotnet/sdk:5.0.101 AS build
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore -r linux-musl-x64

COPY . ./

# Fix the issue on Debian 10: https://github.com/dotnet/dotnet-docker/issues/2470
ENV COMPlus_EnableDiagnostics=0

RUN dotnet publish -p:PublishSingleFile=true -r linux-musl-x64 --self-contained true -p:PublishTrimmed=True -p:TrimMode=Link -c release -o out --no-restore

# https://hub.docker.com/_/microsoft-dotnet-core-aspnet/
FROM mcr.microsoft.com/dotnet/runtime-deps:5.0.1-alpine3.12-amd64

RUN GRPC_HEALTH_PROBE_VERSION=v0.3.6 && \
    wget -qO/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
    chmod +x /bin/grpc_health_probe

WORKDIR /app
COPY --from=build /app/out ./

ENV ASPNETCORE_URLS http://*:5001
EXPOSE 5001

# OPT OUT OF Diagnostic pipeline so we can run readonly.
ENV COMPlus_EnableDiagnostics=0

USER 1000

ENTRYPOINT ["/app/api"]