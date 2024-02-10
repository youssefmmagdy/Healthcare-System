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
    public partial class write_prescription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void writesPreesc(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int doctor_id = (int)Session["user"];
            int patient_id = Int16.Parse(password.Text);
            String date = TextBox1.Text;

            if(!(DateTime.TryParse(date, out DateTime result)))
                Response.Redirect("write_prescription.aspx");

            SqlCommand loginproc = new SqlCommand("DocWritePres", conn);
            loginproc.CommandType = CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@DoctorID", doctor_id));
            loginproc.Parameters.Add(new SqlParameter("@PatientID", patient_id));
            loginproc.Parameters.Add(new SqlParameter("@Date", date));


            SqlParameter res = loginproc.Parameters.Add("@res", SqlDbType.Int);

            res.Direction = ParameterDirection.Output;

            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();

            if (res.Value.ToString() == "1")
            {
                Response.Write("Completed Successfully");
            }
            else Response.Redirect("write_prescription.aspx");
        }
    }
}