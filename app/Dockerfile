# https://mcr.microsoft.com/product/dotnet/sdk
# https://mcr.microsoft.com/v2/dotnet/sdk/tags/list
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:10.0.101-noble AS builder
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
    --no-restore

# https://mcr.microsoft.com/product/dotnet/runtime-deps
# https://mcr.microsoft.com/v2/dotnet/runtime-deps/tags/list
FROM mcr.microsoft.com/dotnet/runtime-deps:10.0.1-noble-chiseled-extra
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_HTTP_PORTS=8080
USER 65532
ENTRYPOINT ["./my-sample-app"]
