using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEAMOrderStoreSystem.Entities
{
    public class Salesman
    {
        public string name { get; set; }
        public string email { get; set; }

        public Salesman(string name, string email)
        {
            this.name = name;
            this.email = email;
        }
    }
}