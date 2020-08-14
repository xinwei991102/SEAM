using SEAMOrderStoreSystem.DataAcesss;
using SEAMOrderStoreSystem.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace SEAMOrderStoreSystem
{
    public partial class SalesReport : System.Web.UI.Page
    {
        private class ProdSales
        {
            public string name { get; set; }
            public decimal total { get; set; }

            public ProdSales(string name)
            {
                this.name = name;
                total = 0;
            }

        }

        private class SalesmanSales
        {
            public string name { get; set; }
            public decimal total { get; set; }
            public SalesmanSales(string name)
            {
                this.name = name;
                total = 0;
            }
        }

        private class OrderTotal
        {
            public int orderId { get; set; }
            public decimal total { get; set; }
            public string salesmanName { get; set; }
            public OrderTotal(int orderId, string salesmanName)
            {
                this.orderId = orderId;
                this.salesmanName = salesmanName;
                total = 0;
            }
        }

        DatabaseContext db = DatabaseContext.getContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime dtime = DateTime.Now;
                ddlMonth.SelectedIndex = dtime.Month - 1;

                txtYear.Text = dtime.Year.ToString();

                bindChart();
            }

        }

        private void bindChart()
        {
            // get month and year
            string month = ddlMonth.SelectedValue;
            string year = txtYear.Text;

            //get orders within the month specified
            List<Order> orders = db.orders.Where(x => x.date.ToShortDateString().Contains(month + year) && x.status.Equals("confirmed")).ToList();
            List<OrderLine> orderLines = new List<OrderLine>();

            //get all orderlines of the orders in the month
            foreach (Order ord in orders)
            {
                orderLines.AddRange(db.orderLines.Where(x => x.orderID == ord.id));
            }

            List<OrderTotal> orderTotals = new List<OrderTotal>();

            List<ProdSales> prodSales = new List<ProdSales>();
            foreach (var prodOrder in orderLines)
            {
                Product prod = db.products.Single(x => x.id == prodOrder.productID);
                if (prodSales.Count(x => x.name == prod.name) == 0)
                {
                    prodSales.Add(new ProdSales(prod.name));
                }
                //prodSales.Single(x => x.name == prod.name).total += (prodOrder.quantity * prod.price * (1 - prodOrder.discount));
                prodSales.Single(x => x.name == prod.name).total += prodOrder.quantity;

                Order order = db.orders.Single(x => x.id == prodOrder.orderID);
                if (orderTotals.Count(x=>x.orderId == order.id) == 0)
                {
                    orderTotals.Add(new OrderTotal(order.id, order.salesmanName));
                }
                orderTotals.Single(x => x.orderId == order.id).total += (prodOrder.quantity * prod.price * (1 - prodOrder.discount));
            }

            List<SalesmanSales> salesmanSales = new List<SalesmanSales>();
            foreach (Salesman salesman in db.salesmen)
            {
                SalesmanSales x = new SalesmanSales(salesman.name);
                foreach (OrderTotal orderTotal in orderTotals)
                {
                    if (salesman.name.Equals(orderTotal.salesmanName)){
                        x.total += orderTotal.total;
                    }
                }
                if (x.total > 0)
                {
                    salesmanSales.Add(x);
                }
                
            }
            string[] prodNames = new string[prodSales.Count];
            decimal[] prodTotals = new decimal[prodSales.Count];

            string[] salesmanNames = new string[salesmanSales.Count];
            decimal[] salesmanTotals = new decimal[salesmanSales.Count];

            for (int i = 0; i < prodSales.Count; i++)
            {
                prodNames[i] = prodSales.ElementAt(i).name;
                prodTotals[i] = prodSales.ElementAt(i).total;
            }

            for (int i = 0; i < salesmanSales.Count; i++)
            {
                salesmanNames[i] = salesmanSales.ElementAt(i).name;
                salesmanTotals[i] = salesmanSales.ElementAt(i).total;
            }

            //binding chart control  
            chtProdSales.Series[0].Points.DataBindXY(prodNames, prodTotals);
            gvProdSales.DataSource = prodSales;
            gvProdSales.DataBind();

            chtSalesman.Series[0].Points.DataBindXY(salesmanNames, salesmanTotals);
            gvSalesman.DataSource = salesmanSales;
            gvSalesman.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bindChart();
        }

    }
}