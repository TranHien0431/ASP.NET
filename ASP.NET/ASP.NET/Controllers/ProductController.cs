using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        WebsiteASP_NETEntities2 objWebsiteASP_NETEntities2 = new WebsiteASP_NETEntities2();
        public ActionResult ProductDetail(int Id)
        {
            var objProduct= objWebsiteASP_NETEntities2.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
    }
}