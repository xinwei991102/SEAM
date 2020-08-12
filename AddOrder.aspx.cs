using SEAMOrderStoreSystem.DataAcesss;
using SEAMOrderStoreSystem.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEAMOrderStoreSystem
{
    public partial class AddOrder : System.Web.UI.Page
    {
        DatabaseContext db = DatabaseContext.getContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindDDLStaff();
                this.BindGrid();
                BindDDLProduct();

                txtOrderID.Text = (db.orders.Count + 1).ToString();
                txtDate.Text = DateTime.Now.ToShortDateString();
            }

            divPopup.Visible = false;
        }

        private void BindDDLStaff()
        {
            List<Staff> staffs = db.staffs.Where(x => x.role == "sales").ToList();
            ddlStaff.DataSource = staffs;
            ddlStaff.DataTextField = "name";
            ddlStaff.DataValueField = "name";
            ddlStaff.DataBind();
            ddlStaff.Items.Insert(0, new ListItem("Select"));
        }

        private void BindDDLProduct()
        {
            List<Product> prodList = new List<Product>(db.products);
            prodList = prodList.OrderBy(x => x.name).ToList();
            ddlProduct.DataSource = prodList;
            ddlProduct.DataTextField = "name";
            ddlProduct.DataValueField = "price";
            ddlProduct.DataBind();
            ddlProduct.Items.Insert(0, new ListItem("Select"));
        }

        private void BindGrid()
        {
            DataTable dt = new DataTable();




            dt.Rows.Add();


            gvOrderQTY.DataSource = dt;
            gvOrderQTY.DataBind();
        }

        protected void btnAddOrder_Click(object sender, EventArgs e)
        {
            if (txtCustName.Text.Length > 0 && txtCustEmail.Text.Length > 0 && txtCustAddress.Text.Length > 0)
            {

                if (!string.IsNullOrEmpty(Request.Form["product"]) && !string.IsNullOrEmpty(Request.Form["quantity"]) && !string.IsNullOrEmpty(Request.Form["discount"]))
                {
                    
                    if(ddlStaff.SelectedIndex == 0)
                    {
                        lblError.Text = "*Sales person not selected";
                        return;
                    }

                    //create order
                    int orderID = db.orders.Count + 1;
                    DateTime date = DateTime.Now;
                    string custName = txtCustName.Text;
                    string custEmail = txtCustEmail.Text;
                    string custAddress = txtCustAddress.Text;
                    string status = "pending";

                    string salesmanName = ddlStaff.SelectedValue;

                    Order newOrder = new Order(orderID, date, custName, custEmail, custAddress, status, salesmanName);


                    //Fetch the Hidden Field values from the Request.Form collection.
                    string[] products = Request.Form["product"].Split(',');
                    string[] quantity = Request.Form["quantity"].Split(',');
                    string[] discount = Request.Form["discount"].Split(',');

                    List<OrderLine> newOrderLines = new List<OrderLine>();
                    //Loop through the values and insert into database table.
                    if(products.Length == quantity.Length && products.Length == discount.Length)
                    {
                        for(int i = 0; i<products.Length;i++)
                        {
                            Product prod = db.products.Single(x => x.name == products[i]);
                            OrderLine newOrderQTY = new OrderLine(newOrder.id, prod.id, int.Parse(quantity[i]), decimal.Parse(discount[i]));
                            newOrderLines.Add(newOrderQTY);
                        }
                    }
                    else
                    {
                        lblError.Text = "*Number of selected products and details does not match";
                        return;
                    }

                    db.orders.Add(newOrder);
                    db.orderLines.AddRange(newOrderLines);
                    db.updateOrders();
                    db.updateOrderLines();

                    

                    popUp();


                }
                else
                {
                    lblError.Text = "*No product selected for the order";
                    return;
                }
            }
            else
            {
                lblError.Text = "*Customer info not complete";
                return;
            }
        }

        private void popUp()
        {
            divPopup.Visible = true;
        }

        protected void btnViewOrder2_Click(object sender, EventArgs e)
        {
            //redirect to view order
            string url = "~/ViewOrderDetails.aspx?OrderID=" + txtOrderID.Text;
            Response.Redirect(url);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddOrder.aspx");
        }

        protected void btnViewOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewAllOrders.aspx");
        }
    }
}