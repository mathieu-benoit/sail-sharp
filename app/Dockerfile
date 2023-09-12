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

FROM mcr.microsoft.com/dotnet/runtime-deps:7.0.10-alpine3.18@sha256:e86ce2bf9b77a93075dbe03bc5a3ba4eeae93bdfc5415a9354c22ed3504d46a8
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://*:8080
ENV DOTNET_EnableDiagnostics=0
USER 1000
ENTRYPOINT ["/app/my-sample-app"]
