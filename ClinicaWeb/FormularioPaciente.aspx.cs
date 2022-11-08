using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicaWeb
{
    public partial class FormularioPaciente : System.Web.UI.Page
    {
        public string tituloFormulario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!(Session["pacienteModificar"] is null))
                {
                    tituloFormulario = "Modificacion de paciente";
                }
                else
                {
                    tituloFormulario = "Alta de paciente";
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Paciente.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}