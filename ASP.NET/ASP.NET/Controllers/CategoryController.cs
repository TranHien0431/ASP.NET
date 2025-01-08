using ASP.NET.Context;
using ASP.NET.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        WebsiteASP_NETEntities2 objWebsiteASP_NETEntities2 = new WebsiteASP_NETEntities2();
        public ActionResult Index()
        {
           
            return View();
        }
        public ActionResult AllCategory()

        {  var lstCategory = objWebsiteASP_NETEntities2.Categories.ToList();
        
            return View(lstCategory);
        }
        public ActionResult ProductCategory(int id, int page = 1)  // Thêm tham số page với giá trị mặc định là 1
        {
            int pageSize = 5;  // Số sản phẩm mỗi trang

            // Lấy sản phẩm của một danh mục với phân trang
            var listProduct = objWebsiteASP_NETEntities2.Products
                                .Where(n => n.CategoryId == id)
                                .OrderBy(p => p.Id)  // Sắp xếp sản phẩm (nếu cần)
                                .Skip((page - 1) * pageSize)  // Bỏ qua các sản phẩm trước trang hiện tại
                                .Take(pageSize)  // Lấy sản phẩm cho trang hiện tại
                                .ToList();

            // Tổng số sản phẩm
            var totalItems = objWebsiteASP_NETEntities2.Products.Count(n => n.CategoryId == id);
            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);  // Tính tổng số trang

            // Tạo ViewModel chứa thông tin phân trang
            var model = new ProductListViewModel
            {
                Products = listProduct,
                CurrentPage = page,
                TotalPages = totalPages,
                CategoryID = id
            };

            return View(model);
        }

        // Tìm kiếm và lọc sản phẩm
        public ActionResult Search(string keyword, decimal? minPrice, decimal? maxPrice, int page = 1)
        {
            var query = objWebsiteASP_NETEntities2.Products.AsQueryable();

            // Lọc theo từ khóa
            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(p => p.Name.Contains(keyword) || p.ShortDes.Contains(keyword));
            }

            // Lọc theo giá
            if (minPrice.HasValue)
            {
                query = query.Where(p => p.Price >= (double)minPrice.Value);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(p => p.Price <= (double)maxPrice.Value);
            }

            // Phân trang với PagedList
            int pageSize = 10; // Số lượng sản phẩm trên mỗi trang
            var products = query.OrderBy(p => p.Name).ToPagedList(page, pageSize); // Sử dụng ToPagedList

            return View(products); // Trả về PagedList trong View
        }
    }
}