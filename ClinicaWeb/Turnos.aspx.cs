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
    public partial class Turnos : System.Web.UI.Page
    {
        public List<Modelo.Turno> listaTurnos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            TurnoNegocio turnoNegocio;
            try
            {
                turnoNegocio = new TurnoNegocio();

                if (!Helpers.Validacion.ValidarPermisos(this, "Administrador", "Recepcionista", "Medico"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

                if (Helpers.Validacion.ValidarPermisos(this, "Medico"))
                {
                    DataControlFieldCollection columnas = dgvTurnos.Columns;
                    DataControlField columna = columnas[8];
                    columna.Visible = false;
                    btnNuevo.Visible = false;
                }

                listaTurnos = turnoNegocio.listar();
                Session["listaTurnos"] = listaTurnos;
                dgvTurnos.DataSource = (List<Modelo.Turno>)Session["listaTurnos"];
                dgvTurnos.DataBind();

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("FormularioTurno.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvTurnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            TurnoNegocio turnoNegocio;
            try
            {
                if (e.CommandName == "Modificar" || e.CommandName == "Eliminar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow selectedRow = dgvTurnos.Rows[index];
                    TableCell contactName = selectedRow.Cells[0];
                    int id = Convert.ToInt32(contactName.Text);
                    if (e.CommandName == "Modificar")
                    {
                        Session.Add("turnoModificar", id);
                        Response.Redirect("FormularioTurno.aspx", false);
                    }
                    else if (e.CommandName == "Eliminar")
                    {
                            turnoNegocio = new TurnoNegocio();
                            turnoNegocio.Eliminar_observaciones_de_turno(id);
                            turnoNegocio.Eliminar(id);
                            Response.Redirect("Turnos.aspx", false);
                    }
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            List<Modelo.Turno> listaTurnos;
            List<Modelo.Turno> listaTurnosFiltrada;
            try
            {

                listaTurnosFiltrada = (List<Modelo.Turno>)Session["listaTurnosFiltrada"];
                if (listaTurnosFiltrada is null)
                {
                    listaTurnos = (List<Modelo.Turno>)Session["listaTurnos"];
                    dgvTurnos.PageIndex = e.NewPageIndex;
                    dgvTurnos.DataSource = listaTurnos;
                }
                else
                {
                    dgvTurnos.PageIndex = e.NewPageIndex;
                    dgvTurnos.DataSource = listaTurnosFiltrada;
                }
                dgvTurnos.DataBind();

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void tbxFiltro_TextChanged(object sender, EventArgs e)

        {
            List<Modelo.Turno> listaTurnosFiltrada;
            try
            {

                listaTurnosFiltrada = (List<Modelo.Turno>)Session["listaTurnos"];

                if (tbxFiltroNumero.Text.Length > 0)
                {
                    listaTurnosFiltrada = filtrarNumero(listaTurnosFiltrada);
                }
                if (tbxFiltroPaciente.Text.Length > 0)
                {
                    listaTurnosFiltrada = filtrarPaciente(listaTurnosFiltrada);
                }
                if (tbxFiltroEspecialidad.Text.Length > 0)
                {
                    listaTurnosFiltrada = filtrarEspecialidad(listaTurnosFiltrada);
                }
                if (tbxFiltroMedico.Text.Length > 0)
                {
                    listaTurnosFiltrada = filtrarMedico(listaTurnosFiltrada);
                }
                if (tbxFiltroFecha.Text.Length > 0)
                {
                    listaTurnosFiltrada = filtrarFecha(listaTurnosFiltrada);
                }
                Session["listaTurnosFiltrada"] = listaTurnosFiltrada;
                dgvTurnos.DataSource = listaTurnosFiltrada;
                dgvTurnos.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Horarios.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        private List<Modelo.Turno> filtrarNumero(List<Modelo.Turno> listaTurnos)
        {
            List<Modelo.Turno> listaFiltradaNumeros = null;
            try
            {
                listaFiltradaNumeros = listaTurnos.FindAll(turno => turno.Numero.ToUpper().Contains(tbxFiltroNumero.Text.ToUpper()));
                return listaFiltradaNumeros;
            }
            catch
            {
                return listaFiltradaNumeros;
            }
        }

        private List<Modelo.Turno> filtrarPaciente(List<Modelo.Turno> listaTurnos)
        {
            List<Modelo.Turno> listaFiltradaPacientes = null;
            try
            {
                listaFiltradaPacientes = listaTurnos.FindAll(turno => turno.paciente.denominacion.ToUpper().Contains(tbxFiltroPaciente.Text.ToUpper()));
                return listaFiltradaPacientes;
            }
            catch
            {
                return listaFiltradaPacientes;
            }
        }

        private List<Modelo.Turno> filtrarEspecialidad(List<Modelo.Turno> listaTurnos)
        {
            List<Modelo.Turno> listaFiltradaEspecialidades = null;
            try
            {
                listaFiltradaEspecialidades = listaTurnos.FindAll(turno => turno.especialidad.Nombre.ToUpper().Contains(tbxFiltroEspecialidad.Text.ToUpper()));
                return listaFiltradaEspecialidades;
            }
            catch
            {
                return listaFiltradaEspecialidades;
            }
        }

        private List<Modelo.Turno> filtrarMedico(List<Modelo.Turno> listaTurnos)
        {
            List<Modelo.Turno> listaFiltradaMedicos = null;
            try
            {
                listaFiltradaMedicos = listaTurnos.FindAll(turno => turno.medico.denominacion.ToUpper().Contains(tbxFiltroMedico.Text.ToUpper()));
                return listaFiltradaMedicos;
            }
            catch
            {
                return listaFiltradaMedicos;
            }
        }

        private List<Modelo.Turno> filtrarFecha(List<Modelo.Turno> listaTurnos)
        {
            List<Modelo.Turno> listaFiltradaFechas = null;
            try
            {
                listaFiltradaFechas = listaTurnos.FindAll(turno => turno.Fecha.ToString("yyyy-MM-dd").Contains(tbxFiltroFecha.Text));
                return listaFiltradaFechas;
            }
            catch
            {
                return listaFiltradaFechas;
            }
        }

    }
}
