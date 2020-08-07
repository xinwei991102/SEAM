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


        DatabaseContext db = DatabaseContext.getContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime dtime = DateTime.Now;
                ddlMonth.SelectedIndex = dtime.Month - 2;

                txtYear.Text = dtime.Year.ToString();

                bindChart();
            }

        }

        private void bindChart()
        {

            string month = ddlMonth.SelectedValue;
            string year = txtYear.Text;

            List<Order> orders = db.orders.Where(x => x.date.ToShortDateString().Contains(month + year)).ToList();
            List<OrderLine> orderLines = new List<OrderLine>();
            foreach(Order ord in orders)
            {
                orderLines.AddRange(db.orderLines.Where(x => x.orderID == ord.id));

            }

            
          
            List<ProdSales> prodSales = new List<ProdSales>();

            foreach (var prodOrder in orderLines)
            {
                Product prod = db.products.Single(x => x.id == prodOrder.productID);
                if (prodSales.Count(x => x.name == prod.name) == 0)
                {
                    prodSales.Add(new ProdSales(prod.name));
                }

                prodSales.Single(x => x.name == prod.name).total += (prodOrder.quantity * prod.price * (1 - prodOrder.discount));
            }
            string[] prodNames = new string[prodSales.Count];
            decimal[] prodTotals = new decimal[prodSales.Count];

            for (int i = 0; i < prodSales.Count; i++)
            {
                prodNames[i] = prodSales.ElementAt(i).name;
                prodTotals[i] = prodSales.ElementAt(i).total;
            }

            //binding chart control  
            chtProdSales.Series[0].Points.DataBindXY(prodNames, prodTotals);

            //Setting width of line  
            chtProdSales.Series[0].BorderWidth = 10;
            //setting Chart type   
            chtProdSales.Series[0].ChartType = SeriesChartType.Bar;
            // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  

            //Hide or show chart back GridLines  
            //Chart1.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;  
            //Chart1.ChartAreas["ChartArea1"].AxisY.MajorGrid.Enabled = false;  

            //Enabled 3D  
            //Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;\

            gvProdSales.DataSource = prodSales;
            gvProdSales.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bindChart();
        }

        protected void btnViewOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewAllOrders.aspx");
        }
    }
}