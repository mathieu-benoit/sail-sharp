using Microsoft.AspNetCore.Builder;

var builder = WebApplication.CreateSlimBuilder(args);
var app = builder.Build();

var message = builder.Configuration["MESSAGE"] ?? "Hello, World!";
var podName = builder.Configuration["POD_NAME"];
var namespaceName = builder.Configuration["NAMESPACE_NAME"];

app.MapGet("/", () => string.IsNullOrEmpty(podName) || string.IsNullOrEmpty(namespaceName) ? message : $"{message} - from {podName} / {namespaceName}.");
app.Run();
