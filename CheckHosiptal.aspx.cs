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
    public partial class CheckHosiptal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand check = new SqlCommand("checkHospitalsAndDoctors", conn);
            check.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = check.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {

                String hospital_name = rdr.GetString(rdr.GetOrdinal("hospital_name"));
                String doctor_name = rdr.GetString(rdr.GetOrdinal("doctor_name"));


                Label hospital_name_label = new Label();
                hospital_name_label.Text = "Hospital Name:  "+hospital_name + "<br>";
                form1.Controls.Add(hospital_name_label);

                Label doctor_name_label = new Label();
                doctor_name_label.Text = "Doctor Name:  "+doctor_name + "<br>"+ "<br>";
                form1.Controls.Add(doctor_name_label);


            }
        }

        
    }
}