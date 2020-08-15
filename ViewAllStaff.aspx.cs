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
    public partial class ViewAllStaff : System.Web.UI.Page
    {
        DatabaseContext db = DatabaseContext.getContext();
        private class AllStaff
        {
            public string name { get; set; }
            public string email { get; set; }
            public string password { get; set; }
            public string role { get; set; }

            public AllStaff(string name, string email, string password, string role)
            {
                this.name = name;
                this.email = email;
                this.password = password;
                this.role = role;
            }

        }

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
        protected void updateTable()
        {

            List<AllStaff> allStaffs = new List<AllStaff>();
            List<AllStaff> filterStaffs = new List<AllStaff>();

            foreach (Staff staff in db.staffs)
            {
                AllStaff allStaff = new AllStaff(staff.name, staff.email, staff.password, staff.role);
                allStaffs.Add(allStaff);
            }

            foreach (Salesman salesman in db.salesmen)
            {
                AllStaff allStaff = new AllStaff(salesman.name, salesman.email, "", "Salesman");
                allStaffs.Add(allStaff);
            }

            if (chkGeneral.Checked)
            {
                filterStaffs.AddRange(allStaffs.Where(x => x.role == "General Staff").ToList());
            }
            if (chkInventory.Checked)
            {
                filterStaffs.AddRange(allStaffs.Where(x => x.role == "Inventory Clerk").ToList());
            }
            if (chkManager.Checked)
            {
                filterStaffs.AddRange(allStaffs.Where(x => x.role == "Manager").ToList());
            }
            if (chkSalesman.Checked)
            {
                filterStaffs.AddRange(allStaffs.Where(x => x.role == "Salesman").ToList());
            }

            filterStaffs = filterStaffs.Where(x => x.name.Contains(txtName.Text)).OrderBy(x => x.role).ToList();

            gvStaff.DataSource = filterStaffs;
            gvStaff.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            updateTable();
        }

        protected void gvStaff_SelectedIndexChanged(object sender, EventArgs e)
        {
            string email = ((Label)gvStaff.SelectedRow.Cells[1].Controls[1]).Text;
            string role = ((Label)gvStaff.SelectedRow.Cells[3].Controls[1]).Text;
            Response.Redirect("~/ViewStaffDetails.aspx?Email=" + email + "?Role=" + role);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddStaff.aspx");
        }
    }
}