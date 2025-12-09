using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

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
                string jobImageName = null;

                // ===== Upload Image =====
                if (jobimg.HasFile)
                {
                    string fileExtension = Path.GetExtension(jobimg.FileName);

                    // Rename file -> CompanyName + Job Title
                    string safeFileName = Session["CompanyName"] + "_" + txtTitle.Text.Trim();

                    // Remove invalid characters from name
                    foreach (char c in Path.GetInvalidFileNameChars())
                    {
                        safeFileName = safeFileName.Replace(c, '_');
                    }

                    safeFileName = safeFileName.Replace(" ", "_");

                    string filename = safeFileName + fileExtension;

                    // Ensure directory exists
                    string folderPath = Server.MapPath("~/img/co_img/");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);

                    string uploadPath = Path.Combine(folderPath, filename);
                    jobimg.SaveAs(uploadPath);

                    // ❗ Only store file name in DB
                    jobImageName = filename;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please upload job image!');", true);
                    return;
                }

                con.Open();

                // ===== Check Duplicate Job =====
                using (SqlCommand checkCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Jobs WHERE CompanyID=@CompanyID AND Title=@Title", con))
                {
                    checkCmd.Parameters.AddWithValue("@CompanyID", Session["CompanyID"]);
                    checkCmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());

                    int exists = (int)checkCmd.ExecuteScalar();
                    if (exists > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error_exists();", true);
                        return;
                    }
                }

                // ===== Insert Job Details =====
                using (SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Jobs (CompanyID, company_name, Title, Description, Eligibility, Deadline, job_type, job_city, ex_salary, experience, jobimage) " +
                    "VALUES (@CompanyID, @company_name, @Title, @Description, @Eligibility, @Deadline, @job_type, @job_city, @ex_salary, @experience, @jobimage)", con))
                {
                    cmd.Parameters.AddWithValue("@CompanyID", Session["CompanyID"]);
                    cmd.Parameters.AddWithValue("@company_name", Session["CompanyName"]);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Eligibility", txtEligibility.Text.Trim());
                    cmd.Parameters.AddWithValue("@Deadline", txtDeadline.Text.Trim());
                    cmd.Parameters.AddWithValue("@job_type", job_time_drp.SelectedValue.Trim());
                    cmd.Parameters.AddWithValue("@job_city", txtcity.Text.Trim());
                    cmd.Parameters.AddWithValue("@ex_salary", ex_salary.Text.Trim());
                    cmd.Parameters.AddWithValue("@experience", ex.Text.Trim());
                    cmd.Parameters.AddWithValue("@jobimage", jobImageName);

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        // Clear fields
                        txtTitle.Text = "";
                        txtDescription.Text = "";
                        txtEligibility.Text = "";
                        txtDeadline.Text = "";
                        txtcity.Text = "";
                        ex_salary.Text = "";
                        ex.Text = "";

                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Post_success();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Post_error();", true);
                    }
                }

                con.Close();
            }
        }
    }
}
