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
    public partial class Persona : System.Web.UI.Page
    {
        public List<Modelo.Persona> listaPersonas { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            PersonaNegocio personaNegocio = new PersonaNegocio();

            try
            {
                listaPersonas = personaNegocio.listar();
                dgvPersonas.DataSource = listaPersonas;
                dgvPersonas.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Persona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvPersonas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormularioPersona.aspx", false);
        }
    }
}