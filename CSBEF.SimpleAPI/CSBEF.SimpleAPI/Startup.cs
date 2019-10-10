using System;
using CSBEF.Core.Concretes;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Serilog;

namespace CSBEF.SimpleAPI
{
    public class Startup
    {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnvironment;

        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            _configuration = configuration;
            _hostingEnvironment = env;

            Log.Logger = new LoggerConfiguration().ReadFrom.Configuration(configuration).CreateLogger();

            GlobalConfiguration.DbProvider = _configuration["AppSettings:DBSettings:Provider"];
            GlobalConfiguration.DbConnectionString = _configuration["AppSettings:DBSettings:ConnectionString"];
            GlobalConfiguration.sAppPath = env.ContentRootPath;
            GlobalConfiguration.sWwwRootPath = env.WebRootPath;
        }

        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            var serviceInit = new APIStartServiceCollection().Init(_configuration, _hostingEnvironment, services);
            return serviceInit;
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseCors(builder => builder.AllowAnyHeader().AllowCredentials().AllowAnyMethod().WithOrigins(_configuration["CustomCorsOrigin"] != null ? _configuration["CustomCorsOrigin"] : "http://localhost:8080"));

            app.UseHttpsRedirection();
            app.UseRouting();
            app.UseAuthorization();
            loggerFactory.AddSerilog();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
                endpoints.MapHub<GlobalHub>("/api/signalr/GlobalHub");
            });
        }
    }
}
