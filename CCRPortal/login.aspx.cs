using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["username"] != null && Request.Cookies["pass"] != null)
                {
                    username.Text = Request.Cookies["username"].Value;
                    pass.Text = Request.Cookies["pass"].Value;
                    chkRememberMe.Checked = true;
                }
            }

        }
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            SqlConnection con=new SqlConnection(conn);  
            SqlDataAdapter da = new SqlDataAdapter("select * from user_data where Username=@username and Password=@pass", con);
            da.SelectCommand.Parameters.AddWithValue("@username", username.Text);
            da.SelectCommand.Parameters.AddWithValue("@pass", pass.Text);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (chkRememberMe.Checked)
                {
                    Request.Cookies["username"].Value = username.Text;
                    Request.Cookies["pass"].Value = pass.Text;
                    Response.Cookies["username"].Expires = DateTime.Now.AddHours(1);
                    Response.Cookies["pass"].Expires = DateTime.Now.AddHours(1);
                }
                else
                {
                    if (Request.Cookies["username"] != null)
                    {
                        Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);
                    }
                    if (Request.Cookies["pass"] != null)
                    {
                        Response.Cookies["pass"].Expires = DateTime.Now.AddDays(-1);
                    }
                }
                string userType = dt.Rows[0]["UserType"].ToString();
                if (userType == "Admin")
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else if (userType == "User")
                {
                    Response.Redirect("UserDashboard.aspx");
                }
            }
        }
    }
}