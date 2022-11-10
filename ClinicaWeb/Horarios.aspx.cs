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
    public partial class Horarios : System.Web.UI.Page
    {
        public List<Horario> listaHorarios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                HorarioNegocio horarioNegocio = new HorarioNegocio();

                try
                {
                    listaHorarios = horarioNegocio.listar();
                    dgvHorarios.DataSource = listaHorarios;
                    dgvHorarios.DataBind();
                }
                catch (Exception excepcion)
                {
                    Session.Add("pagOrigen", "Especialidades.aspx");
                    Session.Add("excepcion", excepcion);
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Horarios.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("FormularioHorario.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Horarios.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvHorarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = dgvHorarios.Rows[index];
                TableCell contactName = selectedRow.Cells[0];
                int id = Convert.ToInt32(contactName.Text);

                if (e.CommandName == "Modificar")
                {
                    Session.Add("horarioModificar", id);
                    Response.Redirect("FormularioHorario.aspx", false);
                }
                else if (e.CommandName == "Eliminar")
                {
                    HorarioNegocio horarioNegocio = new HorarioNegocio();
                    horarioNegocio.Eliminar(id);
                    Response.Redirect("Horarios.aspx", false);
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Horarios.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}