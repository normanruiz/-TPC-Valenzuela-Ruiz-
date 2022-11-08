using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicaWeb
{
    public partial class FormularioEstado : System.Web.UI.Page
    {
        public string tituloFormulario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            tituloFormulario = "Por ahora nada";
        }

        protected void btnGuardarEstado_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Estados.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioEstado.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelarEstado_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Estados.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioEstado.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}