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
    public partial class AddProduct : System.Web.UI.Page
    {
        DatabaseContext db = DatabaseContext.getContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if user is logged in
            if ((System.Web.HttpContext.Current.User == null) || !System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            txtProdID.Text = (db.products.Count + 1).ToString();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewInventory.aspx");
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Product prod = new Product();
            prod.id = db.products.Count + 1;
            prod.name = txtProdName.Text;
            prod.price = Decimal.Parse(txtPrice.Text);
            prod.category = txtCategory.Text;
            prod.manufacturer = txtManufacturer.Text;
            prod.supplier = txtSupplier.Text;
            prod.description = txtDesc.Text;
            prod.comment = txtComment.Text;
            prod.location = txtLocation.Text;
            prod.stock = Int32.Parse(txtStock.Text);
            prod.reorderLevel = Int32.Parse(txtReorderLv.Text);
            prod.targetStock = Int32.Parse(txtTargetStock.Text);

            if (ddlStatus.SelectedIndex == 0)
            {
                prod.status = "available";
            }
            else if (ddlStatus.SelectedIndex == 1)
            {
                prod.status = "discontinued";
            }

            db.products.Add(prod);
            db.updateProducts();
            divPopup.Visible = true;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddProduct.aspx");
        }

        protected void btnViewProd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewProductDetails.aspx?ProductId=" + db.products.Count);
        }
    }
}