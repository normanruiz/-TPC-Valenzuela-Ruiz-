using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicaWeb
{
    public partial class FormularioHorario : System.Web.UI.Page
    {
        public string tituloFormulario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["horariosModificar"] is null)
                {
                    tituloFormulario = "Alta de Horario";
                }
                else
                {
                    tituloFormulario = "Modificacion de Horario";
                    //int id = (int)Session["especialidadesModificar"];
                    //especialidadNegocio = new EspecialidadNegocio();
                    //especialidadModificar = especialidadNegocio.buscar_con_id(id);
                    //if (!IsPostBack)
                    //{
                    //    tbxEspecilidadNombre.Text = especialidadModificar.Nombre;
                    //}
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioHorario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardarEspecialidad_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioHorario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelarEspecialidad_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioHorario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}