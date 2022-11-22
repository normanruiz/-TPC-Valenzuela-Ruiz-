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
    public partial class Paciente : System.Web.UI.Page
    {
        public List<Modelo.Paciente> listaPacientes { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            PacienteNegocio pacienteNegocio = new PacienteNegocio();

            try
            {
                if (!Helpers.Validacion.ValidarPermisos(this, "Recepcionista", "Administrador"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

                listaPacientes = pacienteNegocio.listar();
                Session["listaPacientes"] = listaPacientes;
                dgvPacientes.DataSource = listaPacientes;
                dgvPacientes.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Modificar" || e.CommandName == "Eliminar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow selectedRow = dgvPacientes.Rows[index];
                    TableCell contactName = selectedRow.Cells[0];
                    int id = Convert.ToInt32(contactName.Text);

                    if (e.CommandName == "Modificar")
                    {
                        Session.Add("pacienteModificar", id);
                        Response.Redirect("FormularioPaciente.aspx", false);
                    }
                    else if (e.CommandName == "Eliminar")
                    {
                        PacienteNegocio pacienteNegocio = new PacienteNegocio();
                        Modelo.Paciente paciente = new Modelo.Paciente();
                        paciente = pacienteNegocio.buscar_con_id(id);
                        pacienteNegocio.Eliminar(id);

                        Response.Redirect("Paciente.aspx", false);
                    }
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("FormularioPaciente.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Modelo.Paciente> listaPacientes;
            List<Modelo.Paciente> listaPacientesFiltrada;
            try
            {
                listaPacientes = (List<Modelo.Paciente>)Session["listaPacientes"];
                listaPacientesFiltrada = filtrarDNI(listaPacientes);
                if (tbxFiltroNombre.Text.Length > 0)
                {
                    listaPacientesFiltrada = filtrarNombre(listaPacientesFiltrada);
                }
                if (tbxFiltroApellido.Text.Length > 0)
                {
                    listaPacientesFiltrada = filtrarApellido(listaPacientesFiltrada);
                }
                Session["listaPacientesFiltrada"] = listaPacientesFiltrada;
                dgvPacientes.DataSource = listaPacientesFiltrada;
                dgvPacientes.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        private List<Modelo.Paciente> filtrarDNI(List<Modelo.Paciente> listaPacientes)
        {
            List<Modelo.Paciente> listaDNIs;
            try
            {
                listaDNIs = listaPacientes.FindAll(paciente => paciente.DNI.ToUpper().Contains(tbxFiltroDNI.Text.ToUpper()));
                return listaDNIs;
            }
            catch
            {
                return null;
            }
        }

        private List<Modelo.Paciente> filtrarNombre(List<Modelo.Paciente> listaPacientes)
        {
            List<Modelo.Paciente> listaNombres;
            try
            {
                listaNombres = listaPacientes.FindAll(paciente => paciente.Nombre.ToUpper().Contains(tbxFiltroNombre.Text.ToUpper()));
                return listaNombres;
            }
            catch
            {
                return null;
            }
        }

        private List<Modelo.Paciente> filtrarApellido(List<Modelo.Paciente> listaPacientes)
        {
            List<Modelo.Paciente> listaApellidos;
            try
            {
                listaApellidos = listaPacientes.FindAll(paciente => paciente.Apellido.ToUpper().Contains(tbxFiltroApellido.Text.ToUpper()));
                return listaApellidos;
            }
            catch
            {
                return null;
            }
        }

        protected void dgvPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            List<Modelo.Paciente> listaPacientes;
            List<Modelo.Paciente> listaPacientesFiltrada;
            try
            {

                listaPacientesFiltrada = (List<Modelo.Paciente>)Session["listaPacientesFiltrada"];
                if (listaPacientesFiltrada is null)
                {
                    listaPacientes = (List<Modelo.Paciente>)Session["listaPacientes"];
                    dgvPacientes.PageIndex = e.NewPageIndex;
                    dgvPacientes.DataSource = listaPacientes;
                }
                else
                {
                    dgvPacientes.PageIndex = e.NewPageIndex;
                    dgvPacientes.DataSource = listaPacientesFiltrada;
                }
                dgvPacientes.DataBind();

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Paciente.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}