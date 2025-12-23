FROM --platform=$BUILDPLATFORM dhi.io/dotnet:10.0.101-sdk-alpine3.22 AS builder
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

FROM dhi.io/dotnet:10.0.1-alpine3.22
WORKDIR /app
COPY --from=builder /my-sample-app .
EXPOSE 8080
ENV ASPNETCORE_HTTP_PORTS=8080
ENTRYPOINT ["./my-sample-app"]
