using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal
{
    public partial class User_Profile : System.Web.UI.Page
    {

        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            int studentId = Convert.ToInt32(Session["StudentID"]);
            

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM user_data WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", studentId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    email.Text = reader["Email"].ToString();
                    username.Text = reader["Username"].ToString();
                    skills.Text = reader["skills"].ToString();

                    string resumePath = reader["Resume"].ToString();
                    if (!string.IsNullOrEmpty(resumePath))
                    {
                        lnkResume.NavigateUrl = "../" + resumePath;
                    }
                    else
                    {
                        lnkResume.Text = "No Resume Uploaded";
                        lnkResume.Enabled = false;
                    }
                }
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
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
            
            
                int studentId = Convert.ToInt32(Session["StudentID"]);
               

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "UPDATE user_data SET Username=@username, Email=@Email,Skills=@skills, Resume = @Resume WHERE Id = @Id";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@username", username.Text);
                    cmd.Parameters.AddWithValue("@Email", email.Text);
                    cmd.Parameters.AddWithValue("@skills", skills.Text);
                    cmd.Parameters.AddWithValue("@Resume", resumeRelativePath);
                    cmd.Parameters.AddWithValue("@Id", studentId);
                    Session["username"] = username.Text;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                Response.Write("<script>alert('Data updated successfully!'); window.location.href=window.location.href</script>");

                LoadProfile(); // Refresh the resume link
            }
            else
            {
                Response.Write("<script>alert('Please select a resume file to upload.');</script>");
            }
        }
    }
}