using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices.ComTypes;

namespace HealthcareSystem
{
    public partial class Pharma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = (int)Session["user"];


            string text1 = t1.Text;
            string text2 = t2.Text;
            string text3 = t3.Text;
            string text4 = t4.Text;
            
            if (text2 != "" && !(DateTime.TryParse(text2, out DateTime result)))
            {
                Response.Redirect("Pharma.aspx");
            }
  
            SqlCommand view = new SqlCommand("UpdatePharProfile", conn);
            view.CommandType = CommandType.StoredProcedure;
            view.Parameters.Add(new SqlParameter("@pharmacistID", id));
            view.Parameters.Add(new SqlParameter("@pharmacyName", text1));
            view.Parameters.Add(new SqlParameter("@startDate", text2));
            view.Parameters.Add(new SqlParameter("@pharmacistName", text3));
            view.Parameters.Add(new SqlParameter("@password", text4));
            
            

            conn.Open();
            view.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Phar.aspx");


        }

        
    }
}