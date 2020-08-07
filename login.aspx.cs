using SEAMOrderStoreSystem.DataAcesss;
using SEAMOrderStoreSystem.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEAMOrderStoreSystem.Scripts
{
    public partial class login : System.Web.UI.Page
    {
        DatabaseContext db = DatabaseContext.getContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Staff> staffs = db.staffs.Where(x => x.name.Contains("looi")).ToList();
            GridView1.DataSource = staffs;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Staff staff = db.staffs.Single(x => x.name == "looi");
                staff.email = "looitest";

                db.updateStaffs();



            }
            catch (Exception )
            {

            }
        }
    }
}