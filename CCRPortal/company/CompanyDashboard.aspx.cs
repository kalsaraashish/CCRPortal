using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal.company
{
    public partial class CompanyDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                BindCountdata();
            }
        }
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        private void BindCountdata()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(@"SELECT COUNT(*) AS TotalApplications
                        FROM Applications A
                        JOIN Jobs J ON A.JobID = J.JobID
                        JOIN Company C ON J.CompanyID = C.CompanyID
                        WHERE C.company_name = @CompanyName;
                        ", con))
                {
                    cmd.Parameters.AddWithValue("@CompanyName", Session["CompanyName"]);
                    int appcount = (int)cmd.ExecuteScalar();
                    totalapplication.InnerText = appcount.ToString();

                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM user_data", con))
                {

                    int usercount = (int)cmd.ExecuteScalar();
                    tuser.InnerText = usercount.ToString();

                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM jobs WHERE CompanyID=@coid ", con))
                {
                    cmd.Parameters.AddWithValue("@coid", Session["CompanyID"]);

                    int usercount = (int)cmd.ExecuteScalar();
                    tjob.InnerText = usercount.ToString();

                }
            }


        }
    }
}