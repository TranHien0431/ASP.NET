using System.Web.Mvc;

namespace ASP.NET.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                  namespaces: new[] { "ASP.NET.Areas.Admin.Controllers" }
            );
            // Thêm bộ lọc cho tất cả các controller trong khu vực Admin
            //GlobalFilters.Filters.Add(new AdminAuthorizeAttribute());
        }

    }
}