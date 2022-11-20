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
    public partial class Medico : System.Web.UI.Page
    {
        public List<Modelo.Medico> listaMedicos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            MedicoNegocio medicoNegocio = new MedicoNegocio();

            try
            {
                if (!Helpers.Validacion.ValidarPermisos(this, "Recepcionista", "Administrador"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

                listaMedicos = medicoNegocio.listar();
                dgvMedicos.DataSource = listaMedicos;
                dgvMedicos.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Medico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("FormularioMedico.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Medico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = dgvMedicos.Rows[index];
                TableCell contactName = selectedRow.Cells[0];
                int id = Convert.ToInt32(contactName.Text);

                if (e.CommandName == "Modificar")
                {
                    Session.Add("medicoModificar", id);
                    Response.Redirect("FormularioMedico.aspx", false);
                }
                else if (e.CommandName == "Eliminar")
                {
                    MedicoNegocio MedicoNegocio = new MedicoNegocio();
                    MedicoNegocio.quitar_especialidades(id);
                    MedicoNegocio.quitar_horarios(id);
                    MedicoNegocio.Eliminar(id);
                    Response.Redirect("Medico.aspx", false);
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Medico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}