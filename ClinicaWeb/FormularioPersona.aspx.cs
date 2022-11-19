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
        public Modelo.Persona persona { get; set; }
        public Modelo.Usuario usuario { get; set; }
        public List<Modelo.Usuario> listaUsuarios { get; set; }
        public string tituloFormulario { get; set; }
        public List<Perfil> listaPerfiles { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            PersonaNegocio personaNegocio;
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
                if (Session["personaModificar"] is null)
                {
                    tituloFormulario = "Alta de persona";
                }
                else
                {
                    tituloFormulario = "Modificación de persona";
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
                            tbxNombreUsuario.Enabled = false;
                        }
                    }
                    tbxDNI.Enabled = false;
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
            bool estado = true;
            try
            {
                personaNegocio = new PersonaNegocio();
                usuarioNegocio = new UsuarioNegocio();
                if (Session["personaModificar"] is null)
                {
                    if (personaNegocio.buscar_con_dni(tbxDNI.Text) is null)
                    {
                        persona = new Modelo.Persona();
                        persona.DNI = tbxDNI.Text;
                        persona.Nombre = tbxNombre.Text;
                        persona.Apellido = tbxApellido.Text;
                        persona.Email = tbxEmail.Text;
                        if (ckbUsuario.Checked)
                        {
                            if (usuarioNegocio.buscar_con_nombre(tbxNombreUsuario.Text) is null)
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
                            tbxNombreUsuario.CssClass = "form-control is-invalid";
                            lblNombreUsuario.CssClass = "form-label invalid-feedback";
                            lblNombreUsuario.Text = "El usuario que intenta ingresar ya existe.";
                            estado = false;
                        }
                        else
                        {
                            persona.usuario = null;
                        }

                        if (estado)
                        {
                            personaNegocio.crear(persona);
                            Session.Remove("personaModificar");
                            Response.Redirect("persona.aspx", false);
                        }
                    }
                    else
                    {
                        tbxDNI.CssClass = "form-control is-invalid";
                        lblDNI.CssClass = "form-label invalid-feedback";
                        lblDNI.Text = "El DNI que intenta ingresar ya existe.";
                    }

                }
                else
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
                                usuarioNegocio.crear(usuario);
                                auxUsuario = usuarioNegocio.buscar_con_nombre(usuario.Nombre);
                                personaModificar.usuario = auxUsuario;
                            }
                            else
                            {
                                usuario = new Modelo.Usuario();
                                usuario.Id = personaModificar.usuario.Id;
                                usuario.Nombre = tbxNombreUsuario.Text;
                                usuario.Contrasenia = tbxContraseñaUsuario.Text;
                                usuario.perfil = new Perfil();
                                usuario.perfil.Id = int.Parse(ddlPerfil.SelectedValue);
                                usuarioNegocio.actualizar(usuario);
                                personaModificar.usuario = usuario;
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

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioPersona.aspx");
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
                        tbxDNI.CssClass = "form-control is-valid";
                        lblDNI.Text = "";
                    }
                    else
                    {
                        tbxDNI.CssClass = "form-control is-invalid";
                        lblDNI.CssClass = "form-label invalid-feedback";
                        lblDNI.Text = "El DNI que intenta ingresar ya existe.";
                    }
                }
                else
                {

                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioPersona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void tbxNombreUsuario_TextChanged(object sender, EventArgs e)
        {
            string usuarioAux;
            UsuarioNegocio usuarioNegocio;
            try
            {
                usuarioAux = tbxNombreUsuario.Text;
                usuario = new Modelo.Usuario();
                usuarioNegocio = new UsuarioNegocio();
                usuario = usuarioNegocio.buscar_con_nombre(usuarioAux);
                if (usuario is null)
                {
                    tbxNombreUsuario.CssClass = "form-control is-valid";
                    lblNombreUsuario.Text = "";
                }
                else
                {
                    tbxNombreUsuario.CssClass = "form-control is-invalid";
                    lblNombreUsuario.CssClass = "form-label invalid-feedback";
                    lblNombreUsuario.Text = "El usuario que intenta ingresar ya existe.";
                }

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioPersona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}