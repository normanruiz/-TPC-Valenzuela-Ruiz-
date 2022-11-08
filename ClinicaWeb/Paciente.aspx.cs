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
    public partial class Paciente : System.Web.UI.Page
    {
        public List<Modelo.Paciente> listaPacientes { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PacienteNegocio pacienteNegocio = new PacienteNegocio();

            try
            {
                listaPacientes = pacienteNegocio.listar();
                dgvPacientes.DataSource = listaPacientes;
                dgvPacientes.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {

        }
    }
}