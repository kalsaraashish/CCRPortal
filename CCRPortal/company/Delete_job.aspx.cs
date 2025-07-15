using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
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
            int jobId;
            if (!int.TryParse(Request.QueryString["JobId"], out jobId))
            {
                Response.Write("<script>alert('Invalid Job ID');</script>");
                return;
            }
            using (SqlConnection con= new SqlConnection(conn))
            {
                using (SqlCommand delre=new SqlCommand("DELETE FROM Jobs WHERE JobID=@JobID",con))
                { 
                    delre.Parameters.AddWithValue("@JobID", jobId);
                    con.Open();
                    int rowsAffected = delre.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Job deleted successfully.'); window.location.href='manage-jobs.aspx'</script>");
                        //Response.Redirect("manage-jobs.aspx");
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