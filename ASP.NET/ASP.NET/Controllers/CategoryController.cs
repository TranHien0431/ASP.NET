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
        WebsiteASP_NETEntities1 objWebsiteASP_NETEntities1 = new WebsiteASP_NETEntities1();
        public ActionResult Index()
        {
           
            return View();
        }
        public ActionResult AllCategory()

        {  var lstCategory = objWebsiteASP_NETEntities1.Categories.ToList();
        
            return View(lstCategory);
        }
        public ActionResult ProductCategory(int Id)

        {
            var listProduct = objWebsiteASP_NETEntities1.Products.Where(n => n.CategoryId == Id).ToList();
            return View(listProduct);
        }
    }
}