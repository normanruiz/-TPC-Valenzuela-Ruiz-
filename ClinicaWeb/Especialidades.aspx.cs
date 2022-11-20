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
    public partial class Especialidades : System.Web.UI.Page
    {
        public List<Modelo.Especialidad> listaEspecialidades { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();

            try
            {
                if (!Helpers.Validacion.ValidarPermisos(this, "Administrador"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

                listaEspecialidades = especialidadNegocio.listar();
                dgvEspecialidad.DataSource = listaEspecialidades;
                dgvEspecialidad.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Especialidades.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("FormularioEspecialidad.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Especialidades.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvEspecialidad_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = dgvEspecialidad.Rows[index];
                TableCell contactName = selectedRow.Cells[0];
                int id = Convert.ToInt32(contactName.Text);
                if (e.CommandName == "Modificar")
                {
                    Session.Add("especialidadesModificar", id);
                    Response.Redirect("FormularioEspecialidad.aspx", false);
                }
                else if (e.CommandName == "Eliminar")
                {
                    EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
                    especialidadNegocio.Eliminar(id);
                    Response.Redirect("Especialidades.aspx", false);
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