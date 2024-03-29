# https://mcr.microsoft.com/product/dotnet/sdk
# https://mcr.microsoft.com/v2/dotnet/sdk/tags/list
FROM mcr.microsoft.com/dotnet/sdk:8.0.203-alpine3.18-amd64@sha256:88b2081be6c081e4f4a5cbf4d3317794ac01be3f15bc9afac4fe88c41d85521d as builder
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
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0.3-alpine3.18-amd64@sha256:4714a359cd43936ac1b8eb0a55e032c9929aba255e0f5f70c3365bec023c4b0b
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_HTTP_PORTS=8080
USER 65532
ENTRYPOINT ["/app/my-sample-app"]
