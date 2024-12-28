using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        // GET: Admin/Product
        WebsiteASP_NETEntities2 objWebsiteASP_NETEntities1 = new WebsiteASP_NETEntities2();
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
        [HttpGet]
        public ActionResult Create()
        {
            // Lấy danh sách danh mục từ cơ sở dữ liệu
            var categories = objWebsiteASP_NETEntities1.Categories.ToList();

            // Tạo SelectList và gán vào ViewBag
            ViewBag.CategoryId = new SelectList(categories, "Id", "Name");

            // Lấy danh sách thương hiệu từ cơ sở dữ liệu
            var brands = objWebsiteASP_NETEntities1.Brands.ToList();

            // Gán SelectList vào ViewBag
            ViewBag.BrandId = new SelectList(brands, "Id", "Name");

            return View();
        }
        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            try
            {
                if (objProduct.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + extension + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss"));
                    objProduct.Avatar = fileName;
                    objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
                }
                objWebsiteASP_NETEntities1.Products.Add(objProduct);
                objWebsiteASP_NETEntities1.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)

            {
                return RedirectToAction("Index");
            }

        }
        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objProduct = objWebsiteASP_NETEntities1.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objProduct = objWebsiteASP_NETEntities1.Products.Where(n => n.Id == objPro.Id).FirstOrDefault();

            objWebsiteASP_NETEntities1.Products.Remove(objProduct);
            objWebsiteASP_NETEntities1.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int Id)
        {
            // Lấy danh sách danh mục từ cơ sở dữ liệu
            var categories = objWebsiteASP_NETEntities1.Categories.ToList();

            // Tạo SelectList và gán vào ViewBag
            ViewBag.CategoryId = new SelectList(categories, "Id", "Name");

            // Lấy danh sách thương hiệu từ cơ sở dữ liệu
            var brands = objWebsiteASP_NETEntities1.Brands.ToList();

            // Gán SelectList vào ViewBag
            ViewBag.BrandId = new SelectList(brands, "Id", "Name");

            
            var objProduct = objWebsiteASP_NETEntities1.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Edit(int id, Product objProduct)
        {
           if(objProduct.ImageUpload != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                fileName = fileName + extension + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss"));
                objProduct.Avatar = fileName;
                objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
            }
            objWebsiteASP_NETEntities1.Entry(objProduct).State = EntityState.Modified;
            objWebsiteASP_NETEntities1.SaveChanges();
            return View(objProduct);


        }
    }
}