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
    public partial class UserDashboard : System.Web.UI.Page
    {
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["Username"] == null)
                {
                    Response.Redirect("Login.aspx"); // Redirect to login if session is null
                }
                string username = Session["Username"].ToString();
                using (SqlConnection con = new SqlConnection(conn))
                {
                    con.Open();
                    string query = "SELECT Id FROM user_data WHERE Username = @Username";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Username", username);

                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        Session["StudentID"] = result;// Store StudentID in session for later use
                    }
                }
                Binddata();
            }
        }
       

        private void Binddata()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    //con.Open();
                    using (SqlCommand da = new SqlCommand("SELECT * FROM jobs where Deadline >= GETDATE()", con))
                    {
                        SqlDataAdapter ad = new SqlDataAdapter(da);
                        DataTable dt = new DataTable();
                        ad.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rp1.DataSource = dt;
                            rp1.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('No Data Found');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('No Data Found: " + ex.Message + "');</script>");
                //Response.Write("<script>alert('No Data Found');</script>");
            }
        }
    }
}