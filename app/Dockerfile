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

FROM mcr.microsoft.com/dotnet/runtime-deps:7.0.9-alpine3.18@sha256:6e0490817a7a4512add425809272051a85f12d65ab1f07bac0aee65360f5ef6c
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://*:8080
ENV DOTNET_EnableDiagnostics=0
USER 1000
ENTRYPOINT ["/app/my-sample-app"]
