using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;

var builder = WebApplication.CreateSlimBuilder(args);
builder.Configuration.AddJsonFile("appsettings.json", true, true);
builder.Configuration.AddEnvironmentVariables();
var app = builder.Build();

var message = builder.Configuration["MESSAGE"] ?? "Hello, World! (from code)";
var podName = builder.Configuration["POD_NAME"];
var namespaceName = builder.Configuration["NAMESPACE_NAME"];
message = string.IsNullOrEmpty(podName) || string.IsNullOrEmpty(namespaceName) ? message : $"{message} - from {podName} / {namespaceName}";
var platform = System.Environment.OSVersion.Platform;

app.MapGet("/", () => $"{message} on {platform}.");
app.Run();
