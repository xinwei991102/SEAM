using SEAMOrderStoreSystem.DataAcesss;
using SEAMOrderStoreSystem.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace SEAMOrderStoreSystem
{
    public partial class ViewOrderDetails : System.Web.UI.Page
    {
        int orderID;



        DatabaseContext db = DatabaseContext.getContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                orderID = int.Parse(Request.QueryString["OrderID"]);
                Order order = db.orders.Single(x => x.id == orderID);
                List<OrderQTY> orderQTies = db.orderQTies.Where(x => x.orderID == orderID).ToList();

                txtOrderID.Text = "" + orderID;
                txtDate.Text = order.date.ToString();
                txtStaff.Text = order.staffName;
                if (order.status.Equals("pending"))
                {
                    ddlStatus.SelectedIndex = 0;
                }
                else if (order.status.Equals("confirmed"))
                {
                    ddlStatus.SelectedIndex = 1;
                    ddlStatus.Enabled = false;
                }
                else
                {
                    ddlStatus.SelectedIndex = 2;
                    ddlStatus.Enabled = false;


                }

                txtCustName.Text = order.custName;
                txtCustEmail.Text = order.custEmail;
                txtCustAddress.Text = order.custAddress;

                decimal ttotal = 0;
                List<OrderProd> orderProds = new List<OrderProd>();
                for (int i = 0; i < orderQTies.Count; i++)
                {
                    OrderQTY orderQTY = orderQTies.ElementAt(i);
                    Product product = db.products.Single(x => x.id == orderQTY.productID);
                    string prod = product.name;
                    int qty = orderQTY.quantity;
                    decimal price = product.price;
                    decimal discount = orderQTY.discount;
                    decimal total = qty * price * (1 - discount);
                    OrderProd orderProd = new OrderProd(i + 1, prod, qty, price, discount, total);
                    orderProds.Add(orderProd);
                    ttotal += total;
                }

                gvOrderQTY.DataSource = orderProds;
                gvOrderQTY.DataBind();

                lblTotal.Text = "Total : " + ttotal.ToString("0.00");
            }

            divPopup.Visible = false;
        }

        protected void btnEditOrder_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtOrderID.Text);
            Order newOrder = db.orders.Single(x => x.id == id);
            newOrder.custName = txtCustName.Text;
            newOrder.custEmail = txtCustEmail.Text;
            newOrder.custAddress = txtCustAddress.Text;
            bool updateStock = false;
            if (ddlStatus.SelectedIndex == 0)
            {
                newOrder.status = "pending";
            }
            else if (ddlStatus.SelectedIndex == 1)
            {
                if (newOrder.status.Equals("pending"))
                {
                    updateStock = true;
                }
                newOrder.status = "confirmed";
            }
            else
            {
                newOrder.status = "canceled";
            }

            db.updateOrders();

            for (int i = 0; i < gvOrderQTY.Rows.Count; i++)
            {
                GridViewRow row = gvOrderQTY.Rows[i];
                string prodName = ((System.Web.UI.WebControls.Label)row.Cells[1].Controls[1]).Text;
                Product prod = db.products.Single(x => x.name == prodName);
                int qty = int.Parse(((System.Web.UI.WebControls.TextBox)row.Cells[2].Controls[1]).Text);
                decimal discount = decimal.Parse(((System.Web.UI.WebControls.TextBox)row.Cells[4].Controls[1]).Text);
                OrderQTY orderQTY = db.orderQTies.Single(x => x.orderID == id && x.productID == prod.id);
                orderQTY.quantity = qty;
                orderQTY.discount = discount;

                if (updateStock)
                {
                    //update stock
                    prod.stock -= qty;

                }

            }
            db.updateOrderQTies();
            db.updateProducts();

            //popup
            divPopup.Visible = true;


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddOrder.aspx");

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void btnViewOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewAllOrders.aspx");
        }

        protected void btnCreatePDF_Click(object sender, EventArgs e)
        {
            int orderID = int.Parse(Request.QueryString["OrderID"]);
            Order order = db.orders.Single(x => x.id == orderID);
            List<OrderQTY> orderQTies = db.orderQTies.Where(x => x.orderID == orderID).ToList();

           
            

            

            decimal ttotal = 0;
            List<OrderProd> orderProds = new List<OrderProd>();
            for (int i = 0; i < orderQTies.Count; i++)
            {
                OrderQTY orderQTY = orderQTies.ElementAt(i);
                Product product = db.products.Single(x => x.id == orderQTY.productID);
                string prod = product.name;
                int qty = orderQTY.quantity;
                decimal price = product.price;
                decimal discount = orderQTY.discount;
                decimal total = qty * price * (1 - discount);
                OrderProd orderProd = new OrderProd(i + 1, prod, qty, price, discount, total);
                orderProds.Add(orderProd);
                ttotal += total;
            }




            //create html
            string htmlContent = "<html><head><style>.detail-table, .detail-table th, .detail-table td{border: 1px solid;padding: 5px;text-align:right;            }.display-table td{                padding-right:10px;            border: 0px;                vertical-align:top;            }            body{            padding: 10%;            }</style></head><body><div style='width:100%;text-align:center;' > <h1> Millos Trading </h1>    123, Hill Street,<br/>    31000 Perak,<br />    Malaysia.<br />    <br />    Tel : 605-5342353 <br />    Fax : 605-5342352 <br />    </div>    <br />    <table class='display-table' >	<tr>		<td>Order ID</td>		<td>:</td>		<td>" +
                order.id + "</td>	</tr>	<tr>		<td>Date</td>		<td>:</td>		<td>" +
                order.date.ToShortDateString() + "</td>	</tr>	<tr>		<td>Salesperson</td>		<td>:</td>		<td>" +
                order.staffName + "</td>	</tr>	<tr>		<td>Status</td>		<td>:</td>		<td>" +
                order.status + "</td>	</tr>	<tr>		<td>Buyer</td>		<td>:</td>		<td>            " +
                order.custName + "<br/>            " +
                order.custEmail + "<br/>			<br/>            " +
                order.custAddress.Replace(",", ",<br/>") + "</td>	</tr></table><br/>Order Details : <br/><table class='detail-table' style='width:100%'>	<thead>		<th>No</th>		<th>Product</th>		<th>Quantity</th>		<th>Unit Price</th>		<th>Discount</th>		<th>Total</th>	</thead>	</th>";

            int num = 1;
            foreach(OrderProd op in orderProds)
            {
                htmlContent += "<tr><td>" + num + "</td><td>" + op.prod + "</td><td>" + op.qty + "</td><td>" + op.price.ToString("0.00") + "</td><td>" + op.discount.ToString("0.00") + "</td><td>" + op.total.ToString("0.00") + "</td></tr>";
                num++;
            }
            
            htmlContent += "<tr><td></td><td></td><td></td><td></td><td>Total</td><td>" + ttotal.ToString("0.00") + "</td></tr></table></body></html>";
            string filePath = Path.Combine(Server.MapPath("~"), "GeneratedOrder.pdf");            
            CreatePDFFromHtml(htmlContent, filePath);

            HttpResponse res = HttpContext.Current.Response;
            res.Clear();
            res.AppendHeader("content-disposition", "attachment; filename=GeneratedOrderID_" + txtOrderID.Text + ".pdf");
            res.ContentType = "application/octet-stream";
            res.WriteFile(filePath);
            res.Flush();
            res.End();
        }

        public void CreatePDFFromHtml(string htmlContent, string filePath)
        {
            var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
            htmlToPdf.GeneratePdf(htmlContent, null, filePath);



        }


    }
}