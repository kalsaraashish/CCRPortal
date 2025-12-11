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
            
        }

        string con = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        protected void sub_Click(object sender, EventArgs e)
        {
            string resumeRelativePath = null;

            if (!resume.HasFile)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Please upload your resume.');", true);
                return;
            }

            string fileExtension = System.IO.Path.GetExtension(resume.FileName).ToLower();
            if (fileExtension != ".pdf")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Please upload a PDF file.');", true);
                return;
            }

            string safeUsername = username.Text.Trim().Replace(" ", "_");
            string filename = safeUsername + fileExtension;
            string filePath = Server.MapPath("img/resume/") + filename;
            resume.SaveAs(filePath);

            resumeRelativePath = "img/resume/" + filename;


            using (SqlConnection sqlConnection = new SqlConnection(con))
            {
                sqlConnection.Open();

                SqlCommand checkEmail = new SqlCommand(
                    "SELECT COUNT(*) FROM user_data WHERE Email = @Email",
                    sqlConnection);

                checkEmail.Parameters.AddWithValue("@Email", email.Text.Trim());

                int emailCount = (int)checkEmail.ExecuteScalar();

                if (emailCount > 0)
                {
                    ScriptManager.RegisterStartupScript(
                        this, GetType(), "Alert",
                        "alert('This email is already registered!');",
                        true);

                    return; 
                }

                SqlCommand insertdata = new SqlCommand(
                    "INSERT INTO user_data (Username, Email, Password, Branch, Skills, Resume) " +
                    "VALUES (@username, @Email, @pass, @branch, @skills, @resume)",
                    sqlConnection);

                insertdata.Parameters.AddWithValue("@username", username.Text.Trim());
                insertdata.Parameters.AddWithValue("@Email", email.Text.Trim());
                insertdata.Parameters.AddWithValue("@pass", pass.Text);
                insertdata.Parameters.AddWithValue("@branch", DropDownList1.SelectedValue);
                insertdata.Parameters.AddWithValue("@skills", skills.Text.Trim());
                insertdata.Parameters.AddWithValue("@resume", resumeRelativePath);

                int a = insertdata.ExecuteNonQuery();


                if (a > 0)
                {
                    // Clear form fields
                    username.Text = "";
                    email.Text = "";
                    pass.Text = "";
                    skills.Text = "";
                    resume.Attributes.Clear();

                    // SUCCESS POPUP + REDIRECT (after 1.5 sec)
                    string script = "Successapply();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "SuccessRedirect", script, true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errormessage();", true);
                }
            }
        }

    }
}
