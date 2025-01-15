using ASP.NET.Context;
using ASP.NET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using User = ASP.NET.Context.User;

namespace ASP.NET.Controllers
{

    public class HomeController : Controller
    {
        WebsiteASP_NETEntities2 objWebsiteASP_NETEntities2 = new WebsiteASP_NETEntities2();
        public ActionResult Index()
        {
            HomeModel objHomeModel = new HomeModel();
            objHomeModel.ListProduct = objWebsiteASP_NETEntities2.Products.ToList();
            objHomeModel.ListCategory = objWebsiteASP_NETEntities2.Categories.ToList();
            return View(objHomeModel);
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User _user)
        {
            if (ModelState.IsValid)
            {
                var check = objWebsiteASP_NETEntities2.Users.FirstOrDefault(s => s.Email == _user.Email);
                if (check == null)
                {
                    _user.Password = GetMD5(_user.Password);
                    objWebsiteASP_NETEntities2.Configuration.ValidateOnSaveEnabled = false;
                    objWebsiteASP_NETEntities2.Users.Add(_user);
                    objWebsiteASP_NETEntities2.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }
            }
            return View();
        }
        //create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {
                // Mã hóa mật khẩu
                var f_password = GetMD5(password);
                // Kiểm tra thông tin đăng nhập
                var user = objWebsiteASP_NETEntities2.Users
                            .FirstOrDefault(u => u.Email == email && u.Password == f_password);

                if (user != null)
                {
                    // Thêm thông tin vào Session
                    Session["FullName"] = user.FirstName + " " + user.LastName;
                    Session["Email"] = user.Email;
                    Session["idUser"] = user.Id;

                    // Kiểm tra quyền Admin
                    if (user.IsAdmin == true)
                    {
                        Session["IsAdmin"] = true;
                        return RedirectToAction("Index", "Home", new { area = "Admin" });
                    }
                    else
                    {
                        Session["IsAdmin"] = false;
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ViewBag.error = "Login failed";
                }
            }
            return View();
        }
        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
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