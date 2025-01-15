using ASP.NET.Areas.Admin.Filter;
using ASP.NET.Context;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Areas.Admin.Controllers
{
    [AdminAuthorize] // Gắn bộ lọc vào toàn bộ controller
    public class OrderController : Controller
    {
        // GET: Admin/Order
        WebsiteASP_NETEntities2 objWebsiteASP_NETEntities = new WebsiteASP_NETEntities2();

        // GET: Admin/Product
        public ActionResult Index(string searchTerm, int? page)
        {
            // Get all products as IQueryable
            var lstOrder = objWebsiteASP_NETEntities.Orders.AsQueryable();

            // Search functionality
            if (!string.IsNullOrEmpty(searchTerm))
            {
                lstOrder = lstOrder.Where(p => p.Name.Contains(searchTerm));
            }

            ViewBag.CurrentFilter = searchTerm;

            // Pagination settings
            int pageSize = 10;
            int pageNumber = page ?? 1;

            // Ensure you call ToPagedList() on the IQueryable to get IPagedList
            var pagedList = lstOrder.OrderBy(p => p.Name).ToPagedList(pageNumber, pageSize);

            return View(pagedList);  // Return IPagedList<Product> to the view
        }
        public ActionResult Details(int Id)
        {
            var objOrder = objWebsiteASP_NETEntities.Orders.Where(n => n.Id == Id).FirstOrDefault();
            return View(objOrder);
        }

        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objOrder = objWebsiteASP_NETEntities.Orders.Where(n => n.Id == Id).FirstOrDefault();
            return View(objOrder);
        }

        [HttpPost]
        public ActionResult Delete(Order objOrde)
        {
            var objOrder = objWebsiteASP_NETEntities.Orders.Where(n => n.Id == objOrde.Id).FirstOrDefault();

            objWebsiteASP_NETEntities.Orders.Remove(objOrder);
            objWebsiteASP_NETEntities.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Order objOrder)
        {
            try
            {
                // Thêm người dùng vào cơ sở dữ liệu
                objWebsiteASP_NETEntities.Orders.Add(objOrder);
                objWebsiteASP_NETEntities.SaveChanges();

                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }
        }

        // GET: Admin/Product
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var order = objWebsiteASP_NETEntities.Orders.Find(id);
            if (order == null) return HttpNotFound();

            return View(order);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Order objOrder)
        {
            try
            {
                var existingOrder = objWebsiteASP_NETEntities.Orders.Find(objOrder.Id);
                if (existingOrder == null)
                {
                    return HttpNotFound();
                }

                // Cập nhật các trường khác
                existingOrder.Name = objOrder.Name;
                existingOrder.UserId = objOrder.UserId;
                existingOrder.Status = objOrder.Status;
                existingOrder.CreatedOnUtc = objOrder.CreatedOnUtc;

                // Đánh dấu thực thể là đã chỉnh sửa
                objWebsiteASP_NETEntities.Entry(existingOrder).State = EntityState.Modified;

                // Lưu thay đổi vào cơ sở dữ liệu
                objWebsiteASP_NETEntities.SaveChanges();

                TempData["SuccessMessage"] = "Cập nhật sản phẩm thành công!";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // Log lỗi nếu cần thiết (sử dụng thư viện log như NLog hoặc Serilog)
                TempData["ErrorMessage"] = "Đã xảy ra lỗi trong quá trình cập nhật sản phẩm. Vui lòng thử lại.";
                return RedirectToAction("Edit", new { id = objOrder.Id });
            }
        }

    }
}