using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP.NET.Models
{
    public class User
    {
        public int Id { get; set; }
        public string UserName { get; set; }

        public string FristName { get; set; }

        public string LastName { get; set; }

        public int Phone { get; set; }


        public string Password { get; set; }
    }
}