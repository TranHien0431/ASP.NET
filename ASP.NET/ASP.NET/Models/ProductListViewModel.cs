using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP.NET.Models
{
    public class ProductListViewModel
    {
        public List<Product> Products { get; set; }  // Danh sách sản phẩm
        public List<Category> ListCategory { get; set; } // Danh sách danh mục
        public List<Brand> ListBrand { get; set; } // Danh sách thương hiệu
        public int CurrentPage { get; set; }  // Trang hiện tại
        public int TotalPages { get; set; }  // Tổng số trang
        public int CategoryID { get; set; }  // ID danh mục (để biết đang xem sản phẩm của danh mục nào)
        public int? BrandID { get; set; }  // ID thương hiệu (thay đổi thành int? để có thể nhận null)
    }
}