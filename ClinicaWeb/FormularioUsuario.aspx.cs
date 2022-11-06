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
            PerfilNegocio perfilNegocio = new PerfilNegocio();
            UsuarioNegocio usuarioNegocio; ;
            try
            {
                if (!(Session["usuarioModificar"] is null))
                {
                    tituloFormulario = "Modificacion de usuario";
                    int id = (int)Session["usuarioModificar"];
                    usuarioNegocio = new UsuarioNegocio();
                    usuarioModificar = usuarioNegocio.buscar_con_id(id);
                    if (!IsPostBack)
                    {
                        tbxNombreUsuario.Text = usuarioModificar.Nombre;
                        tbxContraseñaUsuario.Text = usuarioModificar.Contrasenia;
                        tbxConfirmarContraseñaUsuario.Text = usuarioModificar.Contrasenia;
                    }
                }
                else
                {
                    tituloFormulario = "Alta de usuario";
                }

                listaPerfiles = perfilNegocio.listar();

                ddlPerfil.DataSource = listaPerfiles;
                ddlPerfil.DataTextField = "Tipo";
                ddlPerfil.DataValueField = "Id";
                ddlPerfil.DataBind();
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
                if (!(Session["usuarioModificar"] is null))
                {
                    //usuario.Nombre = tbxNombreUsuario.Text;

                    //especialidadNegocio = new EspecialidadNegocio();
                    //especialidadNegocio.actualizar(especialidadModificar);
                    //Session.Remove("especialidadesModificar");
                    //Response.Redirect("Especialidades.aspx", false);
                }
                else
                {
                    if (tbxContraseñaUsuario.Text == tbxConfirmarContraseñaUsuario.Text)
                    {
                        usuario = new Modelo.Usuario();
                        usuario.Nombre = tbxNombreUsuario.Text;
                        usuario.Contrasenia = tbxContraseñaUsuario.Text;
                        usuario.perfil = new Perfil();
                        usuario.perfil.Id = int.Parse(ddlPerfil.SelectedValue);

                        usuarioNegocio = new UsuarioNegocio();
                        usuarioNegocio.crear(usuario);

                        Session.Remove("usuarioModificar");
                        Response.Redirect("FormularioUsuario.aspx", false);
                    }
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Especialidades.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
            Response.Redirect("Usuario.aspx", false);
        }

        protected void btnCancelarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuario.aspx", false);
        }
    }
}