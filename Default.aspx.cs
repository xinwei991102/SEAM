using Microsoft.Ajax.Utilities;
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
    public partial class _Default : Page
    {
        DatabaseContext db = DatabaseContext.getContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.User.Identity.Name.IsNullOrWhiteSpace())
            {
                LoginLink.Visible = false;
                string username = Page.User.Identity.Name;
                Staff loggedInStaff = db.staffs.Single(x => x.email == username);
                if (loggedInStaff.role == "Manager")
                {
                    OrderLink.Visible = true;
                    InventoryLink.Visible = true;
                    StaffLink.Visible = true;
                }
                else if (loggedInStaff.role == "Inventory Clerk")
                {
                    OrderLink.Visible = false;
                    InventoryLink.Visible = true;
                    StaffLink.Visible = false;
                }
                else
                {
                    OrderLink.Visible = true;
                    InventoryLink.Visible = false;
                    StaffLink.Visible = false;
                }
            } else
            {
                OrderLink.Visible = false;
                InventoryLink.Visible = false;
                StaffLink.Visible = false;
                LoginLink.Visible = true;
            }
        }
    }
}