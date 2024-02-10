using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Remoting.Messaging;
using System.Threading;

namespace HealthcareSystem
{
    public partial class Pharmacist_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                //lblMessage.Text = "User ID not found in session.";
            }
            else
            {
                int userId = (int)Session["user"];
                
                String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand PProfile = new SqlCommand("PHarmaviewMyProfile", conn);
                PProfile.CommandType = CommandType.StoredProcedure;
                PProfile.Parameters.Add(new SqlParameter("@ph_id", userId));

                conn.Open();
                SqlDataReader reader = PProfile.ExecuteReader(CommandBehavior.CloseConnection);
                int id = (int)Session["user"];

                while (reader.Read())
                {
                    int pharmacist_id = userId;
                    string pharmacyName = reader.GetString(reader.GetOrdinal("pharmacy_name"));
                    DateTime startDate = reader.GetDateTime(reader.GetOrdinal("startDate"));
                    string pharmacistName = reader.GetString(reader.GetOrdinal("pharmacist_name"));
                    int yearsOfExperience = reader.GetInt32(reader.GetOrdinal("years_exp"));

                    Label patient_id_label = new Label();
                    patient_id_label.Text = pharmacist_id + "<br>";
                    form1.Controls.Add(patient_id_label);

                    Label patient_name_label = new Label();
                    patient_name_label.Text = pharmacyName + "<br>";
                    form1.Controls.Add(patient_name_label);

                    Label ehr_label = new Label();
                    ehr_label.Text = startDate + "<br>";
                    form1.Controls.Add(ehr_label);

                    Label contact_label = new Label();
                    contact_label.Text = pharmacistName + "<br>";
                    form1.Controls.Add(contact_label);

                    Label allergies_label = new Label();
                    allergies_label.Text = yearsOfExperience + "<br>";
                    form1.Controls.Add(patient_name_label);

                
                }
            }
        }
    }
}