using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;   // ✅ ADDED

namespace CCRPortal.admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCompanyTable();
                BindCountdata();
                BindStudentData();
            }
        }

        private void BindCountdata()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Company", con))
                {
                    con.Open();
                    int cocount = (int)cmd.ExecuteScalar();
                    countcom.InnerText = cocount.ToString();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Applications", con))
                {
                    int appcount = (int)cmd.ExecuteScalar();
                    totalapplication.InnerText = appcount.ToString();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM user_data where usertype='user'", con))
                {
                    int usercount = (int)cmd.ExecuteScalar();
                    tuser.InnerText = usercount.ToString();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM jobs", con))
                {
                    int jobcount = (int)cmd.ExecuteScalar();
                    tjob.InnerText = jobcount.ToString();
                }
            }
        }

        private void BindCompanyTable()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Company WHERE IsApproved = 0", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptCompanies.DataSource = dt;
                        rptCompanies.DataBind();
                    }
                }
            }
        }

        private void BindStudentData()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand user_data = new SqlCommand("SELECT * FROM user_data WHERE IsApproved = 0", con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(user_data))
                    {
                        DataTable tb = new DataTable();
                        da.Fill(tb);
                        rptuser.DataSource = tb;
                        rptuser.DataBind();
                    }
                }
            }
        }

        // Common method to send email (kept synchronous)
        private void SendEmail(string toEmail, string subject, string body)
        {
            using (MailMessage mm = new MailMessage())
            {
                mm.From = new MailAddress("ashishkalsara223@gmail.com", "CCR Portal"); // TODO: change this
                mm.To.Add(toEmail);
                mm.Subject = subject;
                mm.Body = body;
                mm.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient())
                {
                    smtp.Host = "smtp.gmail.com";    // for Gmail
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new NetworkCredential("ashishkalsara223@gmail.com", "ruzs fwdk toqb galv"); // TODO: change this

                    smtp.Send(mm);
                }
            }
        }

        // Approve company
        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int companyId = Convert.ToInt32(((Button)sender).CommandArgument);

            string email = string.Empty;
            string companyName = string.Empty;

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();

                // 1) Approve company
                using (SqlCommand cmd = new SqlCommand("UPDATE Company SET IsApproved = 1 WHERE CompanyId = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", companyId);
                    cmd.ExecuteNonQuery();
                }

                // 2) Get company email + name
                using (SqlCommand cmd2 = new SqlCommand("SELECT email, company_name FROM Company WHERE CompanyId = @Id", con))
                {
                    cmd2.Parameters.AddWithValue("@Id", companyId);
                    using (SqlDataReader dr = cmd2.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            email = dr["email"].ToString();
                            companyName = dr["company_name"].ToString();
                        }
                    }
                }
            }

            // 3) Send email in BACKGROUND
            if (!string.IsNullOrWhiteSpace(email))
            {
                string subject = "Your company account has been approved - CCR Portal";
                string body = $"Hello {companyName},<br/><br/>" +
                              "Your company account on <b>CCR Portal</b> has been approved by the admin.<br/>" +
                              "You can now login and post jobs.<br/><br/>" +
                              "Regards,<br/>CCR Portal Team";

                Task.Run(() =>
                {
                    try
                    {
                        SendEmail(email, subject, body);
                    }
                    catch (Exception ex)
                    {
                        // log ex if needed
                    }
                });
            }

            // Refresh data after approval
            BindCompanyTable();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "cop_successful();", true);
        }

        // Approve student
        protected void btnApprove_Click1(object sender, EventArgs e)
        {
            int user_id = Convert.ToInt32(((Button)sender).CommandArgument);

            string email = string.Empty;
            string username = string.Empty;

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();

                // 1) Approve student
                using (SqlCommand cmd = new SqlCommand("UPDATE user_data SET IsApproved = 1 WHERE id = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", user_id);
                    cmd.ExecuteNonQuery();
                }

                // 2) Get user email + username
                using (SqlCommand cmd2 = new SqlCommand("SELECT Email, username FROM user_data WHERE id = @Id", con))
                {
                    cmd2.Parameters.AddWithValue("@Id", user_id);
                    using (SqlDataReader dr = cmd2.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            email = dr["Email"].ToString();
                            username = dr["username"].ToString();
                        }
                    }
                }
            }

            // 3) Send email in BACKGROUND
            if (!string.IsNullOrWhiteSpace(email))
            {
                string subject = "Your account has been approved - CCR Portal";
                string body = $"Hello {username},<br/><br/>" +
                              "Your account on <b>CCR Portal</b> has been approved by the admin.<br/>" +
                              "You can now login and apply for jobs.<br/><br/>" +
                              "Best of luck!<br/>CCR Portal Team";

                Task.Run(() =>
                {
                    try
                    {
                        SendEmail(email, subject, body);
                    }
                    catch (Exception ex)
                    {
                        // log ex if needed
                    }
                });
            }

            // Refresh data after approval
            BindStudentData();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "user_successful();", true);
        }
    }
}
