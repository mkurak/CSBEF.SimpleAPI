using System.IO;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace CSBEF.SimpleAPI {
    public class Program {
        public static void Main (string[] args) {
            CreateWebHostBuilder (args).Build ().Run ();
        }

        public static IWebHostBuilder CreateWebHostBuilder (string[] args) =>
            WebHost.CreateDefaultBuilder (args)
            .UseContentRoot (Directory.GetCurrentDirectory ())
            .ConfigureAppConfiguration ((hostingContext, config) => {
                var env = hostingContext.HostingEnvironment;
                config.AddJsonFile ("appsettings.json", optional : true, reloadOnChange : true)
                    .AddJsonFile ($"appsettings.{env.EnvironmentName}.json",
                        optional : true, reloadOnChange : true);
                config.AddEnvironmentVariables ();
            })
            .UseStartup<Startup> ();
    }
}