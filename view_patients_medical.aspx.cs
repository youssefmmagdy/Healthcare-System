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
    public partial class view_patients_medical : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id1 = (int)Session["patient_input"];

            String connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand DocView = new SqlCommand("DocViewHis", conn);
            DocView.CommandType = CommandType.StoredProcedure;
            DocView.Parameters.Add(new SqlParameter("@PatientID", id1));

            conn.Open();
            SqlDataReader rdr = DocView.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                int patient_id = id1;
                String patient_name = rdr.GetString(rdr.GetOrdinal("patient_name"));
                String ehr = rdr.GetString(rdr.GetOrdinal("ehr"));
                String contact = rdr.GetString(rdr.GetOrdinal("contact"));
                String allergies = rdr.GetString(rdr.GetOrdinal("allergies"));
                String diseases = rdr.GetString(rdr.GetOrdinal("diseases"));
                String vaccines = rdr.GetString(rdr.GetOrdinal("vaccines"));
                String drugs = rdr.GetString(rdr.GetOrdinal("drugs"));
                String exam_result = rdr.GetString(rdr.GetOrdinal("exam_result"));
                String pass_word = rdr.GetString(rdr.GetOrdinal("pass_word"));
                String ins_company = rdr.GetString(rdr.GetOrdinal("ins_company"));
                int nurse_id = rdr.GetInt32(rdr.GetOrdinal("nurse_id"));

                Label patient_id_label = new Label();
                patient_id_label.Text = "Patient ID:  "+patient_id + "<br>";
                form1.Controls.Add(patient_id_label);

                Label patient_name_label = new Label();
                patient_name_label.Text = "Patient Name:  "+patient_name + "<br>";
                form1.Controls.Add(patient_name_label);

                Label ehr_label = new Label();
                ehr_label.Text = "Electronic Health Record:  "+ehr + "<br>";
                form1.Controls.Add(ehr_label);

                Label contact_label = new Label();
                contact_label.Text = "Emergency Contact Information:  "+contact + "<br>";
                form1.Controls.Add(contact_label);

                Label allergies_label = new Label();
                allergies_label.Text = "Allergies:  "+allergies + "<br>";
                form1.Controls.Add(patient_name_label);

                Label diseases_label = new Label();
                diseases_label.Text = "Chronic Diseases:  "+diseases + "<br>";
                form1.Controls.Add(diseases_label);

                Label vaccines_label = new Label();
                vaccines_label.Text = "Vaccines:  "+vaccines + "<br>";
                form1.Controls.Add(vaccines_label);

                Label drugs_label = new Label();
                drugs_label.Text = "Prescribes Drugs:  "+drugs + "<br>";
                form1.Controls.Add(drugs_label);

                Label exam_result_label = new Label();
                exam_result_label.Text = "Test and Examination Results:  " + exam_result + "<br>";
                form1.Controls.Add(exam_result_label);

                //Label pass_word_label = new Label();
                //pass_word_label.Text = pass_word + "<br>";
                //form1.Controls.Add(pass_word_label);

                Label ins_company_label = new Label();
                ins_company_label.Text = "Insurance Company:  "+ins_company + "<br>";
                form1.Controls.Add(ins_company_label);

                Label nurse_id_label = new Label();
                nurse_id_label.Text = "Nurse ID:  "+nurse_id + "<br>";
                form1.Controls.Add(nurse_id_label);
            }
        }
    }
}