using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Code to execute on initial page load
            }
        }

        string con = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        protected void sub_Click(object sender, EventArgs e)
        {
            string resumeRelativePath = null;

            if (resume.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(resume.FileName);
                if (fileExtension.ToLower() != ".pdf")
                {
                    Response.Write("<script>alert('Please upload a PDF file.');</script>");
                    return;
                }

                // Rename file with username
                string safeUsername = username.Text.Trim().Replace(" ", "_");
                string filename = safeUsername + fileExtension;
                string filePath = Server.MapPath("img/resume/") + filename;
                resume.SaveAs(filePath);
                resumeRelativePath = "img/resume/" + filename;
            }
            else
            {
                Response.Write("<script>alert('Please upload your resume.');</script>");
                return;
            }

            using (SqlConnection sqlConnection = new SqlConnection(con))
            {
                SqlCommand insertdata = new SqlCommand(
                    "INSERT INTO user_data (Username, Email, Password, Branch, Skills, Resume) " +
                    "VALUES (@username, @email, @pass, @branch, @skills, @resume)",
                    sqlConnection);

                insertdata.Parameters.AddWithValue("@username", username.Text);
                insertdata.Parameters.AddWithValue("@email", email.Text);
                insertdata.Parameters.AddWithValue("@pass", pass.Text);
                insertdata.Parameters.AddWithValue("@branch", DropDownList1.SelectedValue);
                insertdata.Parameters.AddWithValue("@skills", skills.Text);
                insertdata.Parameters.AddWithValue("@resume", resumeRelativePath);

                sqlConnection.Open();
                int a = insertdata.ExecuteNonQuery();

                if (a > 0)
                {
                    // Clear form
                    username.Text = "";
                    email.Text = "";
                    pass.Text = "";
                    skills.Text = "";
                    resume.Attributes.Clear();

                    // Show success message and redirect
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Successapply();", true);
                    Response.Write("<script>window.location='login.aspx';</script>");

                    
                }
                else
                {
                    //Response.Write("<script>alert('Registration failed.');</script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errormessage();", true);
                }
            }
        }
    }
}
