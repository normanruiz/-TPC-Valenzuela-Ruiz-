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
    public partial class FormularioEstado : System.Web.UI.Page
    {
        public string tituloFormulario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["estadoModificar"] is null)
                {
                    tituloFormulario = "Alta de Estado";
                }
                else
                {

                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioEstado.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardarEstado_Click(object sender, EventArgs e)
        {
            EstadoNegocio estadoNegocio;
            Estado estado;
            try
            {
                if (Session["estadoModificar"] is null)
                {
                    estado = new Estado();
                    estado.Descripcion = tbxEstadoDescripcion.Text;
                    estadoNegocio = new EstadoNegocio();
                    estadoNegocio.crear(estado);
                    Response.Redirect("Estados.aspx", false);
                }
                else
                {

                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioEstado.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelarEstado_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Estados.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioEstado.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}