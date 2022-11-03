using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicaWeb
{
    public partial class FormularioUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuario.aspx", false);
        }

        protected void btnCancelarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuario.aspx", false);
        }
    }
}