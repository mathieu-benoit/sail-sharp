FROM mcr.microsoft.com/dotnet/sdk:7.0.305-alpine3.18@sha256:414bb303d88c0b8f9d7dd27177b94250784d3d83008ce684773ee5e0dcb7114f as builder
WORKDIR /app
COPY my-sample-app.csproj .
RUN dotnet restore my-sample-app.csproj \
    --use-current-runtime
COPY . .
RUN dotnet publish my-sample-app.csproj \
    --use-current-runtime \
    -c release \
    -o /my-sample-app \
    --no-restore \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=true \
    -p:TrimMode=full

FROM mcr.microsoft.com/dotnet/runtime-deps:7.0.7-alpine3.18@sha256:fb139645871d653c5cc427961fc1fcec5a84e7a39775fc1346a3de7640d04af5
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://*:8080
ENV DOTNET_EnableDiagnostics=0
USER 1000
ENTRYPOINT ["/app/my-sample-app"]
