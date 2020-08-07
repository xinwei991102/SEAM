using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEAMOrderStoreSystem.Entities
{
    public class OrderLine
    {
        public int orderID { get; set; }
        public int productID { get; set; }
        public int quantity { get; set; }
        public decimal discount { get; set; }

        public OrderLine(int orderID, int productID, int quantity, decimal discount)
        {
            this.orderID = orderID;
            this.productID = productID;
            this.quantity = quantity;
            this.discount = discount;
        }
    }
}