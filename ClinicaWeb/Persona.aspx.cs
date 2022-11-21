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
                if (!Helpers.Validacion.ValidarPermisos(this, "Administrador"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

                listaPersonas = personaNegocio.listar();
                Session["listaPersonas"] = listaPersonas;
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

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Modelo.Persona> listaPersonas;
            List<Modelo.Persona> listaPersonasFiltrada;
            try
            {
                listaPersonas = (List<Modelo.Persona>)Session["listaPersonas"];
                listaPersonasFiltrada = filtrarDNI(listaPersonas);
                if (tbxFiltroNombre.Text.Length > 0)
                {
                    listaPersonasFiltrada = filtrarNombre(listaPersonasFiltrada);
                }
                if (tbxFiltroApellido.Text.Length > 0)
                {
                    listaPersonasFiltrada = filtrarApellido(listaPersonasFiltrada);
                }
                Session["listaPacientesFiltrada"] = listaPersonasFiltrada;
                dgvPersona.DataSource = listaPersonasFiltrada;
                dgvPersona.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Persona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        private List<Modelo.Persona> filtrarDNI(List<Modelo.Persona> listaPersonas)
        {
            List<Modelo.Persona> listaDNIs;
            try
            {
                listaDNIs = listaPersonas.FindAll(persona => persona.DNI.ToUpper().Contains(tbxFiltroDNI.Text.ToUpper()));
                return listaDNIs;
            }
            catch
            {
                return null;
            }
        }

        private List<Modelo.Persona> filtrarNombre(List<Modelo.Persona> listaPersonas)
        {
            List<Modelo.Persona> listaNombres;
            try
            {
                listaNombres = listaPersonas.FindAll(persona => persona.Nombre.ToUpper().Contains(tbxFiltroNombre.Text.ToUpper()));
                return listaNombres;
            }
            catch
            {
                return null;
            }
        }

        private List<Modelo.Persona> filtrarApellido(List<Modelo.Persona> listaPersonas)
        {
            List<Modelo.Persona> listaApellidos;
            try
            {
                listaApellidos = listaPersonas.FindAll(persona => persona.Apellido.ToUpper().Contains(tbxFiltroApellido.Text.ToUpper()));
                return listaApellidos;
            }
            catch
            {
                return null;
            }
        }
    }
}