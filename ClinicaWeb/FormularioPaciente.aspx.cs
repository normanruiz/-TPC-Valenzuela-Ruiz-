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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!(Session["pacienteModificar"] is null))
                {
                    tituloFormulario = "Modificacion de paciente";
                }
                else
                {
                    tituloFormulario = "Alta de paciente";
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
                {
                    personaNegocio = new PersonaNegocio();
                    persona = new Modelo.Persona();
                    personaAux = (Modelo.Persona)Session["personaAux"];

                    persona.DNI = tbxDNI.Text;
                    persona.Nombre = tbxNombre.Text;
                    persona.Apellido = tbxApellido.Text;
                    persona.Email = tbxEmail.Text;
                    
                    if(personaAux is null)
                    {
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
                    if (!(persona is null))
                    {
                        Session.Add("personaAux", persona);
                        tbxNombre.Text = persona.Nombre;
                        tbxApellido.Text = persona.Apellido;
                        tbxEmail.Text = persona.Email;
                    }
                    else
                    {
                        tbxNombre.Text = "";
                        tbxApellido.Text = "";
                        tbxEmail.Text = "";
                        Session.Remove("personaAux");
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