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
    public partial class AddStaff : System.Web.UI.Page
    {
        DatabaseContext db = DatabaseContext.getContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if user is logged in
            if ((System.Web.HttpContext.Current.User == null) || !System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void btnViewStaff_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewStaffDetails.aspx?Email=" + txtEmail.Text + "&Role=" + ddlRole.SelectedValue);
        }

        protected void btnAddStaff_Click(object sender, EventArgs e)
        {
            if (ddlRole.SelectedValue != "Salesman")
            {
                Staff newStaff = new Staff(txtName.Text, txtEmail.Text, txtPassword.Text, ddlRole.SelectedValue);
                db.staffs.Add(newStaff);
                db.updateStaffs();
                divPopup.Visible = true;
            }
            else
            {
                Salesman newSalesman = new Salesman(txtName.Text, txtEmail.Text);
                db.salesmen.Add(newSalesman);
                db.updateSalesmen();
                divPopup.Visible = true;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddStaff.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAllStaff.aspx");
        }

        protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!ddlRole.SelectedValue.Equals("Salesman"))
            {
                divPassword.Visible = true;
                txtPassword.Attributes["Required"] = "true";
            }
            else
            {
                divPassword.Visible = false;
                txtPassword.Attributes["Required"] = "false";
            }
        }
    }
}