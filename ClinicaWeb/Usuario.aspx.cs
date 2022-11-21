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
                Session["listaUsuarios"] = listaUsuarios;
                dgvUsuario.DataSource = (List<Modelo.Usuario>)Session["listaUsuarios"];
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

        protected void tbxFiltroUsuario_TextChanged(object sender, EventArgs e)
        {
            List<Modelo.Usuario> listaUsuarios;
            List<Modelo.Usuario> listaUsuariosFiltrada;
            try
            {
                listaUsuarios = (List<Modelo.Usuario>)Session["listaUsuarios"];
                listaUsuariosFiltrada = filtrarNombre(listaUsuarios);
                if (tbxFiltroPerfil.Text.Length > 0)
                {
                    listaUsuariosFiltrada = filtrarPerfil(listaUsuariosFiltrada);
                }
                Session["listaUsuariosFiltrada"] = listaUsuariosFiltrada;
                dgvUsuario.DataSource = listaUsuariosFiltrada;
                dgvUsuario.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Usuario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        private List<Modelo.Usuario> filtrarNombre(List<Modelo.Usuario> listaUsuarios)
        {
            List<Modelo.Usuario> listaNombres;
            try
            {
                listaNombres = listaUsuarios.FindAll(usuario => usuario.Nombre.ToUpper().Contains(tbxFiltroUsuario.Text.ToUpper()));
                return listaNombres;
            }
            catch (Exception excepcion)
            {
                throw excepcion;
                return null;
            }

        }

        protected void tbxFiltroPerfil_TextChanged(object sender, EventArgs e)
        {
            List<Modelo.Usuario> listaUsuarios;
            List<Modelo.Usuario> listaUsuariosFiltrada;
            try
            {
                listaUsuarios = (List<Modelo.Usuario>)Session["listaUsuarios"];
                listaUsuariosFiltrada = filtrarPerfil(listaUsuarios);
                if (tbxFiltroUsuario.Text.Length > 0)
                {
                    listaUsuariosFiltrada = filtrarNombre(listaUsuariosFiltrada);
                }
                Session["listaUsuariosFiltrada"] = listaUsuariosFiltrada;
                dgvUsuario.DataSource = listaUsuariosFiltrada;
                dgvUsuario.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Usuario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        private List<Modelo.Usuario> filtrarPerfil(List<Modelo.Usuario> listaUsuarios)
        {
            List<Modelo.Usuario> listaPerfiles;
            try
            {
                listaPerfiles = listaUsuarios.FindAll(usuario => usuario.perfil.Tipo.ToUpper().Contains(tbxFiltroPerfil.Text.ToUpper()));
                return listaPerfiles;
            }
            catch (Exception excepcion)
            {
                throw excepcion;
                return null;
            }

        }

    }
}