using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEAMOrderStoreSystem.Entities
{
    public class OrderProd
    {
        public int num { get; set; }
        public string prod { get; set; }
        public int qty { get; set; }
        public decimal price { get; set; }
        public decimal discount { get; set; }
        public decimal total { get; set; }

        public OrderProd(int num, string prod, int qty, decimal price, decimal discount, decimal total)
        {
            this.num = num;
            this.prod = prod;
            this.qty = qty;
            this.price = price;
            this.discount = discount;
            this.total = total;
        }
    }
}