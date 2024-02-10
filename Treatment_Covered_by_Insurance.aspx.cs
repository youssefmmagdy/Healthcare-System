using Microsoft.SqlServer.Server;
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
    public partial class Treatment_Covered_by_Insurance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id2 = (int)Session["Treatment_id"];

            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand TID = new SqlCommand("AdminViewCover", conn);
            TID.CommandType = CommandType.StoredProcedure;
            TID.Parameters.Add(new SqlParameter("@TreatmentID", id2));



            conn.Open();
            SqlDataReader rdr = TID.ExecuteReader(CommandBehavior.CloseConnection);


            while (rdr.Read())
            {
                Boolean covered = rdr.GetBoolean(rdr.GetOrdinal("covered"));

                if (covered.ToString() == "True")
                {
                    Label covered_label = new Label();
                    covered_label.Text = "The Insurance is covered by the Insurance Company" + "<br>";
                    form1.Controls.Add(covered_label);
                }
                else
                {
                    Label covered_label = new Label();
                    covered_label.Text = "The Insurance is covered by the patient" + "<br>";
                    form1.Controls.Add(covered_label);
                }

            }
        }
    }
}