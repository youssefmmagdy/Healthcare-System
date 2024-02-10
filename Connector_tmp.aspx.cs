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
    public partial class Connector_tmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void connectorrr(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int doctor_id = (int)Session["user"];
            int patient_id = Int16.Parse(password.Text);
            int labtest_id = Int16.Parse(TextBox1.Text);

            SqlCommand loginproc = new SqlCommand("DoctorReqLab", conn);
            loginproc.CommandType = CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@DoctorID", doctor_id));
            loginproc.Parameters.Add(new SqlParameter("@PatientID", patient_id));
            loginproc.Parameters.Add(new SqlParameter("@LabtestID", labtest_id));


            SqlParameter res = loginproc.Parameters.Add("@res", SqlDbType.Int);

            res.Direction = ParameterDirection.Output;

            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();

            if (res.Value.ToString() == "1")
            {
                Response.Write("Completed Successfully");
            }
            else Response.Redirect("Connector_tmp.aspx");



        }
    }
}