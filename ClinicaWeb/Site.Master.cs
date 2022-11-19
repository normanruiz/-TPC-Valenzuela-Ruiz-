using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;


namespace ClinicaWeb
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool ValidarRecepcionista()
        {
            bool estado = true;
            Modelo.Usuario usuario;
            try
            {
                usuario = new Modelo.Usuario();
                usuario = (Modelo.Usuario)Session["usuario"];
                if (usuario.perfil.Tipo == "Recepcionista")
                {
                    estado = true;
                }
                else
                {
                    estado = false;
                }
                return estado;
            }
            catch (Exception excepcion)
            {
                estado = false;
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
                return estado;
            }
        }

        public bool ValidarAdministrador()
        {
            bool estado = true;
            Modelo.Usuario usuario;
            try
            {
                usuario = new Modelo.Usuario();
                usuario = (Modelo.Usuario)Session["usuario"];
                if (usuario.perfil.Tipo == "Administrador")
                {
                    estado = true;
                }
                else
                {
                    estado = false;
                }
                return estado;
            }
            catch (Exception excepcion)
            {
                estado = false;
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
                return estado;
            }

        }

    }
}