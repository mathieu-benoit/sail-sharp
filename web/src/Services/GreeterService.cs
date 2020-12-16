using System;
using System.Threading.Tasks;
using greet;
using Grpc.Net.Client;
using Grpc.Core;
using Microsoft.Extensions.Configuration;

namespace web.Services
{
    public class GreeterService
    {
        public IConfiguration Configuration { get; }

        public GreeterService(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public async Task<string> GetGreeting(string greet = "GreeterClient")
        {
            var apiUrl = Configuration["API_URL"];
            if(string.IsNullOrEmpty(apiUrl))
                return "Greeter server not provided.";

            using var channel = GrpcChannel.ForAddress(apiUrl);
            var client =  new Greeter.GreeterClient(channel);
            var reply = await client.SayHelloAsync(
                              new HelloRequest { Name = greet });
            return reply.Message;
        }
    }
}