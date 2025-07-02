using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal.company
{
    public partial class company_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["username"] != null && Request.Cookies["pass"] != null)
                {
                    email.Text = Request.Cookies["email"].Value;
                    pass.Text = Request.Cookies["pass"].Value;
                    chkRememberMe.Checked = true;
                }
            }
        }

        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";


        protected void btn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conn);

            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Company WHERE email=@Email AND password=@Password", con))
            {
                cmd.Parameters.AddWithValue("@Email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", pass.Text.Trim());
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    if (chkRememberMe.Checked)
                    {
                        Response.Cookies["email"].Value = email.Text;
                        Response.Cookies["pass"].Value = pass.Text;
                        Response.Cookies["email"].Expires = DateTime.Now.AddHours(1);
                        Response.Cookies["pass"].Expires = DateTime.Now.AddHours(1);
                    }
                    else
                    {
                        Response.Cookies["email"].Expires = DateTime.Now.AddHours(-1);
                        Response.Cookies["pass"].Expires = DateTime.Now.AddHours(-1);
                    }
                    bool isApproved = Convert.ToBoolean(reader["IsApproved"]);
                    if (isApproved)
                    {
                        Session["CompanyID"] = reader["id"];
                        Session["CompanyName"] = reader["company_name"];
                        Session["UserType"] = "Company";
                        Response.Write("<script>alert('welcome');</script>");
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Your account is not approved By Admin. Please contact support.');</script>");
                        email.Text = string.Empty;
                        pass.Text = string.Empty;
                        email.Focus();
                    }
                }
                con.Close();
            }
        }
    }
}