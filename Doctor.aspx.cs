using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthcareSystem
{
    public partial class Doctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void view_profile(object sender, EventArgs e)
        {
            Response.Redirect("view_profile.aspx");
        }

        protected void view_patients_medical(object sender, EventArgs e)
        {
            Response.Redirect("Connectorr.aspx");
        }

        protected void request_lab(object sender, EventArgs e)
        {
            Response.Redirect("Connector_tmp.aspx");
        }

        protected void write_prescription(object sender, EventArgs e)
        {
            Response.Redirect("write_prescription.aspx");
        }

        protected void add_mobilenum(object sender, EventArgs e)
        {
            Response.Redirect("add_mobilenum.aspx");
        }
    }
}