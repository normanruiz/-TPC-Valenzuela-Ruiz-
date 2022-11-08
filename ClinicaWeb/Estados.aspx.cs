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
    public partial class Estados : System.Web.UI.Page
    {
        public List<Estado> listaEstados { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            EstadoNegocio estadoNegocio = new EstadoNegocio();
            try
            {
                listaEstados = estadoNegocio.listar();
                dgvEstados.DataSource = listaEstados;
                dgvEstados.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Estados.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("FormularioEstado.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Estados.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvEstados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = dgvEstados.Rows[index];
                TableCell contactName = selectedRow.Cells[0];
                int id = Convert.ToInt32(contactName.Text);
                if (e.CommandName == "Modificar")
                {
                    Session.Add("estadoModificar", id);
                    Response.Redirect("FormularioEstado.aspx", false);
                }
                else if (e.CommandName == "Eliminar")
                {
                    EstadoNegocio estadoNegocio = new EstadoNegocio();
                    estadoNegocio.Eliminar(id);
                    Response.Redirect("Estados.aspx", false);
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Estados.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}