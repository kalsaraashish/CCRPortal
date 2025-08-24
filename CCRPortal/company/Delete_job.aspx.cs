using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal.company
{
    public partial class Delete_job : System.Web.UI.Page
    {
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Session["CompanyName"] != null)
                { 
                    Response.Redirect("../homepage.aspx");
                }
            }
            int jobId;
            if (!int.TryParse(Request.QueryString["JobId"], out jobId))
            {
                //Response.Write("<script>alert('Invalid Job ID');</script>");
                Response.Redirect("manage-jobs.aspx");
                //return;
            }
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open(); // Open the connection
                using (SqlCommand delApp = new SqlCommand("DELETE FROM Applications WHERE JobID=@JobID", con))
                {
                    delApp.Parameters.AddWithValue("@JobID", jobId);
                    delApp.ExecuteNonQuery();
                }
                using (SqlCommand delre = new SqlCommand("DELETE FROM Jobs WHERE JobID=@JobID", con))
                {
                    delre.Parameters.AddWithValue("@JobID", jobId);
                    int rowsAffected = delre.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Job deleted successfully.'); window.location.href='manage-jobs.aspx'</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Error deleting job. Please try again.');</script>");
                    }
                }
            }

        }
    }
}