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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productName = Request.QueryString["ProductName"];
                txtTest.Text = productName;
            }
        }
    }
}