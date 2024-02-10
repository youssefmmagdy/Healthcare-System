using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthcareSystem
{
    public partial class PresSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnListPrescriptions_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pharmacylist.aspx");
        }

        protected void BtnListPharmacist(object sender, EventArgs e)
        {
            Response.Redirect("sayadla.aspx");
        }
        protected void BtncheckPres(object sender, EventArgs e)
        {
            Response.Redirect("Check.aspx");
        }
    }
}