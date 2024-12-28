using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        WebsiteASP_NETEntities2 objWebsiteASP_NETEntities2 = new WebsiteASP_NETEntities2();
        public ActionResult Index()
        {
           
            return View();
        }
        public ActionResult AllCategory()

        {  var lstCategory = objWebsiteASP_NETEntities2.Categories.ToList();
        
            return View(lstCategory);
        }
        public ActionResult ProductCategory(int Id)

        {
            var listProduct = objWebsiteASP_NETEntities2.Products.Where(n => n.CategoryId == Id).ToList();
            return View(listProduct);
        }
    }
}