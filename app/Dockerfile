# https://mcr.microsoft.com/product/dotnet/sdk
# https://mcr.microsoft.com/v2/dotnet/sdk/tags/list
FROM mcr.microsoft.com/dotnet/nightly/sdk:8.0.303-noble-aot as builder
WORKDIR /app
COPY my-sample-app.csproj .
RUN dotnet restore my-sample-app.csproj \
    -r linux-x64
COPY . .
RUN dotnet publish my-sample-app.csproj \
    -r linux-x64 \
    -c release \
    -o /my-sample-app \
    --no-restore \
    --self-contained true \
    -p:PublishTrimmed=true \
    -p:TrimMode=full

# https://mcr.microsoft.com/product/dotnet/runtime-deps
# https://mcr.microsoft.com/v2/dotnet/runtime-deps/tags/list
FROM mcr.microsoft.com/dotnet/nightly/runtime-deps:8.0.6-noble-chiseled-aot
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_HTTP_PORTS=8080
USER 65532
ENTRYPOINT ["/app/my-sample-app"]
