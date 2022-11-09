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
    public partial class FormularioPersona : System.Web.UI.Page
    {
        public Modelo.Persona personaModificar { get; set; }
        public List<Modelo.Usuario> listaUsuarios { get; set; }
        public string tituloFormulario { get; set; }
        public List<Perfil> listaPerfiles { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            PersonaNegocio personaNegocio;
            UsuarioNegocio usuarioNegocio;
            PerfilNegocio perfilNegocio;

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
                }
                if (!(Session["personaModificar"] is null))
                {
                    tituloFormulario = "Modificacion de persona";
                    int id = (int)Session["personaModificar"];
                    personaNegocio = new PersonaNegocio();
                    personaModificar = personaNegocio.buscar_con_id(id);
                    if (!IsPostBack)
                    {
                        tbxDNI.Text = personaModificar.DNI;
                        tbxNombre.Text = personaModificar.Nombre;
                        tbxApellido.Text = personaModificar.Apellido;
                        tbxEmail.Text = personaModificar.Email;
                        if (personaModificar.usuario is null)
                        {
                            ckbUsuario.Checked = false;
                        }
                        else
                        {
                            ckbUsuario.Checked = true;
                            tbxNombreUsuario.Text = personaModificar.usuario.Nombre;
                            tbxContraseñaUsuario.Text = personaModificar.usuario.Contrasenia;
                            tbxConfirmarContraseñaUsuario.Text = personaModificar.usuario.Contrasenia;
                            ddlPerfil.SelectedValue = personaModificar.usuario.perfil.Id.ToString();
                        }
                    }
                }
                else
                {
                    tituloFormulario = "Alta de persona";
                }
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
            try
            {
                Session.Remove("personaModificar");
                Response.Redirect("Persona.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioPersona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Modelo.Persona persona;
            Modelo.Usuario usuario;
            Modelo.Usuario auxUsuario;
            PersonaNegocio personaNegocio;
            UsuarioNegocio usuarioNegocio;
            try
            {
                if (!(Session["personaModificar"] is null))
                {
                    personaModificar.DNI = tbxDNI.Text;
                    personaModificar.Nombre = tbxNombre.Text;
                    personaModificar.Apellido = tbxApellido.Text;
                    personaModificar.Email = tbxEmail.Text;
                    if (ckbUsuario.Checked)
                    {
                        if (tbxContraseñaUsuario.Text == tbxConfirmarContraseñaUsuario.Text)
                        {
                            if (personaModificar.usuario is null)
                            {
                                usuario = new Modelo.Usuario();
                                usuario.Nombre = tbxNombreUsuario.Text;
                                usuario.Contrasenia = tbxContraseñaUsuario.Text;
                                usuario.perfil = new Perfil();
                                usuario.perfil.Id = int.Parse(ddlPerfil.SelectedValue);
                                usuarioNegocio = new UsuarioNegocio();
                                usuarioNegocio.crear(usuario);
                                auxUsuario = usuarioNegocio.buscar_con_nombre(usuario.Nombre);
                                personaModificar.usuario = auxUsuario;
                            }
                            else
                            {
                                personaModificar.usuario.Nombre = tbxNombreUsuario.Text;
                                personaModificar.usuario.Contrasenia = tbxContraseñaUsuario.Text;
                                personaModificar.usuario.perfil.Id = int.Parse(ddlPerfil.SelectedValue);
                            }
                        }
                    }
                    else
                    {
                        personaModificar.usuario = null;
                    }
                    personaNegocio = new PersonaNegocio();
                    personaNegocio.actualizar(personaModificar);

                    Session.Remove("personaModificar");
                    Response.Redirect("persona.aspx", false);

                }
                else
                {

                    persona = new Modelo.Persona();
                    persona.DNI = tbxDNI.Text;
                    persona.Nombre = tbxNombre.Text;
                    persona.Apellido = tbxApellido.Text;
                    persona.Email = tbxEmail.Text;
                    if (ckbUsuario.Checked)
                    {
                        if (tbxContraseñaUsuario.Text == tbxConfirmarContraseñaUsuario.Text)
                        {
                            persona.usuario = new Modelo.Usuario();
                            persona.usuario.Nombre = tbxNombreUsuario.Text;
                            persona.usuario.Contrasenia = tbxContraseñaUsuario.Text;
                            persona.usuario.perfil = new Perfil();
                            persona.usuario.perfil.Id = int.Parse(ddlPerfil.SelectedValue);
                        }
                    }
                    else
                    {
                        persona.usuario = null;
                    }

                    personaNegocio = new PersonaNegocio();
                    personaNegocio.crear(persona);

                    Session.Remove("personaModificar");
                    Response.Redirect("persona.aspx", false);
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Persona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}