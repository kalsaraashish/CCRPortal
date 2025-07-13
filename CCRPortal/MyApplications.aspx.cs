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
    public partial class MyApplications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadApplications(); 
            }
        }

        private void LoadApplications()
        {
            string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT J.Title, J.Company_Name AS CompanyName, J.job_city AS Location, A.AppliedDate, A.Status
            FROM Applications A
            INNER JOIN Jobs J ON A.JobID = J.JobID
            WHERE A.StudentID = @StudentID
            ORDER BY A.AppliedDate DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", Session["StudentID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvApplications.DataSource = dt;
                gvApplications.DataBind();
            }
        }
    }
}