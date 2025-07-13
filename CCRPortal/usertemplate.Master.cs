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
                    lblUserName.Attributes.Add("onclick", "window.location.href='User_Profile.aspx';");
                }
                else
                {
                   Response.Redirect("~/login.aspx");
                }
            }
        }

       
    }
}