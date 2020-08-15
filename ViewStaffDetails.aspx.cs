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
    public partial class ViewStaffDetails : System.Web.UI.Page
    {
        DatabaseContext db = DatabaseContext.getContext();
        Staff staff;
        Salesman salesman;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if user is logged in
            if ((System.Web.HttpContext.Current.User == null) || !System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            
            if (!IsPostBack)
            {
                string email = Request.QueryString["Email"];
                string role = Request.QueryString["Role"];
                linkRefresh.NavigateUrl = "ViewStaffDetails.aspx?Email=" + email + "&Role=" + role;
                
                if (role.Equals("Salesman"))
                {
                    divPassword.Visible = false;
                    txtPassword.Attributes["Required"] = "false";
                    salesman = db.salesmen.Single(x => x.email == email);
                    ddlRole.SelectedValue = "Salesman";
                    txtEmail.Text = salesman.email;
                    txtName.Text = salesman.name;

                } else
                {
                    divPassword.Visible = true;
                    txtPassword.Attributes["Required"] = "false";
                    staff = db.staffs.Single(x => x.email == email);
                    ddlRole.SelectedValue = staff.role;
                    txtEmail.Text = staff.email;
                    txtName.Text = staff.name;
                    txtPassword.Attributes["type"] = "text";
                    txtPassword.Text = staff.password;
                    txtPassword.Attributes["type"] = "password";
                }
            }
        }

        protected void btnViewStaff_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewStaffDetails.aspx?Email=" + txtEmail.Text + "&Role=" + ddlRole.SelectedValue);
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            string email = Request.QueryString["Email"];
            string role = Request.QueryString["Role"];

            if (ddlRole.SelectedValue != "Salesman")
            {
                staff = db.staffs.Single(x => x.email == email);
                staff.name = txtName.Text;
                staff.password = txtPassword.Text;
                db.updateStaffs();
                divPopup.Visible = true;
            }
            else
            {
                salesman = db.salesmen.Single(x => x.email == email);
                salesman.name = txtName.Text;
                db.updateSalesmen();
                divPopup.Visible = true;
            }
        }

    }
}