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
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM user_data", con))
                {
                   
                    int usercount = (int)cmd.ExecuteScalar();
                    tuser.InnerText = usercount.ToString();

                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM jobs", con))
                {
                    
                    int usercount = (int)cmd.ExecuteScalar();
                    tjob.InnerText = usercount.ToString();

                }
            }


        }

        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";
        private void BindCompanyTable()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Company where isApproved=0", con))
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
                using (SqlCommand user_data = new SqlCommand("select * from user_data where isApproved=0", con))
                {
                    using (SqlDataAdapter da=new SqlDataAdapter(user_data))
                    { 
                        DataTable tb = new DataTable();
                        da.Fill(tb);
                        rptuser.DataSource = tb;
                        rptuser.DataBind();
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
                using (SqlCommand cmd = new SqlCommand("UPDATE Company SET IsApproved = 1 WHERE CompanyId = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", companyId);
                    cmd.ExecuteNonQuery();
                }
            }

            // Refresh data after approval
            BindCompanyTable();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "cop_successful();", true);
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Company approved successfully.');", true);
        }

        protected void btnApprove_Click1(object sender, EventArgs e)
        {
            int user_id = Convert.ToInt32(((System.Web.UI.WebControls.Button)sender).CommandArgument);

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("UPDATE user_data SET IsApproved = 1 WHERE id = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", user_id);
                    cmd.ExecuteNonQuery();
                }
            }

            // Refresh data after approval
            BindStudentData();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "user_successful();", true);
            
        }
    }
    }
