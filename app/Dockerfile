# https://mcr.microsoft.com/product/dotnet/sdk
FROM mcr.microsoft.com/dotnet/sdk:8.0.100-rc.1-alpine3.18-amd64@sha256:a3ad792bb80cd122df21bb8a18c5422aa355740937f393f9621c3c6050f4c1e8 as builder
RUN apk add clang build-base zlib-dev
WORKDIR /app
COPY my-sample-app.csproj .
RUN dotnet restore my-sample-app.csproj \
    -r linux-musl-x64
COPY . .
RUN dotnet publish my-sample-app.csproj \
    -r linux-musl-x64 \
    -c release \
    -o /my-sample-app \
    --no-restore \
    --self-contained true \
    -p:PublishTrimmed=true \
    -p:TrimMode=full

# https://mcr.microsoft.com/product/dotnet/runtime-deps
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0.0-rc.1-alpine3.18-amd64@sha256:1f58b2f92e2720df01ade6fd1c9e6cc69b79beddbebced5eb128eb3d5e83d8ef
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_HTTP_PORTS=8080
ENV DOTNET_EnableDiagnostics=0
USER 1000
ENTRYPOINT ["/app/my-sample-app"]
