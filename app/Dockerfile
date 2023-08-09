FROM mcr.microsoft.com/dotnet/sdk:7.0.306-alpine3.18@sha256:b4b1f1b7d85a7b9939004e6632009d8c3857d3a931378eebced7e2018780b84e as builder
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

FROM mcr.microsoft.com/dotnet/runtime-deps:7.0.10-alpine3.18@sha256:e86ce2bf9b77a93075dbe03bc5a3ba4eeae93bdfc5415a9354c22ed3504d46a8
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://*:8080
ENV DOTNET_EnableDiagnostics=0
USER 1000
ENTRYPOINT ["/app/my-sample-app"]
