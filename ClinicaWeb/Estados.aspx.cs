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
                if (!Helpers.Validacion.ValidarPermisos(this, "Administrador"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

                listaEstados = estadoNegocio.listar();
                Session["listaEstados"] = listaEstados;
                dgvEstados.DataSource = (List<Estado>)Session["listaEstados"];
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

        protected void tbxFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Estado> listaEstados;
            List<Estado> listaEstadosFiltrada;
            try
            {
                listaEstados = (List<Estado>)Session["listaEstados"];
                listaEstadosFiltrada = listaEstados.FindAll(estado => estado.Descripcion.ToUpper().Contains(tbxFiltro.Text.ToUpper()));
                Session["listaEstadosFiltrada"] = listaEstadosFiltrada;
                dgvEstados.DataSource = listaEstadosFiltrada;
                dgvEstados.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Estados.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvEstados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            List<Estado> listaEstados;
            List<Estado> listaEstadosFiltrada;
            try
            {
                
                listaEstadosFiltrada = (List<Estado>)Session["listaEstadosFiltrada"];
                if (listaEstadosFiltrada is null) {
                    listaEstados = (List<Estado>)Session["listaEstados"];
                    dgvEstados.PageIndex = e.NewPageIndex;
                    dgvEstados.DataSource = listaEstados;
                }
                else
                {
                    dgvEstados.PageIndex = e.NewPageIndex;
                    dgvEstados.DataSource = listaEstadosFiltrada;
                }
                dgvEstados.DataBind();
           
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