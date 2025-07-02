using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal.company
{
    public partial class company_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string con = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        protected void sub_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlConnection = new SqlConnection(con))
            {
                SqlCommand insertdata = new SqlCommand(
                    "INSERT INTO Company (company_name, Email, password, website, profile_info) VALUES (@company_name, @email, @pass, @website, @profile_info)",
                    sqlConnection);

                insertdata.Parameters.AddWithValue("@company_name", coname.Text);
                insertdata.Parameters.AddWithValue("@email", email.Text);
                insertdata.Parameters.AddWithValue("@pass", pass.Text);
                insertdata.Parameters.AddWithValue("@website", website.Text);
                insertdata.Parameters.AddWithValue("@profile_info", info.Text);

                sqlConnection.Open();
                int a = insertdata.ExecuteNonQuery();

                if (a > 0)
                {
                    // Clear form
                    coname.Text = "";
                    email.Text = "";
                    pass.Text = "";
                    website.Text = "";


                    // Show success message and redirect
                    Response.Write("<script>alert('Registration successful.'); window.location='company_login.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Registration failed.');</script>");
                }
            }
        }
    }
}

