using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal
{
    public partial class job_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Binddata();
                
            }

        }
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        private void Binddata()
        {
            try
            {
                int jobId = 0;
                if (Request.QueryString["jobId"] != null)
                {
                    int.TryParse(Request.QueryString["jobId"], out jobId);
                }
                using (SqlConnection con = new SqlConnection(conn))
                {
                    con.Open();
                    using (SqlCommand da = new SqlCommand("SELECT * FROM jobs where jobID='"+jobId+"'", con))
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
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void applyjob_Click(object sender, EventArgs e)
        {
            
           
            int studentId = 0;

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();

                studentId = Convert.ToInt32( Session["StudentID"]);
            int jobId = Convert.ToInt32(Request.QueryString["JobID"]);

                // 1. Prevent duplicate application
                string checkQuery = @"SELECT COUNT(*) FROM Applications 
                              WHERE StudentID = @StudentID AND JobID = @JobID";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@StudentID", studentId);
                checkCmd.Parameters.AddWithValue("@JobID", jobId);

                int count = (int)checkCmd.ExecuteScalar();
                if (count > 0)
                { 
                    Response.Write("<script>alert('You have already applied for this job.');</script>");
                    return;
                }

                // 2. Insert new application (Status and AppliedDate auto-handled by defaults)
                string insertQuery = @"INSERT INTO Applications (StudentID, JobID) 
                               VALUES (@StudentID, @JobID)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@StudentID", studentId);
                insertCmd.Parameters.AddWithValue("@JobID", jobId);
                insertCmd.ExecuteNonQuery();
                Response.Write("<script>alert('Application submitted successfully!');</script>");


                // Optionally: Redirect to MyApplications.aspx
                // Response.Redirect("~/Student/MyApplications.aspx");
            }
        }
    }
}