using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCRPortal
{
    public partial class job_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Binddata();
            }

        }
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        private void Binddata()
        {
            try
            {
                int jobId = 0;
                if (Request.QueryString["jobId"] != null)
                {
                    int.TryParse(Request.QueryString["jobId"], out jobId);
                }
                using (SqlConnection con = new SqlConnection(conn))
                {
                    con.Open();
                    using (SqlCommand da = new SqlCommand("SELECT * FROM jobs where jobID='"+jobId+"'", con))
                    {
                        SqlDataAdapter ad = new SqlDataAdapter(da);
                        DataTable dt = new DataTable();
                        ad.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rp1.DataSource = dt;
                            rp1.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('No Data Found');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

    }
}