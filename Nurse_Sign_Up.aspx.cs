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
    public partial class Nurse_Sign_Up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int nurse_id = Int16.Parse(TextBox1.Text);
            String first_name = TextBox2.Text;
            String middle_name = TextBox3.Text;
            String last_name = TextBox4.Text;
            String nurse_shift = TextBox5.Text;
            String hospital_name = TextBox6.Text;
            String password = TextBox7.Text;


            SqlCommand Sign_Up = new SqlCommand("NurseRegister", conn);
            Sign_Up.CommandType = CommandType.StoredProcedure;
            Sign_Up.Parameters.Add(new SqlParameter("@nurse_id", nurse_id));
            Sign_Up.Parameters.Add(new SqlParameter("@first_name", first_name));
            Sign_Up.Parameters.Add(new SqlParameter("@middle_name", middle_name));
            Sign_Up.Parameters.Add(new SqlParameter("@last_name", last_name));
            Sign_Up.Parameters.Add(new SqlParameter("@nurst_shift", nurse_shift));
            Sign_Up.Parameters.Add(new SqlParameter("@hospital_name", hospital_name));
            Sign_Up.Parameters.Add(new SqlParameter("@password", password));


            conn.Open();
            Sign_Up.ExecuteNonQuery();
            conn.Close();
        }
    }
}