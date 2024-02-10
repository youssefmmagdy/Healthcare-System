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
    public partial class Pharmacist_Sign_Up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);



            int ph_id = Int16.Parse(TextBox1.Text);
            String pharmacy_name = TextBox2.Text;
            String startDate = TextBox3.Text;
            String password = TextBox4.Text;
            String pharmacist_name = TextBox5.Text;

            SqlCommand Sign_Up = new SqlCommand("PharmacistRegister", conn);
            Sign_Up.CommandType = CommandType.StoredProcedure;
            Sign_Up.Parameters.Add(new SqlParameter("@ph_id", ph_id));
            Sign_Up.Parameters.Add(new SqlParameter("@pharmacy_name", pharmacy_name));
            Sign_Up.Parameters.Add(new SqlParameter("@startDate", startDate));
            Sign_Up.Parameters.Add(new SqlParameter("@password", password));
            Sign_Up.Parameters.Add(new SqlParameter("@pharmacist_name", pharmacist_name));

            conn.Open();
            Sign_Up.ExecuteNonQuery();
            conn.Close();
        }
    }
}