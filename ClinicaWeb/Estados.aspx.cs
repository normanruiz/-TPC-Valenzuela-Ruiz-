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

        }

        protected void dgvEstados_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}