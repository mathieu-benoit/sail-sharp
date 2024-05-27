# https://mcr.microsoft.com/product/dotnet/sdk
# https://mcr.microsoft.com/v2/dotnet/sdk/tags/list
FROM mcr.microsoft.com/dotnet/sdk:8.0.300-alpine3.18-amd64@sha256:8fa0d7e0f79aa70d9cf49e11e30e909d39b34a173ffacea3fa73b5d2a25f025f as builder
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
# https://mcr.microsoft.com/v2/dotnet/runtime-deps/tags/list
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0.5-alpine3.18-amd64@sha256:70fe5d6b27bc6a722d24a38865c6763b5bf6a368a8c320114ac4924b8d442378
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_HTTP_PORTS=8080
USER 65532
ENTRYPOINT ["/app/my-sample-app"]
