using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal
{
    public partial class companytemplate : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CompanyName"] != null)
                {
                    lblUserName.Text = "Welcome, " + Session["CompanyName"].ToString().ToLower();
                }
                else
                {
                    Response.Redirect("../homepage.aspx");
                }
            }
        }
    }
}