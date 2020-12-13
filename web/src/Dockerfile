# https://hub.docker.com/_/microsoft-dotnet-sdk/
FROM mcr.microsoft.com/dotnet/sdk:5.0.101 AS build
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore -r linux-musl-x64

COPY . ./
WORKDIR /app

RUN dotnet publish -p:PublishSingleFile=true -r linux-musl-x64 --self-contained true -p:PublishTrimmed=True -p:TrimMode=Link -c release -o out --no-restore

# https://hub.docker.com/_/microsoft-dotnet-core-aspnet/
FROM mcr.microsoft.com/dotnet/runtime-deps:5.0.1-alpine3.12-amd64
WORKDIR /app
COPY --from=build /app/out ./

ENV ASPNETCORE_URLS http://*:8080
EXPOSE 8080

ENTRYPOINT ["/app/HelloWorldAspNetCore"]