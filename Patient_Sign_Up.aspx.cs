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
    public partial class Patient_Sign_Up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int patient_id = Int16.Parse(TextBox1.Text);
            String patient_name = TextBox2.Text;
            String ehr = TextBox3.Text;
            String contact = TextBox4.Text;
            String allergies = TextBox5.Text;
            String diseases = TextBox6.Text;
            String vaccines = TextBox7.Text;
            String drugs = TextBox8.Text;
            String exam_result = TextBox9.Text;
            String password = TextBox10.Text;
            String ins_company = TextBox11.Text;
            String nurse_id1 = TextBox12.Text;


            SqlCommand Sign_Up = new SqlCommand("PatientRegister", conn);
            Sign_Up.CommandType = CommandType.StoredProcedure;
            Sign_Up.Parameters.Add(new SqlParameter("@patient_id", patient_id));
            Sign_Up.Parameters.Add(new SqlParameter("@patient_name", patient_name));
            Sign_Up.Parameters.Add(new SqlParameter("@ehr", ehr));
            Sign_Up.Parameters.Add(new SqlParameter("@contact", contact));
            Sign_Up.Parameters.Add(new SqlParameter("@allergies", allergies));
            Sign_Up.Parameters.Add(new SqlParameter("@diseases", diseases));
            Sign_Up.Parameters.Add(new SqlParameter("@vaccines", vaccines));
            Sign_Up.Parameters.Add(new SqlParameter("@drugs", drugs));
            Sign_Up.Parameters.Add(new SqlParameter("@exam_result", exam_result));
            Sign_Up.Parameters.Add(new SqlParameter("@password", password));
            Sign_Up.Parameters.Add(new SqlParameter("@ins_company", ins_company));
            Sign_Up.Parameters.Add(new SqlParameter("@nurse_id1", nurse_id1));


            conn.Open();
            Sign_Up.ExecuteNonQuery();
            conn.Close();
        }
    }
}