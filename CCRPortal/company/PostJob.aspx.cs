using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace CCRPortal.company
{
    public partial class PostJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        protected void sub_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                string resumeRelativePath = null;
                if (jobimg.HasFile)
                {
                    string fileExtension = System.IO.Path.GetExtension(jobimg.FileName);
                   
                    // Rename file with username
                    string safeUsername = Session["CompanyName"]+txtTitle.Text.Trim().Replace(" ", "_");
                    string filename = safeUsername + fileExtension;
                    string filePath = Server.MapPath("../img/co_img/") + filename;
                    jobimg.SaveAs(filePath);
                    resumeRelativePath = "../img/co_img/" + filename;
                }
                else
                {
                    Response.Write("<script>alert('Please upload your image.');</script>");
                    return;
                }

                con.Open();

                //  Check if job already exists
                using (SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Jobs WHERE CompanyID = @CompanyID AND Title = @Title", con))
                {
                    checkCmd.Parameters.AddWithValue("@CompanyID", Session["CompanyID"]);
                    checkCmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());

                    int count = (int)checkCmd.ExecuteScalar();
                    if (count > 0)
                    {
                        Response.Write("<script>alert('Job with this title already exists for your company.');</script>");
                        return;
                    }
                }

                using (SqlCommand cmd = new SqlCommand("INSERT INTO Jobs (CompanyID,company_name, Title, Description, Eligibility, Deadline,job_type,job_city, ex_salary,experience, jobimage) VALUES (@CompanyID,@company_name, @Title, @Description, @Eligibility, @Deadline,@job_type,@job_city,@ex_salary,@experience, @jobimage)", con))
                {
                    cmd.Parameters.AddWithValue("@companyID", Session["CompanyID"]);
                    cmd.Parameters.AddWithValue("@Company_name", Session["CompanyName"]);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Eligibility", txtEligibility.Text.Trim());
                    cmd.Parameters.AddWithValue("@Deadline", txtDeadline.Text.Trim());
                    cmd.Parameters.AddWithValue("@job_type", job_time_drp.SelectedValue.Trim());
                    cmd.Parameters.AddWithValue("@job_city", txtcity.Text.Trim());
                    cmd.Parameters.AddWithValue("@ex_salary", ex_salary.Text.Trim());
                    cmd.Parameters.AddWithValue("@experience", ex.Text.Trim());
                    cmd.Parameters.AddWithValue("@jobimage", resumeRelativePath);
                    
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        txtTitle.Text = string.Empty;
                        txtDescription.Text = string.Empty;
                        txtEligibility.Text = string.Empty;
                        txtDeadline.Text = string.Empty;
                        txtcity.Text = string.Empty;
                        ex_salary.Text = string.Empty;
                        ex.Text = string.Empty;
                        Response.Write("<script>alert('Job posted successfully');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Error posting job');</script>");
                    }
                }
            }
        }
    }
}