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
    public partial class Manage_company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bindcompanydata();
            }
        }

        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\OneDrive\Desktop\CCRPortal\CCRPortal\App_Data\CCRPortal.mdf;Integrated Security=True";

        private void Bindcompanydata()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Company ", con))
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

        protected void btnExportJobs_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                SqlCommand cmd = new SqlCommand("select CompanyID,company_name,email,website,profile_info from Company", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    string filename = "companydata.xls";

                    Response.Clear();
                    Response.Buffer = true;
                    Response.AddHeader("content-disposition", "attachment;filename=" + filename);
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.ms-excel";

                    System.Text.StringBuilder sb = new System.Text.StringBuilder();

                    // Column headers
                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        sb.Append(dt.Columns[i].ColumnName + "\t");
                    }
                    sb.Append("\n");

                    // Data rows
                    foreach (DataRow row in dt.Rows)
                    {
                        for (int i = 0; i < dt.Columns.Count; i++)
                        {
                            sb.Append(row[i].ToString().Replace("\t", " ") + "\t");
                        }
                        sb.Append("\n");
                    }

                    Response.Output.Write(sb.ToString());
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
}