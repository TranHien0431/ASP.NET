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
          
                if (Session["idUser"] == null)
                {
                    return RedirectToAction("Login", "Home");
                }
                else
                {
                    // lấy thông tin từ giỏ hàng trong session
                    var istCart = (List<CartModel>)Session["cart"];

                    // tạo dữ liệu cho Order
                    Order objOrder = new Order();
                    objOrder.Name = "DonHang-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                    objOrder.UserId = int.Parse(Session["idUser"].ToString());
                    objOrder.CreatedOnUtc = DateTime.Now;
                    objOrder.Status = 17;

                objWebsiteASP_NETEntities2.Orders.Add(objOrder);

                // lưu thông tin vào bảng Order
                objWebsiteASP_NETEntities2.SaveChanges();

                    // Lấy OrderId vừa tạo để lưu vào bảng OrderDetail
                    int orderId = objOrder.Id;
                    List<OrderDetail> lstOrderDetail = new List<OrderDetail>();

                    foreach (var item in istCart)
                    {
                        OrderDetail obj = new OrderDetail();
                        obj.Quantity = item.Quantity;
                        obj.OrderId = orderId;
                        obj.ProductId = item.Product.Id;
                        lstOrderDetail.Add(obj);
                    }

                objWebsiteASP_NETEntities2.OrderDetails.AddRange(lstOrderDetail);
                objWebsiteASP_NETEntities2.SaveChanges();
                }

                return View();
            }
        }
    }

           