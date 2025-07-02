using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal.admin
{
    public partial class AdminDashboard : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Company", con))
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
        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int companyId = Convert.ToInt32(((System.Web.UI.WebControls.Button)sender).CommandArgument);

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("UPDATE Company SET IsApproved = 1 WHERE Id = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", companyId);
                    cmd.ExecuteNonQuery();
                }
            }

            // Refresh data after approval
            BindCompanyTable();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Company approved successfully.');", true);
        }
    }
    }
