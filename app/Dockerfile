FROM mcr.microsoft.com/dotnet/sdk:7.0.401-alpine3.18@sha256:ba04d2d249d045c4324f8f238f0b82a08528a61db969ba9b0c549b8bc1dc9127 as builder
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
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=true \
    -p:TrimMode=full

FROM mcr.microsoft.com/dotnet/runtime-deps:7.0.11-alpine3.18@sha256:276b70790c33051bcf79ada1fc2dd91428330c9e02a7d0aaf27d070f096793cf
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://*:8080
ENV DOTNET_EnableDiagnostics=0
USER 1000
ENTRYPOINT ["/app/my-sample-app"]
