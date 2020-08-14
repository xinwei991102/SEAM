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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productId = Request.QueryString["ProductId"];
                Product prod = db.products.Single(x => x.id.ToString() == productId);
                txtProdID.Text = prod.id.ToString();
                txtProdName.Text = prod.name;
                txtPrice.Text = prod.price.ToString("")

            }
        }
    }
}