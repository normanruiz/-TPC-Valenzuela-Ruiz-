using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Modelo;

namespace ClinicaWeb.Helpers
{
    public class Validacion
    {
        public static bool ValidarPermisos(Page pagina, params string[] perfiles)
        {
            bool estado = false;
            Modelo.Usuario usuario;
            try
            {
                usuario = (Modelo.Usuario)pagina.Session["Usuario"];
                if (usuario is null)
                {
                    pagina.Response.Redirect("Inicio.aspx", false);
                }
                else
                {

                    foreach (string perfil in perfiles)
                    {
                        if (usuario.perfil.Tipo == perfil)
                        {
                            estado = true;
                            break;
                        }
                        else
                        {
                            estado = false;
                        }
                    }
                }

                return estado;

            }
            catch (Exception excepcion)
            {
                return false;
            }
        }

        public static bool ValidarSesion(Page pagina)
        {
            bool estado = true;
            Modelo.Usuario usuario;
            try
            {
                usuario = (Modelo.Usuario)pagina.Session["Usuario"];
                if (usuario is null)
                {
                    estado = false;
                }
                else
                {
                    estado = true;
                }

                return estado;

            }
            catch (Exception excepcion)
            {
                return false;
            }
        }


    }
}