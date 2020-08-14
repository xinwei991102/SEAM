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
            string id = ((Label)gvProducts.SelectedRow.Cells[0].Controls[1]).Text;
            Response.Redirect("~/ViewProductDetails.aspx?ProductId=" + id);
        }

        protected void updateTable()
        {
            List<Product> products = new List<Product>();
            
            if (chkAvailable.Checked)
            {
                products.AddRange(db.products.Where(x => x.status == "available").ToList());
            }
            if (chkDiscontinued.Checked)
            {
                products.AddRange(db.products.Where(x => x.status == "discontinued").ToList());
            }

            products = products.Where(x => x.location.Contains(txtLocation.Text) 
            && (x.id.ToString().Contains(txtSearch.Text) 
            || x.comment.Contains(txtSearch.Text) 
            || x.description.Contains(txtSearch.Text) 
            ||  x.manufacturer.Contains(txtSearch.Text)
            || x.name.Contains(txtSearch.Text) 
            || x.supplier.Contains(txtSearch.Text)
            || x.category.Contains(txtSearch.Text))).OrderBy(x => x.id).ToList();
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


            gvProducts.DataSource = products;
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