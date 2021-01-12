using System;
using System.Threading.Tasks;
using Grpc.Core;
using Grpc.Health.V1;
using static Grpc.Health.V1.Health;

namespace api.Services
{
    internal class HealthCheckService : HealthBase
    {
        public override Task<HealthCheckResponse> Check(HealthCheckRequest request, ServerCallContext context)
        {
            return Task.FromResult(new HealthCheckResponse { Status = HealthCheckResponse.Types.ServingStatus.Serving });
        }
    }
}