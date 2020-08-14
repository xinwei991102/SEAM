using SEAMOrderStoreSystem.DataAcesss;
using SEAMOrderStoreSystem.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEAMOrderStoreSystem
{
    public partial class ViewInventory : System.Web.UI.Page
    {
        private class OrderTotal
        {
            public Order order { get; set; }
            public decimal total { get; set; }

            public OrderTotal(Order order, decimal total)
            {
                this.order = order;
                this.total = total;
            }
        }

        DatabaseContext db = DatabaseContext.getContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if user is logged in
            if ((System.Web.HttpContext.Current.User == null) || !System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            if (!IsPostBack)
            {
                updateTable();
            }

        }

        protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            string prodname = ((Label)gvProducts.SelectedRow.Cells[0].Controls[1]).Text;
            Response.Redirect("~/ViewProductDetails.aspx?ProductName=" + prodname);
        }

        protected void updateTable()
        {
            List<Product> products = new List<Product>();

            //if (chkPending.Checked)
            //{
            //    orders.AddRange(db.orders.Where(x => x.status == "pending").ToList());
            //}
            //if (chkConfirmed.Checked)
            //{
            //    orders.AddRange(db.orders.Where(x => x.status == "confirmed").ToList());
            //}
            //if (chkCanceled.Checked)
            //{
            //    orders.AddRange(db.orders.Where(x => x.status == "canceled").ToList());
            //}

            //orders = orders.Where(x => x.date.ToShortDateString().Contains(txtDate.Text) && x.salesmanName.Contains(txtStaff.Text) && x.custName.Contains(txtCustName.Text)).OrderBy(x => x.id).ToList();


            //List<OrderTotal> orderTotals = new List<OrderTotal>();
            //foreach (Order order in orders)
            //{
            //    decimal total = 0;
            //    foreach (OrderLine orderLine in db.orderLines.Where(x => x.orderID == order.id))
            //    {
            //        Product product = db.products.Single(x => x.id == orderLine.productID);
            //        total += orderLine.quantity * product.price * (1 - orderLine.discount);
            //    }
            //    OrderTotal orderTotal = new OrderTotal(order, total);
            //    orderTotals.Add(orderTotal);
            //}
            gvProducts.DataSource = db.products;
            gvProducts.DataBind();
        }



        protected void btnSearch_Click(object sender, EventArgs e)
        {
            updateTable();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddProduct.aspx");
        }

    }
}