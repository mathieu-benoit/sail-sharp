using Microsoft.AspNetCore.Builder;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

var message = builder.Configuration.GetString("MESSAGE");

app.MapGet("/", () => message ?? "Hello, World!");
app.Run();
