using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthcareSystem
{
    public partial class Phar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPharma_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pharmacist_Profile.aspx");
        }

        protected void btnBigL_Click(object sender, EventArgs e)
        {
            Response.Redirect("PresSheet.aspx");
        }

        protected void editClick(object sender, EventArgs e)
        {
            Response.Redirect("Pharma.aspx");
        }
    }
}