using Microsoft.AspNetCore.Builder;

var builder = WebApplication.CreateSlimBuilder(args);
var app = builder.Build();

var message = builder.Configuration["MESSAGE"] ?? "Hello, World!";
var pod = builder.Configuration["POD_NAME"];
var namespace = builder.Configuration["NAMESPACE_NAME"];

app.MapGet("/", () => string.IsNullOrEmpty(pod) || string.IsNullOrEmpty(namespace) ? message : $"{message} - from {pod} / {namespace}.");
app.Run();
