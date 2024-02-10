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
    public partial class view_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = (int)Session["user"];

            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewProfile = new SqlCommand("viewMyProfileDoc", conn);
            viewProfile.CommandType = CommandType.StoredProcedure;
            viewProfile.Parameters.Add(new SqlParameter("@DoctorId", id));



            conn.Open();
            SqlDataReader rdr = viewProfile.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                int doctor_id = id;
                int working_hours = rdr.GetInt32(rdr.GetOrdinal("working_hours"));
                int working_days = rdr.GetInt32(rdr.GetOrdinal("working_days"));
                String doctor_name = rdr.GetString(rdr.GetOrdinal("doctor_name"));
                String specialization = rdr.GetString(rdr.GetOrdinal("specialization"));
                String hospital_name = rdr.GetString(rdr.GetOrdinal("hospital_name"));
                String pass_word = rdr.GetString(rdr.GetOrdinal("pass_word"));

                Label doctor_id_label = new Label();
                doctor_id_label.Text = "Doctor ID:  "+doctor_id + "<br>";
                form1.Controls.Add(doctor_id_label);

                Label working_hours_label = new Label();
                working_hours_label.Text = "Working Days:  "+working_hours + "<br>";
                form1.Controls.Add(working_hours_label);

                Label working_days_label = new Label();
                working_days_label.Text = "Working Days:  "+working_days + "<br>";
                form1.Controls.Add(working_days_label);

                Label doctor_name_label = new Label();
                doctor_name_label.Text = "Doctor Name:  "+doctor_name + "<br>";
                form1.Controls.Add(doctor_name_label);

                Label specialization_label = new Label();
                specialization_label.Text = "Specialization:  " + specialization + "<br>";
                form1.Controls.Add(specialization_label);

                Label hospital_name_label = new Label();
                hospital_name_label.Text = "Hospital Name:  " + hospital_name + "<br>";
                form1.Controls.Add(hospital_name_label);

               
            }
        }
    }
}