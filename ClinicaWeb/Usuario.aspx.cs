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
    public partial class Usuario : System.Web.UI.Page
    {
        public List<Modelo.Usuario> listaUsuarios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            try
            {
                listaUsuarios = usuarioNegocio.listar();
                dgvUsuario.DataSource = listaUsuarios;
                dgvUsuario.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Usuario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioUsuario.aspx", false);
        }
    }
}