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
            SqlConnection con = new SqlConnection(conn);

            {   
                con.Open();
                using (SqlCommand da = new SqlCommand("SELECT * FROM user_data WHERE Username=@username AND Password=@pass", con))
                {
                    da.Parameters.AddWithValue("@username", username.Text);
                    da.Parameters.AddWithValue("@pass", pass.Text);

                    using (SqlDataReader reader = da.ExecuteReader())
                    {
                        if (reader != null && reader.HasRows)
                        {
                            reader.Read();

                            if (chkRememberMe.Checked)
                            {
                                Response.Cookies["username"].Value = username.Text;
                                Response.Cookies["pass"].Value = pass.Text;

                                Response.Cookies["username"].Expires = DateTime.Now.AddHours(1);
                                Response.Cookies["pass"].Expires = DateTime.Now.AddHours(1);
                            }
                            else
                            {
                                Response.Cookies["username"].Expires = DateTime.Now.AddHours(-1);
                                Response.Cookies["pass"].Expires = DateTime.Now.AddHours(-1);
                            }

                            string userType = reader["usertype"].ToString().Trim().ToLower();

                            Session["username"] = username.Text;

                            if (userType == "admin")
                            {
                                Response.Redirect("/admin/AdminDashboard.aspx");
                            }
                            else if (userType == "user")
                            {
                                Response.Redirect("UserDashboard.aspx");
                            }
                            username.Text = string.Empty;
                            pass.Text = string.Empty;
                            username.Focus();

                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid username or password');</script>");
                            username.Text = string.Empty;
                            pass.Text = string.Empty;
                            username.Focus();
                        }
                        con.Close();
                    }
                }
            }
        }
    }
}