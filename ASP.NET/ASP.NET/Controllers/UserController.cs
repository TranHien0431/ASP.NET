using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            if (username == "hien" && password == "123456")
            {
                // Lưu thông tin người dùng vào Session
                Session["UserID"] = "1"; // Giả định UserID là 1 (nếu không lấy từ database)
                Session["UserName"] = username; // Lưu tên đăng nhập vào Session
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View("thatbai");
            }
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(User ojbUser)
        {
            return View();
        }
    }
}