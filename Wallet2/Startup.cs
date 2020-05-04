using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Wallet2.Startup))]
namespace Wallet2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
