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

        private void modificar(int id)
        {
            Especialidad especialidad;
            EspecialidadNegocio especialidadNegocio;
            try
            {
                especialidadNegocio = new EspecialidadNegocio();
                especialidad = especialidadNegocio.buscar_con_id(id);

                Response.Redirect("FormularioEspecialidad.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Especialidades.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        private void eliminar(int id)
        {
            try
            {
                Response.Redirect("Especialidades.aspx", false);
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