using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal.company
{
    public partial class ViewApplicants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCompanyTable();
            }
        }
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        private void BindCompanyTable()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand(@"SELECT 
                    A.ApplicationID,
                    U.Username ,
                    U.Email,
                    U.Resume,
                    A.AppliedDate,
                    A.Status,
                    J.job_city AS city,
                    J.Title
                FROM Applications A
                INNER JOIN user_data U ON A.StudentID = U.Id
                INNER JOIN Jobs J ON A.JobID = J.JobID
                WHERE J.CompanyID = @CompanyID
                ORDER BY A.AppliedDate DESC", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        int CompanyID = Convert.ToInt32(Session["CompanyID"]);
                        cmd.Parameters.AddWithValue("@CompanyID",CompanyID);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptCompanies.DataSource = dt;
                        rptCompanies.DataBind();
                    }
                }
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string applicationId = btn.CommandArgument;
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("UPDATE Applications SET Status = 'Shortlisted' WHERE ApplicationID = @ApplicationID", con))
                {
                    cmd.Parameters.AddWithValue("@ApplicationID", applicationId);
                    cmd.ExecuteNonQuery();
                }

                // Send email to the student
                // ✅ Get Email + Name
                string email = "", name = "", jobTitle = "";
                string selectQuery = @"SELECT u.Email, u.username, j.Title 
                               FROM Applications a
                               INNER JOIN user_data u ON u.Id = a.StudentID
                               INNER JOIN Jobs j ON j.JobID = a.JobID
                               WHERE a.ApplicationID = @ApplicationID";

                SqlCommand selectCmd = new SqlCommand(selectQuery, con);
                selectCmd.Parameters.AddWithValue("@ApplicationID", applicationId);
                SqlDataReader reader = selectCmd.ExecuteReader();
                if (reader.Read())
                {
                    email = reader["Email"].ToString();
                    name = reader["username"].ToString();
                    jobTitle = reader["Title"].ToString();
                }
                reader.Close();

                // ✅ Send Email
                string body = $@"Hello {name},<br /><br />

                    🎉 Congratulations! Your application for the position <strong>{jobTitle}</strong> has been <strong>Shortlisted</strong> by the company.<br /><br />

                    Please wait for further updates from the recruiter.<br /><br />

                    Thank you for using Career Connect Recruitment Portal.<br /><br />

                    Best regards,<br />
                    Career Connect Recruitment Portal(CCRP) Team";

                MailMessage mail = new MailMessage("ashishkalsara223@gmail.com", email);
                mail.Subject = "Application Shortlisted - CareerConnect";
                mail.Body = body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential("ashishkalsara223@gmail.com", "ruzs fwdk toqb galv");
                //ruzs fwdk toqb galv
                smtp.EnableSsl = true;
                smtp.Send(mail);
            }

            // Refresh data after approval
            BindCompanyTable();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('approved successfully.');", true);
        }


        protected void btnReject_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int applicationId = Convert.ToInt32(btn.CommandArgument);

           
            using (SqlConnection con = new SqlConnection(conn))
            {
                string query = "UPDATE Applications SET Status = 'Rejected' WHERE ApplicationID = @ApplicationID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ApplicationID", applicationId);

                con.Open();
                cmd.ExecuteNonQuery();


                // ❌ Get student info
                string email = "", name = "", jobTitle = "";
                string selectQuery = @"SELECT u.Email, u.username, j.Title 
                               FROM Applications a
                               INNER JOIN user_data u ON u.Id = a.StudentID
                               INNER JOIN Jobs j ON j.JobID = a.JobID
                               WHERE a.ApplicationID = @ApplicationID";

                SqlCommand selectCmd = new SqlCommand(selectQuery, con);
                selectCmd.Parameters.AddWithValue("@ApplicationID", applicationId);
                SqlDataReader reader = selectCmd.ExecuteReader();
                if (reader.Read())
                {
                    email = reader["Email"].ToString();
                    name = reader["username"].ToString();
                    jobTitle = reader["Title"].ToString();
                }
                reader.Close();

                // ❌ Send rejection email
                string body = $@"Hello {name},<br /><br />

                    We regret to inform you that your application for the position <strong>{jobTitle}</strong> has not been shortlisted.<br /><br />

                    We appreciate your interest and encourage you to apply to other available opportunities.<br /><br />

                    Best wishes for your career ahead!<br /><br />

                    Sincerely,<br />
                    Career Connect Recruitment Portal(CCRP) Team";

                MailMessage mail = new MailMessage("ashishkalsara223@gmail.com", email);
                mail.Subject = "Application Status - Not Shortlisted";
                mail.Body = body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential("ashishkalsara223@gmail.com", "ruzs fwdk toqb galv ");
                //ruzs fwdk toqb galv
                smtp.EnableSsl = true;
                smtp.Send(mail);
            }

            // Refresh the page/grid
            BindCompanyTable();  // or your method to re-bind data
        }

    }
}