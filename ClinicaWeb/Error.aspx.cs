using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicaWeb
{
    public partial class Error : System.Web.UI.Page
    {
        public string paginaOrigen { get; set; }
        public Exception errorInformado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    paginaOrigen = (string)Session["pagOrigen"];
                    errorInformado = (Exception)Session["excepcion"];
                }
            }
            catch (Exception excepcion)
            {
                Response.Redirect("Inicio.aspx", false);
            }
        }
    }
}