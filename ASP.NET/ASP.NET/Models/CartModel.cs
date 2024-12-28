using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP.NET.Models
{
    public class CartModel
    {
        public Product Product { get; set; }
        public int  Quantity { get; set; }
    }
}