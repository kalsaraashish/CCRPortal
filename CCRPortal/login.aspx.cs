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

                           

                            string userType = reader["usertype"].ToString().Trim().ToLower();

                            //Session["username"] = username.Text;

                            if (userType == "admin")
                            {
                                Session["admin"] = username.Text;
                                Response.Redirect("/admin/AdminDashboard.aspx");
                            }
                            else if (userType == "user")
                            {
                                bool isApproved = Convert.ToBoolean(reader["IsApproved"]);
                                if (isApproved)
                                {
                                    Session["username"] = username.Text;
                                    //Response.Write("<script>alert('welcome');</script>");
                                    Response.Redirect("UserDashboard.aspx");
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errormessage();", true);
                                    username.Text = string.Empty;
                                    pass.Text = string.Empty;
                                    username.Focus();
                                }
                                
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