using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthcareSystem
{
    public partial class Nurse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PatientList(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("Patient_List.aspx");
        }
        protected void PatientProfile(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("Patient_profile.aspx");
        }
        protected void DoctorsInfo(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("Doctors_Info.aspx");
        }
        protected void EmergencyMedical_Service_providers_manage_which_Call_Centers(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("Emergency_Medical_Service_providers_manage_which_Call_Centers.aspx");
        }
        protected void TreatmentCovered_by_Insurance(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("Connector2.aspx");
        }
    }
}