using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicaWeb
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            /*
             * Aca va la magia que cuando el usuario ingrese sus credenciales determine por medio de su perfin al donde sera redirigido* 
             * algo asi como:
             * Verificamos qu usuario y contraseña sean correctos, con una funcion que valla a base de datos y devuelva un objeto usuario
             * si existe  para la tupla usuario contrasela que fueron enviados
             * entonces si tenemos un usuario con un case verificamos su perfil y redirigimos a donde corresponda
             */
            Response.Redirect("Turnos.aspx", false);
        }
    }
}