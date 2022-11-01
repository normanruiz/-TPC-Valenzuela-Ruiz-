using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicaWeb
{
    public partial class FormularioPersona : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {
                    ddlPerfil.Items.Add("Administrador");
                    ddlPerfil.Items.Add("Recepcionista");
                    ddlPerfil.Items.Add("Medico");
                }
                //else
                //{

                //}
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioPersona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Persona.aspx", false);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Persona.aspx", false);
        }
    }
}