using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;

var builder = WebApplication.CreateSlimBuilder(args);
builder.Configuration.AddJsonFile("appsettings.json", true, true);
builder.Configuration.AddEnvironmentVariables();
var app = builder.Build();

var message = builder.Configuration["MESSAGE"] ?? "Hello, World! (from code)";
var podName = builder.Configuration["POD_NAME"];
var namespaceName = builder.Configuration["NAMESPACE_NAME"];

app.MapGet("/", () => string.IsNullOrEmpty(podName) || string.IsNullOrEmpty(namespaceName) ? message : $"{message} - from {podName} / {namespaceName}.");
app.Run();
