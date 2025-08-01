using System;
using System.Web.Mvc;
using System.Web.Routing;
using ECommerceProject.DataAccess.Concrete;

namespace ECommerceProject.Web
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            System.Data.Entity.Database.SetInitializer<DataContext>(null);

            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }
    }
}
