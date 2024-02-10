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
    public partial class Check : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int pharmacistID = Convert.ToInt32(Session["UserId"]);
            int doctorID = Convert.ToInt32(txtDoctorID.Text);
            int patientID = Convert.ToInt32(txtPatientID.Text);
            DateTime date = DateTime.ParseExact(txtDate.Text, "yyyy-MM-dd", null);


            string connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();

            using (SqlConnection conny = new SqlConnection(connStr))
            {
                conny.Open();

                using (SqlCommand command = new SqlCommand("CheckPres1", conny))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@PharmacistID", pharmacistID);
                    command.Parameters.AddWithValue("@DoctorID", doctorID);
                    command.Parameters.AddWithValue("@PatientID", patientID);
                    command.Parameters.AddWithValue("@Date", date);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {

                            GridView2.DataSource = reader;
                            GridView2.DataBind();
                        }
                        else
                        {

                            lblMessage.Text = "No prescriptions found.";
                        }


                    }


                }
            }
        }
    }
}