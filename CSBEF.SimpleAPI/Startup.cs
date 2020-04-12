using System;
using CSBEF.Core.Concretes;
using CSBEF.Core.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json.Serialization;
using Serilog;

namespace CSBEF.SimpleAPI {
    public class Startup {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnvironment;

        public Startup (IConfiguration configuration, IWebHostEnvironment env) {
            _configuration = configuration;
            _hostingEnvironment = env;

            Log.Logger = new LoggerConfiguration ().ReadFrom.Configuration (configuration).CreateLogger ();

            GlobalConfiguration.DbProvider = _configuration["AppSettings:DBSettings:Provider"];
            GlobalConfiguration.DbConnectionString = _configuration["AppSettings:DBSettings:ConnectionString"];
            GlobalConfiguration.SAppPath = env.ContentRootPath;
            GlobalConfiguration.SWwwRootPath = env.WebRootPath;
        }

        public IServiceProvider ConfigureServices (IServiceCollection services) {
            var options = new ApiStartOptionsModel {
                JsonOptionsUsing = true,
                JsonOptionsPreserveReferencesHandling = Newtonsoft.Json.PreserveReferencesHandling.None,
                JsonOptionsContractResolver = new CamelCasePropertyNamesContractResolver ()
            };
            var stringComparison = new StringComparison ();
            var csbefInit = new APIStartServiceCollection ().Init (_configuration, _hostingEnvironment, services, options, stringComparison);
            return csbefInit;
        }

        public void Configure (IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory) {
            if (env.IsDevelopment ()) {
                app.UseDeveloperExceptionPage ();
            }

            loggerFactory.AddSerilog ();
            app.UseStaticFiles ();
            app.UseRouting ();
            app.UseCors (options => {
                options.AllowAnyHeader ();
                options.AllowAnyMethod ();
                options.AllowCredentials ();
                options.WithOrigins (_configuration["CustomCorsOrigin"]);
            });
            app.UseAuthentication ();
            app.UseAuthorization ();
            app.UseEndpoints (endpoints => {
                endpoints.MapControllers ();
                endpoints.MapHub<GlobalHub> ("/signalr/GlobalHub");
            });
        }
    }
}