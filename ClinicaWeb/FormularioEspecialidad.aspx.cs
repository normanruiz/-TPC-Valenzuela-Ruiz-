using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicaWeb
{
    public partial class FormularioEspecialidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardarEspecialidad_Click(object sender, EventArgs e)
        {
            Response.Redirect("Especialidades.aspx", false);
        }

        protected void btnCancelarEspecialidad_Click(object sender, EventArgs e)
        {
            Response.Redirect("Especialidades.aspx", false);
        }
    }
}