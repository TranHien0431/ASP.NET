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
        WebsiteASP_NETEntities2 objWebsiteASP_NETEntities = new WebsiteASP_NETEntities2();

        // GET: Category
        public ActionResult Index()
        {
            var lstCategory = objWebsiteASP_NETEntities.Categories.ToList();
            return View(lstCategory);
        }
        public ActionResult AllCategory()
        {
            var lstCategory = objWebsiteASP_NETEntities.Categories.ToList();

            return View(lstCategory);
        }
        public ActionResult ProductCategory(int id, double? minPrice, double? maxPrice, List<int> BrandIds, int page = 1)
        {
            int pageSize = 6;

            // Lấy thông tin danh mục hiện tại
            var category = objWebsiteASP_NETEntities.Categories.FirstOrDefault(c => c.Id == id);

            // Khởi tạo truy vấn sản phẩm
            var query = objWebsiteASP_NETEntities.Products.Where(p => p.CategoryId == id);

            if (minPrice.HasValue)
            {
                query = query.Where(p => p.Price >= minPrice.Value);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(p => p.Price <= maxPrice.Value);
            }

            if (BrandIds != null && BrandIds.Any())
            {
                query = query.Where(p => BrandIds.Contains(p.BrandId.Value));
            }

            var totalItems = query.Count();

            var listProduct = query
                .OrderBy(p => p.Id)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            var listCategory = objWebsiteASP_NETEntities.Categories.ToList();
            var listBrand = objWebsiteASP_NETEntities.Brands.ToList();

            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            var model = new ProductListViewModel
            {
                Products = listProduct,
                ListCategory = listCategory,
                ListBrand = listBrand,
                CurrentPage = page,
                TotalPages = totalPages,
                CategoryID = id,
                BrandID = null
            };

            // Truyền tên danh mục vào ViewBag
            ViewBag.CategoryName = category?.Name ?? "Danh mục không tồn tại";  // Thêm giá trị mặc định nếu không tìm thấy

            return View(model);
        }



        // Tìm kiếm và lọc sản phẩm
        public ActionResult Search(string keyword, double? minPrice, double? maxPrice, int page = 1)
        {
            var query = objWebsiteASP_NETEntities.Products.AsQueryable();

            // Lọc theo từ khóa
            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(p => p.Name.Contains(keyword) || p.ShortDes.Contains(keyword));
            }

            // Lọc theo giá
            if (minPrice.HasValue)
            {
                query = query.Where(p => p.Price >= minPrice.Value);
            }

            if (maxPrice.HasValue)
            {
                query = query.Where(p => p.Price <= maxPrice.Value);
            }

            // Phân trang với PagedList
            int pageSize = 10; // Số lượng sản phẩm trên mỗi trang
            var products = query.OrderBy(p => p.Name).ToPagedList(page, pageSize); // Sử dụng ToPagedList

            return View(products); // Trả về PagedList trong View
        }

    }
}