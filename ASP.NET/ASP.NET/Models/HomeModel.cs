using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP.NET.Models
{
    public class HomeModel
    {
        public List<Product> ListProducts { get; set; }
        public List<Category> ListCategory { get; set; }
    }
}