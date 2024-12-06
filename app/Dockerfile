# https://mcr.microsoft.com/product/dotnet/sdk
# https://mcr.microsoft.com/v2/dotnet/sdk/tags/list
# https://mcr.microsoft.com/product/dotnet/nightly/sdk
# https://mcr.microsoft.com/v2/dotnet/nightly/sdk/tags/list
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/nightly/sdk:9.0.100-noble-aot AS builder
ARG TARGETARCH
WORKDIR /app
COPY my-sample-app.csproj .
RUN dotnet restore my-sample-app.csproj \
    -a $TARGETARCH
COPY . .
RUN dotnet publish my-sample-app.csproj \
    -a $TARGETARCH \
    -c release \
    -o /my-sample-app \
    --self-contained true \
    -p:PublishTrimmed=true \
    -p:TrimMode=full

# https://mcr.microsoft.com/product/dotnet/runtime-deps
# https://mcr.microsoft.com/v2/dotnet/runtime-deps/tags/list
# https://mcr.microsoft.com/product/dotnet/nightly/runtime-deps
# https://mcr.microsoft.com/v2/dotnet/nightly/runtime-deps/tags/list
FROM mcr.microsoft.com/dotnet/nightly/runtime-deps:9.0.0-noble-chiseled-aot
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_HTTP_PORTS=8080
USER 65532
ENTRYPOINT ["/app/my-sample-app"]
