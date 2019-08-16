using System;
using CSBEF.Core.Concretes;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Serilog;

namespace CSBEF.SimpleAPI
{
    public class Startup
    {
        public IConfiguration Configuration { get; }
        private readonly IHostingEnvironment _hostingEnvironment;

        public Startup(IHostingEnvironment env, IConfiguration configuration)
        {
            _hostingEnvironment = env;
            Log.Logger = new LoggerConfiguration().ReadFrom.Configuration(configuration).CreateLogger();
            Configuration = configuration;

            GlobalConfiguration.DbProvider = Configuration["AppSettings:DBSettings:Provider"];
            GlobalConfiguration.DbConnectionString = Configuration["AppSettings:DBSettings:ConnectionString"];
            GlobalConfiguration.sAppPath = env.ContentRootPath;
            GlobalConfiguration.sWwwRootPath = env.WebRootPath;
        }

        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            var serviceInit = new APIStartServiceCollection().Init(Configuration, _hostingEnvironment, services);
            return serviceInit;
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }
            app.UseCors(builder => builder.AllowAnyHeader().AllowCredentials().AllowAnyMethod().WithOrigins(Configuration["CustomCorsOrigin"] != null ? Configuration["CustomCorsOrigin"] : "http://localhost:8080"));
            app.UseAuthentication();
            loggerFactory.AddSerilog();
            app.UseSignalR(r => r.MapSignalrRoutes());
            app.UseMvc();
            app.UseStaticFiles();
        }
    }
}
