using SEAMOrderStoreSystem.DataAcesss;
using SEAMOrderStoreSystem.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            if (!IsPostBack)
            {
                productId = Request.QueryString["ProductId"];
                prod = db.products.Single(x => x.id.ToString() == productId);

                txtProdID.Text = prod.id.ToString();
                txtProdName.Text = prod.name;
                txtPrice.Text = prod.price.ToString("%.2f");
                txtCategory.Text = prod.category;
                txtManufacturer.Text = prod.manufacturer;
                txtSupplier.Text = prod.supplier;
                txtDesc.Text = prod.description;
                txtComment.Text = prod.comment;
                txtLocation.Text = prod.location;
                txtStock.Text = prod.stock.ToString();
                txtReorderLv.Text = prod.reorderLevel.ToString();
                txtTargetStock.Text = prod.targetStock.ToString();

                List<StockTransaction> transactions = db.stockTransactions.Where(x => x.productId.ToString() == productId).ToList();
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
    }
}