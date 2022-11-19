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
    public partial class FormularioPaciente : System.Web.UI.Page
    {
        public string tituloFormulario { get; set; }
        public Modelo.Persona persona { get; set; }
        public Modelo.Paciente pacienteModificar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PacienteNegocio pacienteNegocio;
            try
            {
                if (Session["pacienteModificar"] is null)
                {
                    tituloFormulario = "Alta de Paciente";
                }
                else
                {
                    tituloFormulario = "Modificación de paciente";
                    int id = (int)Session["pacienteModificar"];
                    pacienteNegocio = new PacienteNegocio();
                    pacienteModificar = pacienteNegocio.buscar_con_id(id);
                    if (!IsPostBack)
                    {
                        tbxDNI.Text = pacienteModificar.DNI;
                        tbxNombre.Text = pacienteModificar.Nombre;
                        tbxApellido.Text = pacienteModificar.Apellido;
                        tbxEmail.Text = pacienteModificar.Email;

                        tbxFechaNacimiento.Text = pacienteModificar.FechaNacimiento.ToString("yyyy-MM-dd");
                        tbxDireccion.Text = pacienteModificar.Direccion;
                        tbxTelefono.Text = pacienteModificar.Telefono;
                    }
                    tbxDNI.Enabled = false;
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            PersonaNegocio personaNegocio;
            Modelo.Paciente paciente;
            Modelo.Persona personaAux;
            PacienteNegocio pacienteNegocio;
            try
            {
                if (Session["pacienteModificar"] is null)
                { // OJO !!!!!!! aca va crear salame
                    personaNegocio = new PersonaNegocio();
                    persona = new Modelo.Persona();
                    personaAux = (Modelo.Persona)Session["personaAux"];

                    persona.DNI = tbxDNI.Text;
                    persona.Nombre = tbxNombre.Text;
                    persona.Apellido = tbxApellido.Text;
                    persona.Email = tbxEmail.Text;

                    if (personaAux is null)
                    {
                        persona.usuario = null;
                        personaNegocio.crear(persona);
                        persona = personaNegocio.buscar_con_dni(persona.DNI);

                    }
                    else
                    {
                        persona.IdPersona = personaAux.IdPersona;
                        persona.usuario = personaAux.usuario;
                        personaNegocio.actualizar(persona);
                    }

                    paciente = new Modelo.Paciente();
                    paciente.IdPersona = persona.IdPersona;
                    paciente.FechaNacimiento = DateTime.Parse(tbxFechaNacimiento.Text);
                    paciente.Direccion = tbxDireccion.Text; ;
                    paciente.Telefono = tbxTelefono.Text;
                    pacienteNegocio = new PacienteNegocio();
                    pacienteNegocio.crear(paciente);

                    Session.Remove("personaAux");
                    Response.Redirect("Paciente.aspx", false);
                }
                else
                { // OJO !!!!!!! aca va actualizar tremendo salame
                    personaNegocio = new PersonaNegocio();
                    personaAux = (Modelo.Persona)Session["personaAux"];

                    if (personaAux is null)
                    {
                        if (pacienteModificar.DNI != tbxDNI.Text)
                        {
                            persona = new Modelo.Persona();
                            persona.DNI = tbxDNI.Text;
                            persona.Nombre = tbxNombre.Text;
                            persona.Apellido = tbxApellido.Text;
                            persona.Email = tbxEmail.Text;
                            persona.usuario = null;
                            personaNegocio.crear(persona);
                            persona = personaNegocio.buscar_con_dni(persona.DNI);
                        }
                        else
                        {
                            persona = new Modelo.Persona();
                            persona.IdPersona = pacienteModificar.IdPersona;
                            persona.DNI = pacienteModificar.DNI;
                            persona.Nombre = tbxNombre.Text;
                            persona.Apellido = tbxApellido.Text;
                            persona.Email = tbxEmail.Text;
                            persona.usuario = pacienteModificar.usuario;
                            personaNegocio.actualizar(persona);
                        }
                    }
                    else

                    {
                        persona.IdPersona = personaAux.IdPersona;
                        persona.DNI = tbxDNI.Text;
                        persona.Nombre = tbxNombre.Text;
                        persona.Apellido = tbxApellido.Text;
                        persona.Email = tbxEmail.Text;
                        persona.usuario = personaAux.usuario;
                        personaNegocio.actualizar(personaAux);

                    }

                    pacienteModificar.IdPersona = persona.IdPersona;
                    pacienteModificar.FechaNacimiento = DateTime.Parse(tbxFechaNacimiento.Text);
                    pacienteModificar.Direccion = tbxDireccion.Text; ;
                    pacienteModificar.Telefono = tbxTelefono.Text;

                    pacienteNegocio = new PacienteNegocio();
                    pacienteNegocio.actualizar(pacienteModificar);

                    Session.Remove("personaAux");
                    Session.Remove("pacienteModificar");
                    Response.Redirect("Paciente.aspx", false);
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioPaciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("pacienteModificar");
                Response.Redirect("Paciente.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
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
                        tbxDNI.Enabled = false;
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
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}