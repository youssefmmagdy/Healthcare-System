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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void registerButton_Click(object sender, EventArgs e)
        {

            Response.Redirect("Register.aspx");
        }
        protected void login(object sender, EventArgs e)
        {
            try{
                string connStr = WebConfigurationManager.ConnectionStrings["HealthcareSystem"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                int id = Int16.Parse(username.Text);
                String pass = password.Text;

                SqlCommand loginproc = new SqlCommand("userLogin", conn);
                loginproc.CommandType = CommandType.StoredProcedure;
                loginproc.Parameters.Add(new SqlParameter("@id", id));
                loginproc.Parameters.Add(new SqlParameter("@password", pass));

                SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Int);

                success.Direction = ParameterDirection.Output;
                //
                SqlCommand typeproc = new SqlCommand("getUserType", conn);
                typeproc.CommandType = CommandType.StoredProcedure;
                typeproc.Parameters.Add(new SqlParameter("@id", id));

                SqlParameter res = typeproc.Parameters.Add("@res", SqlDbType.Int);

                res.Direction = ParameterDirection.Output;



                conn.Open();
                loginproc.ExecuteNonQuery();
                typeproc.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString() == "1")
                {

                    Session["user"] = id;
                    if (res.Value.ToString() == "1") {
                        Response.Redirect("Doctor.aspx");
                    } else if (res.Value.ToString() == "2")
                    {
                        Response.Redirect("Nurse.aspx");
                    }
                    else if (res.Value.ToString() == "3")
                    {
                        Response.Redirect("Phar.aspx");
                    }
                    else if (res.Value.ToString() == "4")
                    {
                        Response.Redirect("Patient.aspx");
                    }
                }
            }catch (Exception ex)
            {
                Response.Write("Invalid username or password.");
            }
        }
    }
}