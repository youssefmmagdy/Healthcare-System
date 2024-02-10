using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthcareSystem
{
    public partial class sayadla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    using (SqlCommand cmd2 = new SqlCommand("AdminViewPharmacists", conn))
                    {
                        cmd2.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = cmd2.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                GridView1.DataSource = reader;
                                GridView1.DataBind();
                            }
                            else
                            {
                                lblMessage.Text = "No Sayadla found.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}