using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicaWeb
{
    public partial class Turnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!Helpers.Validacion.ValidarPermisos(this, "Administrador", "Recepcionista", "Medico"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void ButtonNuevoTurno_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioTurno.aspx");
        }
    }
}