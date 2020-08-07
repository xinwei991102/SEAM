using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEAMOrderStoreSystem.Entities
{
    public class Product
    {
        public int id { get; }
        public string name { get; set;}
        public decimal price { get; set; }
        public string category { get; set; }
        public string manufacturer { get; set;}
        public string supplier { get; set; }
        public string description { get; set; }
        public string comment { get; set; }
        public string location { get; set; }
        public int stock { get; set; }
        public int reorderLevel { get; set; }
        public int targetStock { get; set; }
        public string status { get; set; }

        public Product(int id, string name, decimal price, string category, string manufacturer, string supplier, string description, string comment, string location, int stock, int reorderLevel, int targetStock, string status)
        {
            this.id = id;
            this.name = name;
            this.price = price;
            this.category = category;
            this.manufacturer = manufacturer;
            this.supplier = supplier;
            this.description = description;
            this.comment = comment;
            this.location = location;
            this.stock = stock;
            this.reorderLevel = reorderLevel;
            this.targetStock = targetStock;
            this.status = status;
            
        }

    }
}