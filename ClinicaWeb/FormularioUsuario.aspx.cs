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
    public partial class FormularioUsuario : System.Web.UI.Page
    {
        public List<Perfil> listaPerfiles { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PerfilNegocio perfilNegocio = new PerfilNegocio();

            try
            {
                listaPerfiles = perfilNegocio.listar();

                ddlPerfil.DataSource = listaPerfiles;
                
                ddlPerfil.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioUsuario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuario.aspx", false);
        }

        protected void btnCancelarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuario.aspx", false);
        }
    }
}