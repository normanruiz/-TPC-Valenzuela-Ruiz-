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
    public partial class FormularioMedico : System.Web.UI.Page
    {
        public string tituloFormulario { get; set; }
        public List<Perfil> listaPerfiles { get; set; }
        public List<Especialidad> listaEspecialidades { get; set; }
        public List<Horario> listaHorarios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PerfilNegocio perfilNegocio;
            EspecialidadNegocio especialidadNegocio;
            HorarioNegocio horarioNegocio;
            try
            {
                if (!IsPostBack)
                {
                    perfilNegocio = new PerfilNegocio();
                    listaPerfiles = perfilNegocio.listar();
                    ddlPerfil.DataSource = listaPerfiles;
                    ddlPerfil.DataTextField = "Tipo";
                    ddlPerfil.DataValueField = "Id";
                    ddlPerfil.DataBind();

                    especialidadNegocio = new EspecialidadNegocio();
                    listaEspecialidades = especialidadNegocio.listar();
                    ddlEspecialidad.DataSource = listaEspecialidades;
                    ddlEspecialidad.DataTextField = "Nombre";
                    ddlEspecialidad.DataValueField = "Id";
                    ddlEspecialidad.DataBind();

                    horarioNegocio = new HorarioNegocio();
                    listaHorarios = horarioNegocio.listar();
                    ddlHorario.DataSource = listaHorarios;
                    ddlHorario.DataTextField = "Turno";
                    ddlHorario.DataValueField = "Id";
                    ddlHorario.DataBind();
                }
                if (Session["MedicoModificar"] is null)
                {
                    tituloFormulario = "Alta de Medico";
                }
                else
                {
                    tituloFormulario = "Modificacion de Medico";
                    //int id = (int)Session["horarioModificar"];
                    //horarioNegocio = new HorarioNegocio();
                    //horarioModificar = horarioNegocio.buscar_con_id(id);
                    //if (!IsPostBack)
                    //{
                    //    ddlHorarioDia.SelectedValue = horarioModificar.Dia;
                    //    ddlHorarioInicio.SelectedValue = horarioModificar.HoraInicio.ToString();
                    //    ddlHorarioFin.SelectedValue = horarioModificar.HoraFin.ToString();
                    //}
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioMedico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvEspecialidad_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void dgvHorario_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnEspecialidadAsignar_Click(object sender, EventArgs e)
        {

        }

        protected void btnHorarioAsignar_Click(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void tbxDNI_TextChanged(object sender, EventArgs e)
        {

        }
    }
}