using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal.admin
{
    public partial class Delete_Company : System.Web.UI.Page
    {
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            int cid;
            if (!int.TryParse(Request.QueryString["cid"], out cid))
            {
                Response.Write("<script>alert('Invalid company ID');</script>");
                return;
            }
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                

                using (SqlCommand delApp = new SqlCommand("DELETE FROM Applications WHERE JobID IN (SELECT JobID FROM jobs WHERE CompanyId=@CompanyId)", con))
                {
                    delApp.Parameters.AddWithValue("@CompanyId", cid);
                    delApp.ExecuteNonQuery();
                }
                using (SqlCommand deljob = new SqlCommand("DELETE FROM jobs WHERE CompanyId=@CompanyId", con))
                {
                    deljob.Parameters.AddWithValue("@CompanyId", cid);

                    deljob.ExecuteNonQuery();
                }

                using (SqlCommand delre = new SqlCommand("DELETE FROM Company WHERE CompanyId=@CompanyId", con))
                {
                    delre.Parameters.AddWithValue("@CompanyId", cid);

                    int rowsAffected = delre.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Company deleted successfully.'); window.location.href='Manage_company.aspx'</script>");
                        //Response.Redirect("manage-jobs.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Error deleting Company. Please try again.');</script>");
                    }
                }
            }

        }
    }
}