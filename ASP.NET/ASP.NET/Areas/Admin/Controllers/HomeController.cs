using ASP.NET.Areas.Admin.Filter;
using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {

        WebsiteASP_NETEntities2 objWebsiteASP_NETEntities = new WebsiteASP_NETEntities2();
        [AdminAuthorize] // Gắn bộ lọc vào toàn bộ controller
                         // GET: Admin/Home
        public ActionResult Index()
        {
            // Kiểm tra nếu người dùng không phải là admin, chuyển hướng về trang chủ
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                return RedirectToAction("Index", "HomeAdmin");
            }

            // Thống kê tổng số sản phẩm, đơn hàng, khách hàng
            var totalProducts = objWebsiteASP_NETEntities.Products.Count();
            var totalOrders = objWebsiteASP_NETEntities.Orders.Count();
            var totalCustomers = objWebsiteASP_NETEntities.Users.Count();

            // Tính tổng doanh thu (cần kiểm tra nếu Product.PriceDiscount không phải null và Quantity là số hợp lệ)
            var totalRevenue = objWebsiteASP_NETEntities.OrderDetails
 .Where(od => od.Product != null && od.Product.PriceDiscount.HasValue)
 .Sum(od => od.Quantity * od.Product.PriceDiscount.Value);


            // Truyền dữ liệu qua ViewBag hoặc ViewData để sử dụng trong View
            ViewBag.TotalProducts = totalProducts;
            ViewBag.TotalOrders = totalOrders;
            ViewBag.TotalCustomers = totalCustomers;
            ViewBag.TotalRevenue = totalRevenue;

            // Cập nhật tab đang hoạt động cho sidebar (nếu cần)
            ViewData["Active"] = "HomeAdmin";

            // Trả về View cho trang quản trị viên
            return View();
        }

    }
}