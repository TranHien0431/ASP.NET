using ASP.NET.Context;
using ASP.NET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class PaymentController : Controller
    {
        // GET: Payment
        WebsiteASP_NETEntities2 objWebsiteASP_NETEntities2 = new WebsiteASP_NETEntities2();

        public ActionResult Index()
        {
            // Kiểm tra người dùng đã đăng nhập hay chưa
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                // Lấy thông tin từ giỏ hàng trong session
                var lstCart = (List<CartModel>)Session["cart"];
                if (lstCart == null || !lstCart.Any())
                {
                    TempData["Error"] = "Giỏ hàng trống. Vui lòng chọn sản phẩm trước khi thanh toán.";
                    return RedirectToAction("Index", "Cart");
                }

                // Tạo dữ liệu cho Order
                Order objOrder = new Order
                {
                    Name = "DonHang-" + DateTime.Now.ToString("yyyyMMddHHmmss"),
                    UserId = int.Parse(Session["idUser"].ToString()),
                    CreatedOnUtc = DateTime.Now,
                    Status = 17
                };

                // Thêm Order vào cơ sở dữ liệu
                objWebsiteASP_NETEntities2.Orders.Add(objOrder);

                // Lưu thông tin vào bảng Order
                objWebsiteASP_NETEntities2.SaveChanges();

                // Lấy OrderId vừa tạo để lưu vào bảng OrderDetail
                int orderId = objOrder.Id;
                List<OrderDetail> lstOrderDetail = new List<OrderDetail>();

                foreach (var item in lstCart)
                {
                    OrderDetail obj = new OrderDetail
                    {
                        Quantity = item.Quantity,
                        OrderId = orderId,
                        ProductId = item.Product.Id
                    };
                    lstOrderDetail.Add(obj);
                }

                // Lưu thông tin vào bảng OrderDetail
                objWebsiteASP_NETEntities2.OrderDetails.AddRange(lstOrderDetail);
                objWebsiteASP_NETEntities2.SaveChanges();

                // Xóa giỏ hàng sau khi thanh toán thành công
                Session["cart"] = null;
                Session["count"] = 0; // Đặt lại số lượng giỏ hàng về 0

                // Gửi thông báo thành công
                TempData["Success"] = "Thanh toán thành công!";
            }

            return View();
        }
    }
    }

           