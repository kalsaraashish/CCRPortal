using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal.admin
{
    public partial class Delete_User : System.Web.UI.Page
    {
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            int userid;
            if (!int.TryParse(Request.QueryString["userid"], out userid))
            {
                Response.Write("<script>alert('Invalid Job ID');</script>");
                return;
            }
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand delapp = new SqlCommand("DELETE FROM Applications WHERE StudentID=@userid", con))
                {
                    con.Open();
                    delapp.Parameters.AddWithValue("@userid", userid);
                    delapp.ExecuteNonQuery();
                    using (SqlCommand delre = new SqlCommand("DELETE FROM user_data WHERE id=@userid", con))
                    {
                        delre.Parameters.AddWithValue("@userid", userid);
                        
                        int rowsAffected = delre.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('user deleted successfully.'); window.location.href='Manage_user.aspx'</script>");
                            //Response.Redirect("manage-jobs.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Error deleting user. Please try again.');</script>");
                        }
                    }
                }
            }

        }
    }
}