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
    public partial class Patient : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        
        //}

        protected void viewprofile(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }

        protected void checkHospitalAndDoctors(object sender, EventArgs e)
        {
            Response.Redirect("CheckHosiptal.aspx");
        }

        protected void checkDoctors(object sender, EventArgs e)
        {
            Response.Redirect("CheckDoctors.aspx");
        }

        protected void makeAppointment(object sender, EventArgs e)
        {
            Response.Redirect("MakeAppointment.aspx");
        }

        protected void editProfile(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }
    }
}