using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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
            }

            // Refresh the page/grid
            BindCompanyTable();  // or your method to re-bind data
        }

    }
}