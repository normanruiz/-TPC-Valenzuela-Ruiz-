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
        public Modelo.Persona persona { get; set; }
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

                    if (Session["MedicoModificar"] is null)
                    {
                    }
                    else
                    {

                        //listaEspecialidades = especialidadNegocio.listar_con_medico(medico);
                        //dgvEspecialidad.DataSource = listaEspecialidades;
                        //dgvEspecialidad.DataBind();

                    }




                }
                if (Session["MedicoModificar"] is null)
                {
                    tituloFormulario = "Alta de Medico";
                    if (Session["listaEspecialidades"] is null)
                    {
                        listaEspecialidades = new List<Especialidad>();
                    }
                    else
                    {
                        listaEspecialidades = (List<Especialidad>)Session["listaEspecialidades"];
                    }
                    if (Session["listaHorarios"] is null)
                    {
                        listaHorarios = new List<Horario>();
                    }
                    else
                    {
                        listaHorarios = (List<Horario>)Session["listaHorarios"];
                    }
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
            EspecialidadNegocio especialidadNegocio;
            Especialidad especialidad;
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = dgvEspecialidad.Rows[index];
                TableCell contactName = selectedRow.Cells[0];
                int id = Convert.ToInt32(contactName.Text);

                especialidadNegocio = new EspecialidadNegocio();
                especialidad = new Especialidad();
                especialidad = especialidadNegocio.buscar_con_id(id);

                List<Especialidad> listaEspecialidadesAux = new List<Especialidad>();// desde aca
                foreach (Especialidad aux in listaEspecialidades)
                {
                    listaEspecialidadesAux.Add(aux);
                }
                listaEspecialidades.Clear();
                foreach (Especialidad aux in listaEspecialidadesAux)
                {
                    if (aux.Id != especialidad.Id)
                    {
                        listaEspecialidades.Add(aux);
                    }
                } // Hasta aca

                //listaEspecialidades.Remove(especialidad);
                Session["listaEspecialidades"] = listaEspecialidades;
                dgvEspecialidad.DataSource = listaEspecialidades;
                dgvEspecialidad.DataBind();

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioMedico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvHorario_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            HorarioNegocio horarioNegocio;
            Horario horario;
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = dgvHorario.Rows[index];
                TableCell contactName = selectedRow.Cells[0];
                int id = Convert.ToInt32(contactName.Text);

                horarioNegocio = new HorarioNegocio();
                horario = new Horario();
                horario = horarioNegocio.buscar_con_id(id);

                List<Horario> listaHorarioAux = new List<Horario>();// desde aca
                foreach (Horario aux in listaHorarios)
                {
                    listaHorarioAux.Add(aux);
                }
                listaHorarios.Clear();
                foreach (Horario aux in listaHorarioAux)
                {
                    if (aux.Id != horario.Id)
                    {
                        listaHorarios.Add(aux);
                    }
                } // Hasta aca

                //listaHorarios.Remove(horario);
                Session["listaHorarios"] = listaHorarios;
                dgvHorario.DataSource = listaHorarios;
                dgvHorario.DataBind();

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioMedico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnEspecialidadAsignar_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio especialidadNegocio;
            Especialidad especialidad;
            try
            {
                especialidadNegocio = new EspecialidadNegocio();
                especialidad = new Especialidad();
                especialidad = especialidadNegocio.buscar_con_id(Int32.Parse(ddlEspecialidad.SelectedValue));
                listaEspecialidades.Add(especialidad);
                Session["listaEspecialidades"] = listaEspecialidades;
                dgvEspecialidad.DataSource = listaEspecialidades;
                dgvEspecialidad.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioMedico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnHorarioAsignar_Click(object sender, EventArgs e)
        {
            HorarioNegocio horarioNegocio;
            Horario horario;
            try
            {
                horarioNegocio = new HorarioNegocio();
                horario = new Horario();
                horario = horarioNegocio.buscar_con_id(Int32.Parse(ddlHorario.SelectedValue));
                listaHorarios.Add(horario);
                Session["listaHorarios"] = listaHorarios;
                dgvHorario.DataSource = listaHorarios;
                dgvHorario.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioMedico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            PerfilNegocio perfilNegocio;
            Perfil perfilAux;
            Modelo.Usuario usuarioAux;
            PersonaNegocio personaNegocio;
            Modelo.Persona personaAux;
            MedicoNegocio medicoNegocio;
            Modelo.Medico medicoAux;

            try
            {

                if (Session["medicoModificar"] is null)
                {
                    personaNegocio = new PersonaNegocio();
                    personaAux = (Modelo.Persona)Session["personaAux"];

                    if (personaAux is null)
                    {
                        if (tbxContraseñaUsuario.Text == tbxConfirmarContraseñaUsuario.Text)
                        {
                            usuarioAux = new Modelo.Usuario();
                            usuarioAux.Nombre = tbxNombreUsuario.Text;
                            usuarioAux.Contrasenia = tbxContraseñaUsuario.Text;

                            perfilNegocio = new PerfilNegocio();
                            perfilAux = perfilNegocio.buscar_con_id(Int32.Parse(ddlPerfil.SelectedValue));
                            usuarioAux.perfil = perfilAux;

                            personaAux = new Modelo.Persona();
                            personaAux.DNI = tbxDNI.Text;
                            personaAux.Nombre = tbxNombre.Text;
                            personaAux.Apellido = tbxApellido.Text;
                            personaAux.Email = tbxEmail.Text;
                            personaAux.usuario = usuarioAux;

                            personaNegocio.crear(personaAux);
                            personaAux = personaNegocio.buscar_con_dni(personaAux.DNI);

                            medicoAux = new Modelo.Medico();
                            medicoAux.IdPersona = personaAux.IdPersona;
                            medicoAux.DNI = personaAux.DNI;

                            medicoNegocio = new MedicoNegocio();
                            medicoNegocio.crear(medicoAux);
                            medicoAux = medicoNegocio.buscar_con_dni(medicoAux.DNI);

                            medicoNegocio.establecer_especialidades(medicoAux, listaEspecialidades);

                            medicoNegocio.establecer_horarios(medicoAux, listaHorarios);

                            Response.Redirect("Medico.aspx", false);
                        }

                    }
                    else
                    {

                    }

                }
                else
                { // OJO !!!!!!! aca va actualizar tremendo salame

                }

                //Session.Remove("listaHorarios");
                //Session.Remove("listaEspecialidades");
                //Session.Remove("medicoModificar");
                //Response.Redirect("Medico.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Especialidades.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("listaHorarios");
                Session.Remove("listaEspecialidades");
                Session.Remove("medicoModificar");
                Response.Redirect("Medico.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Especialidades.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void tbxDNI_TextChanged(object sender, EventArgs e)
        {
            string dniAux;
            PersonaNegocio personaNegocio;
            try
            {
                if (tbxDNI.Text.Length >= 7)
                {
                    dniAux = tbxDNI.Text;
                    persona = new Modelo.Persona();
                    personaNegocio = new PersonaNegocio();
                    persona = personaNegocio.buscar_con_dni(dniAux);
                    if (persona is null)
                    {
                        tbxNombre.Text = "";
                        tbxApellido.Text = "";
                        tbxEmail.Text = "";
                        Session.Remove("personaAux");
                    }
                    else
                    {
                        Session.Add("personaAux", persona);
                        tbxNombre.Text = persona.Nombre;
                        tbxApellido.Text = persona.Apellido;
                        tbxEmail.Text = persona.Email;
                        tbxNombreUsuario.Text = persona.usuario.Nombre;
                        tbxContraseñaUsuario.Text = persona.usuario.Contrasenia;
                        tbxConfirmarContraseñaUsuario.Text = persona.usuario.Contrasenia;
                        ddlPerfil.SelectedValue = persona.usuario.perfil.Id.ToString();
                    }
                }
                else
                {
                    tbxNombre.Text = "";
                    tbxApellido.Text = "";
                    tbxEmail.Text = "";
                    Session.Remove("personaAux");
                }
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