using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyendeASPT.NET.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Allcategory()
        {
            return View();
        }
        public ActionResult Productcategory()
        {
            return View();
        }
    }
}