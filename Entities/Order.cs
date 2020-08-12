using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEAMOrderStoreSystem.Entities
{
    public class Order
    {
        public int id { get; set; }
        public DateTime date { get; set; }
        public string custName { get; set; }
        public string custEmail { get; set; }
        public string custAddress { get; set; }
        public string status { get; set; }
        public string salesmanName { get; set; }

        public Order(int id, DateTime date, string custName, string custEmail, string custAddress, string status, string salesmanName)
        {
            this.id = id;
            this.date = date;
            this.custName = custName;
            this.custEmail = custEmail;
            this.custAddress = custAddress;
            this.status = status;
            this.salesmanName = salesmanName;
            
        }

    }
}