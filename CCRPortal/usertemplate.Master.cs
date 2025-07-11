using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal
{
    public partial class usertemplate : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    lblUserName.Text = "Welcome, " + Session["UserName"].ToString().ToLower();
                }
                else
                {
                   Response.Redirect("~/login.aspx");
                }
            }
        }
    }
}