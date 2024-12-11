using ASP.NET.Context;
using ASP.NET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{

    public class HomeController : Controller
    {
        ASPNETEntities objASPNETEntities = new ASPNETEntities();
        public ActionResult Index()
        { 
           HomeModel objHomeModel=new HomeModel();

            objHomeModel.ListCategory = objASPNETEntities.Categories.ToList();

            objHomeModel.ListProducts = objASPNETEntities.Products.ToList();
            return View(objHomeModel);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}