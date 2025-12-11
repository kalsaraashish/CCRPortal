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
                sqlConnection.Open();

                // CHECK IF COMPANY NAME OR EMAIL ALREADY EXISTS
                SqlCommand checkCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Company WHERE company_name = @company_name OR Email = @Email",
                    sqlConnection);

                checkCmd.Parameters.AddWithValue("@company_name", coname.Text);
                checkCmd.Parameters.AddWithValue("@Email", email.Text);

                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                {
                    Response.Write("<script>alert('Company name or email already exists!');</script>");
                    return;  
                }

                SqlCommand insertdata = new SqlCommand(
                    "INSERT INTO Company (company_name, Email, password, website, profile_info) " +
                    "VALUES (@company_name, @Email, @pass, @website, @profile_info)",
                    sqlConnection);

                insertdata.Parameters.AddWithValue("@company_name", coname.Text);
                insertdata.Parameters.AddWithValue("@Email", email.Text);
                insertdata.Parameters.AddWithValue("@pass", pass.Text);
                insertdata.Parameters.AddWithValue("@website", website.Text);
                insertdata.Parameters.AddWithValue("@profile_info", info.Text);

                int a = insertdata.ExecuteNonQuery();

                if (a > 0)
                {
                    coname.Text = "";
                    email.Text = "";
                    pass.Text = "";
                    website.Text = "";

                    ScriptManager.RegisterStartupScript(this, GetType(), "SuccessRedirect", "Successapply();", true);
                    //Response.Write("<script>alert('Registration successful.'); window.location='company_login.aspx';</script>");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errormessage();", true);
                }
            }
        }

    }
}

