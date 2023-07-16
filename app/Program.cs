using Microsoft.AspNetCore.Builder;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

var message = builder.Configuration["MESSAGE"];

app.MapGet("/", () => message ?? "Hello, World!");
app.Run();
