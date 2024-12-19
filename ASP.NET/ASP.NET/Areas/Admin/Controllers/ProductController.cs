using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        // GET: Admin/Product
        WebsiteASP_NETEntities1 objWebsiteASP_NETEntities1 = new WebsiteASP_NETEntities1();
        public ActionResult Index()
        {
            var lstProduct=objWebsiteASP_NETEntities1.Products.ToList();
            return View(lstProduct);
        }
        public ActionResult Details(int Id)
        {
            var objProduct = objWebsiteASP_NETEntities1.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);

        }
        public ActionResult Create()
        {
            return View();

        }
    }
}