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

            Modelo.Usuario usuario;

            try
            {
                usuario = (Modelo.Usuario)Session["Usuario"];
                if (usuario is null)
                {
                    Response.Redirect("Inicio.aspx", false);
                }

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        public bool ValidarRecepcionista()
        {
            bool estado = false;
            Modelo.Usuario usuario;
            try
            {
                usuario = new Modelo.Usuario();
                usuario = (Modelo.Usuario)Session["usuario"];
                if (!(usuario is null))
                {
                    if (usuario.perfil.Tipo == "Recepcionista")
                    {
                        estado = true;
                    }
                    else
                    {
                        estado = false;
                    }
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
            bool estado = false;
            Modelo.Usuario usuario;
            try
            {
                usuario = new Modelo.Usuario();
                usuario = (Modelo.Usuario)Session["usuario"];
                if (!(usuario is null))
                {
                    if (usuario.perfil.Tipo == "Administrador")
                    {
                        estado = true;
                    }
                    else
                    {
                        estado = false;
                    }
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

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("Usuario");
                Response.Redirect("Inicio.aspx", false);
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