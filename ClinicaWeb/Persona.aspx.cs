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
                dgvPersona.DataSource = listaPersonas;
                dgvPersona.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Persona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {

            try
            {
                Response.Redirect("FormularioPersona.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Persona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvPersona_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = dgvPersona.Rows[index];
                TableCell contactName = selectedRow.Cells[0];
                int id = Convert.ToInt32(contactName.Text);

                if (e.CommandName == "Modificar")
                {
                    Session.Add("personaModificar", id);
                    Response.Redirect("FormularioPersona.aspx", false);
                }
                else if (e.CommandName == "Eliminar")
                {
                    PersonaNegocio personaNegocio = new PersonaNegocio();
                    Modelo.Persona auxPersona = new Modelo.Persona();
                    auxPersona = personaNegocio.buscar_con_id(id);
                    personaNegocio.Eliminar(id);
                    if(!(auxPersona.usuario is null))
                    {
                        UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                        usuarioNegocio.Eliminar(auxPersona.usuario.Id);
                    }
                    Response.Redirect("Persona.aspx", false);
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Persona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}