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
    public partial class Turnos : System.Web.UI.Page
    {
        public List<Modelo.Turno> listaTurnos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            TurnoNegocio turnoNegocio;
            try
            {
                turnoNegocio = new TurnoNegocio();

                if (!Helpers.Validacion.ValidarPermisos(this, "Administrador", "Recepcionista", "Medico"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

                listaTurnos = turnoNegocio.listar();
                Session["listaTurnos"] = listaTurnos;
                dgvTurnos .DataSource = (List<Modelo.Turno>)Session["listaTurnos"];
                dgvTurnos.DataBind();

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("FormularioTurno.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvTurnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

    }
}