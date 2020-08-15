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
    public partial class ViewProductDetails : System.Web.UI.Page
    {
        DatabaseContext db = DatabaseContext.getContext();
        string productId;
        Product prod;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if user is logged in
            if ((System.Web.HttpContext.Current.User == null) || !System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            if (!IsPostBack)
            {
                productId = Request.QueryString["ProductId"];
                linkRefresh.NavigateUrl = "ViewProductDetails.aspx?ProductId=" + productId;
                prod = db.products.Single(x => x.id.ToString() == productId);

                txtProdID.Text = prod.id.ToString();
                txtProdName.Text = prod.name;
                txtPrice.Text = String.Format("{0:0.00}", prod.price);
                txtCategory.Text = prod.category;
                txtManufacturer.Text = prod.manufacturer;
                txtSupplier.Text = prod.supplier;
                txtDesc.Text = prod.description;
                txtComment.Text = prod.comment;
                txtLocation.Text = prod.location;
                txtStock.Text = prod.stock.ToString();
                txtReorderLv.Text = prod.reorderLevel.ToString();
                txtTargetStock.Text = prod.targetStock.ToString();

                if (prod.status.Equals("available"))
                {
                    ddlStatus.SelectedIndex = 0;
                }
                else if (prod.status.Equals("discontinued"))
                {
                    ddlStatus.SelectedIndex = 1;
                }

                List<StockTransaction> transactions = db.stockTransactions.Where(x => x.productId.ToString() == productId).OrderBy(x => x.id).ToList();
                gvTransactions.DataSource = transactions;
                gvTransactions.DataBind();
            }
        }

        protected void btnStockIn_Click(object sender, EventArgs e)
        {
            productId = Request.QueryString["ProductId"];
            prod = db.products.Single(x => x.id.ToString() == productId);
            int stockInAmount = Int32.Parse(txtStockIn.Text);
            StockTransaction transaction = new StockTransaction(db.stockTransactions.Count + 1, Int32.Parse(productId), 
                DateTime.Today, stockInAmount, prod.stock + stockInAmount);

            prod.stock += stockInAmount;
            db.updateProducts();

            db.stockTransactions.Add(transaction);
            db.updateStockTransactions();
            Response.Redirect(Request.RawUrl);
        }

        protected void btnEditProduct_Click(object sender, EventArgs e)
        {
            productId = Request.QueryString["ProductId"];
            prod = db.products.Single(x => x.id.ToString() == productId);
            prod.name = txtProdName.Text;
            prod.price = Decimal.Parse(txtPrice.Text);
            prod.category = txtCategory.Text;
            prod.manufacturer = txtManufacturer.Text;
            prod.supplier = txtSupplier.Text;
            prod.description = txtDesc.Text;
            prod.comment = txtComment.Text;
            prod.location = txtLocation.Text;
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

            db.updateProducts();
            divPopup.Visible = true;
        }

        protected void btnViewProd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewProductDetails.aspx?ProductId=" + Request.QueryString["ProductId"]);
        }
    }
}