using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthcareSystem
{
    public partial class Connector2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetId(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id2 = Int16.Parse(Treatment_id.Text);

            Session["Treatment_id"] = id2;

            SqlCommand TID = new SqlCommand("AdminViewCover", conn);
            TID.CommandType = CommandType.StoredProcedure;
            TID.Parameters.Add(new SqlParameter("@TreatmentID", id2));

            SqlParameter res = TID.Parameters.Add("@Covered", SqlDbType.Int);

            res.Direction = ParameterDirection.Output;

            conn.Open();
            SqlDataReader rdr = TID.ExecuteReader(CommandBehavior.CloseConnection);




            if (res.Value.ToString() == "1")
            {
                Label covered_label = new Label();
                covered_label.Text = "<br>"+ "<br>" + "The Insurance is covered by the Insurance Company" + "<br>";
                form1.Controls.Add(covered_label);
            }
            else
            {
                Label covered_label = new Label();
                covered_label.Text = "The Insurance is covered by the Patient" + "<br>";
                form1.Controls.Add(covered_label);
            }
        }
    }
}