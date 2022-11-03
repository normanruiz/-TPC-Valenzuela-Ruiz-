using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controlador;

namespace ClinicaWeb
{
    public partial class FormularioEspecialidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnGuardarEspecialidad_Click(object sender, EventArgs e)
        {
            Especialidad especialidad;
            EspecialidadNegocio especialidadNegocio;
            try
            {
                especialidad = new Especialidad();
                especialidad.Nombre = tbxEspecilidadNombre.Text;
                especialidadNegocio = new EspecialidadNegocio();
                especialidadNegocio.crear(especialidad);
                Response.Redirect("Especialidades.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Especialidades.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
            
        }

        protected void btnCancelarEspecialidad_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Especialidades.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Especialidades.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}