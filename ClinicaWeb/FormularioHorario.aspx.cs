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
            Horario horario;
            HorarioNegocio horarioNegocio;

            try
            {
                if (Session["horarioModificar"] is null)
                {
                    horario = new Horario();
                    horario.Dia = ddlHorarioDia.SelectedValue;
                    horario.HoraInicio = Int32.Parse(ddlHorarioInicio.SelectedValue);
                    horario.HoraFin = Int32.Parse(ddlHorarioFin.SelectedValue);

                    horarioNegocio = new HorarioNegocio();
                    horarioNegocio.crear(horario);
                    Session.Remove("horarioModificar");
                    Response.Redirect("Horarios.aspx", false);
                }
                else
                {
                    //especialidadModificar.Nombre = tbxEspecilidadNombre.Text;
                    //especialidadNegocio = new EspecialidadNegocio();
                    //especialidadNegocio.actualizar(especialidadModificar);
                    //Session.Remove("especialidadesModificar");
                    //Response.Redirect("Especialidades.aspx", false);
                }
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
                Session.Remove("horarioModificar");
                Response.Redirect("Horarios.aspx", false);
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