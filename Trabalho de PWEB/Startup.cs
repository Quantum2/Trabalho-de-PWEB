using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Trabalho_de_PWEB.Startup))]
namespace Trabalho_de_PWEB
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
