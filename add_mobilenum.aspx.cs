using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.SqlServer.Server;
using System.Web.Configuration;
using System.Xml.Linq;

namespace HealthcareSystem
{
    public partial class add_mobilenum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void enterr(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = (int)Session["user"];
            string number = num.Text;

            SqlCommand check = new SqlCommand("addMobile", conn);
            check.CommandType = CommandType.StoredProcedure;
            check.Parameters.Add(new SqlParameter("@ID", id));
            check.Parameters.Add(new SqlParameter("@mobile_number", number));


            conn.Open();

            SqlDataReader rdr = check.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String mobile_number = rdr.GetString(rdr.GetOrdinal("number"));


                Label mobile_number_label = new Label();
                mobile_number_label.Text = mobile_number + "<br>";
                form1.Controls.Add(mobile_number_label);


            }
            Response.Write("Completed Successfully");
        }
    }
}