using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEAMOrderStoreSystem.Entities
{
    public class OrderQTY
    {
        public int orderID { get; set; }
        public int productID { get; set; }
        public int quantity { get; set; }
        public decimal discount { get; set; }

        public OrderQTY(int orderID, int productID, int quantity, decimal discount)
        {
            this.orderID = orderID;
            this.productID = productID;
            this.quantity = quantity;
            this.discount = discount;
        }
    }
}