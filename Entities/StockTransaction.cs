using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEAMOrderStoreSystem.Entities
{
    public class StockTransaction
    {
        public int id { get; set; }
        public int productId { get; set; }
        public DateTime stockInDate { get; set; }
        public int stockInAmount { get; set; }
        public int amountAfterRestock { get; set; }

        public StockTransaction(int id, int productId, DateTime stockInDate, int stockInAmount, int amountAfterRestock)
        {
            this.id = id;
            this.productId = productId;
            this.stockInDate = stockInDate;
            this.stockInAmount = stockInAmount;
            this.amountAfterRestock = amountAfterRestock;
        }
    }
}