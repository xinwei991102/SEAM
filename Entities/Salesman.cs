using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEAMOrderStoreSystem.Entities
{
    public class Salesman
    {
        public string name { get; set; }

        public Salesman(string name)
        {
            this.name = name;
        }
    }
}