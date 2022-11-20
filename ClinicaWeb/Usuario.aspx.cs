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
                if (!Helpers.Validacion.ValidarPermisos(this, "Administrador"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

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
            try
            {
                Response.Redirect("FormularioUsuario.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Usuario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
            
        }

        protected void dgvUsuario_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = dgvUsuario.Rows[index];
                TableCell contactName = selectedRow.Cells[0];
                int id = Convert.ToInt32(contactName.Text);

                if (e.CommandName == "Modificar")
                {
                    Session.Add("usuarioModificar", id);
                    Response.Redirect("FormularioUsuario.aspx", false);
                }
                else if (e.CommandName == "Eliminar")
                {

                    UsuarioNegocio usuarioNegocio = new UsuarioNegocio();


                    usuarioNegocio.Eliminar(id);

                    Response.Redirect("Usuario.aspx", false);
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Usuario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}