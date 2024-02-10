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
    public partial class MakeAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            int doctor_id = Int16.Parse(TextBox1.Text);
            int id = (int)Session["user"];



            SqlCommand make = new SqlCommand("patientsMakeAppointment", conn);
            make.CommandType = CommandType.StoredProcedure;
            make.Parameters.Add(new SqlParameter("@doctor_id", doctor_id));
            make.Parameters.Add(new SqlParameter("@patient_id", id));

            SqlParameter res = make.Parameters.Add("@res", SqlDbType.Int);

            res.Direction = ParameterDirection.Output;

            conn.Open();
            make.ExecuteNonQuery();
            conn.Close();
            //SqlDataReader rdr = check.ExecuteReader(CommandBehavior.CloseConnection);
            //while (rdr.Read()){

            if(res.Value.ToString() == "1"){
                
                Response.Redirect("Patient.aspx");
            }
            else
            {
                Response.Redirect("MakeAppointment.aspx");
            }


            //}
        }
    }
}