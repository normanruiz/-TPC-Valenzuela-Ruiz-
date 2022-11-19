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
    public partial class FormularioUsuario : System.Web.UI.Page
    {
        public List<Perfil> listaPerfiles { get; set; }
        public Modelo.Usuario usuarioModificar { get; set; }
        public string tituloFormulario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PerfilNegocio perfilNegocio;
            UsuarioNegocio usuarioNegocio; ;
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

                if (Session["usuarioModificar"] is null)
                {
                    tituloFormulario = "Alta de Usuario";
                }
                else
                {
                    tituloFormulario = "Modificación de Usuario";
                    int id = (int)Session["usuarioModificar"];
                    usuarioNegocio = new UsuarioNegocio();
                    usuarioModificar = usuarioNegocio.buscar_con_id(id);
                    if (!IsPostBack)
                    {
                        tbxNombreUsuario.Text = usuarioModificar.Nombre;
                        tbxContraseñaUsuario.Text = usuarioModificar.Contrasenia;
                        tbxConfirmarContraseñaUsuario.Text = usuarioModificar.Contrasenia;
                        ddlPerfil.SelectedValue = usuarioModificar.perfil.Id.ToString();
                    }
                    tbxNombreUsuario.Enabled = false;
                }


            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioUsuario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardarUsuario_Click(object sender, EventArgs e)
        {
            Modelo.Usuario usuario;
            UsuarioNegocio usuarioNegocio;
            try
            {
                usuarioNegocio = new UsuarioNegocio();

                if (Session["usuarioModificar"] is null)
                {
                    if (usuarioNegocio.buscar_con_nombre(tbxNombreUsuario.Text) is null)
                    {
                        if (tbxContraseñaUsuario.Text == tbxConfirmarContraseñaUsuario.Text)
                        {
                            usuario = new Modelo.Usuario();
                            usuario.Nombre = tbxNombreUsuario.Text;
                            usuario.Contrasenia = tbxContraseñaUsuario.Text;
                            usuario.perfil = new Perfil();
                            usuario.perfil.Id = int.Parse(ddlPerfil.SelectedValue);

                            usuarioNegocio.crear(usuario);

                            Session.Remove("usuarioModificar");
                            Response.Redirect("Usuario.aspx", false);
                        }
                    }
                    else
                    {
                        tbxNombreUsuario.CssClass = "form-control is-invalid";
                        lblNombreUsuario.CssClass = "form-label invalid-feedback";
                        lblNombreUsuario.Text = "El nombre de usuario que intenta ingresar ya existe.";
                    }
                }
                else
                {

                    if (tbxContraseñaUsuario.Text == tbxConfirmarContraseñaUsuario.Text)
                    {
                        usuarioModificar.Nombre = tbxNombreUsuario.Text;
                        usuarioModificar.Contrasenia = tbxContraseñaUsuario.Text;
                        usuarioModificar.perfil.Id = int.Parse(ddlPerfil.SelectedValue);

                        usuarioNegocio.actualizar(usuarioModificar);

                        Session.Remove("usuarioModificar");
                        Response.Redirect("Usuario.aspx", false);
                    }

                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioUsuario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("usuarioModificar");
                Response.Redirect("Usuario.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioUsuario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}