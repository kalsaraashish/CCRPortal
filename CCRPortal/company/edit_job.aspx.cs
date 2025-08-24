using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal.company
{
    public partial class edit_job : System.Web.UI.Page
    {
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Code to initialize the page, e.g., load job details
                LoadJobDetails();
            }

        }

       
        private void LoadJobDetails()
        {
            int jobId;
            if (!int.TryParse(Request.QueryString["JobId"], out jobId))
            {
                Response.Write("<script>alert('Invalid Job ID');</script>");
                return;
            }
            using (SqlConnection con=new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Jobs WHERE JobId=@JobId", con))
                {
                    cmd.Parameters.AddWithValue("@JobId", jobId);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        // Assuming you have TextBoxes or other controls to display job details
                        txtTitle.Text = reader["Title"].ToString();
                        txtDescription.Text = reader["Description"].ToString();
                        txtEligibility.Text = reader["Eligibility"].ToString();
                        txtDeadline.Text = Convert.ToDateTime(reader["Deadline"]).ToString("yyyy-MM-dd");
                        job_type_drp.SelectedValue= reader["job_type"].ToString();
                        txtcity.Text= reader["job_city"].ToString();
                        ex_salary.Text= reader["ex_salary"].ToString();
                        ex.Text= reader["experience"].ToString();
                        // Load other fields as necessary
                    }
                    else
                    {
                        Response.Write("<script>alert('Job Data Not Found');</script>");
                    }
                }

            }
            
        }

        protected void sub_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using(SqlCommand cmd = new SqlCommand("UPDATE Jobs SET Title=@Title, Description=@Description, Eligibility=@Eligibility, Deadline=@Deadline, job_type=@JobType, job_city=@JobCity,ex_salary=@ex_salary,experience=@experience WHERE JobId=@JobId", con))
                {
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Eligibility", txtEligibility.Text.Trim());
                    cmd.Parameters.AddWithValue("@Deadline", Convert.ToDateTime(txtDeadline.Text));
                    cmd.Parameters.AddWithValue("@JobType", job_type_drp.SelectedValue);
                    cmd.Parameters.AddWithValue("@JobCity", txtcity.Text.Trim());
                    cmd.Parameters.AddWithValue("@ex_salary", ex_salary.Text.Trim());
                    cmd.Parameters.AddWithValue("@experience", ex.Text.Trim());

                    int jobId;
                    if (int.TryParse(Request.QueryString["JobId"], out jobId))
                    {
                        cmd.Parameters.AddWithValue("@JobId", jobId);
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Job updated successfully');window.location.href='manage-jobs.aspx';</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Error updating job');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Job ID');</script>");
                    }
                }
            }
        }
    }
}