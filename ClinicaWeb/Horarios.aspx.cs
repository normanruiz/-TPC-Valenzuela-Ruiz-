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
    public partial class Horarios : System.Web.UI.Page
    {
        public List<Horario> listaHorarios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Helpers.Validacion.ValidarPermisos(this, "Administrador"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

                HorarioNegocio horarioNegocio = new HorarioNegocio();

                try
                {
                    listaHorarios = horarioNegocio.listar();
                    Session["listaHorarios"] = listaHorarios;
                    dgvHorarios.DataSource = listaHorarios;
                    dgvHorarios.DataBind();
                }
                catch (Exception excepcion)
                {
                    Session.Add("pagOrigen", "Especialidades.aspx");
                    Session.Add("excepcion", excepcion);
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Horarios.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("FormularioHorario.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Horarios.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvHorarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = dgvHorarios.Rows[index];
                TableCell contactName = selectedRow.Cells[0];
                int id = Convert.ToInt32(contactName.Text);

                if (e.CommandName == "Modificar")
                {
                    Session.Add("horarioModificar", id);
                    Response.Redirect("FormularioHorario.aspx", false);
                }
                else if (e.CommandName == "Eliminar")
                {
                    HorarioNegocio horarioNegocio = new HorarioNegocio();
                    horarioNegocio.Eliminar(id);
                    Response.Redirect("Horarios.aspx", false);
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Horarios.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Modelo.Horario> listaHorarios;
            List<Modelo.Horario> listaHorariosFiltrada;
            try
            {
                listaHorarios = (List<Modelo.Horario>)Session["listaHorarios"];
                listaHorariosFiltrada = filtrarDia(listaHorarios);
                if (tbxFiltroInicio.Text.Length > 0)
                {
                    listaHorariosFiltrada = filtrarInicio(listaHorariosFiltrada);
                }
                if (tbxFiltroFin.Text.Length > 0)
                {
                    listaHorariosFiltrada = filtrarFin(listaHorariosFiltrada);
                }
                Session["listaHorariosFiltrada"] = listaHorariosFiltrada;
                dgvHorarios.DataSource = listaHorariosFiltrada;
                dgvHorarios.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Persona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        private List<Modelo.Horario> filtrarDia(List<Modelo.Horario> listaHorarios)
        {
            List<Modelo.Horario> listaDias;
            try
            {
                listaDias = listaHorarios.FindAll(horario => horario.Dia.ToUpper().Contains(tbxFiltroDia.Text.ToUpper()));
                return listaDias;
            }
            catch
            {
                return null;
            }
        }

        private List<Modelo.Horario> filtrarInicio(List<Modelo.Horario> listaHorarios)
        {
            List<Modelo.Horario> listaInicios;
            try
            {
                listaInicios = listaHorarios.FindAll(horario => horario.HoraInicio.ToString().ToUpper().Contains(tbxFiltroInicio.Text.ToUpper()));
                return listaInicios;
            }
            catch
            {
                return null;
            }
        }

        private List<Modelo.Horario> filtrarFin(List<Modelo.Horario> listaHorarios)
        {
            List<Modelo.Horario> listaFines;
            try
            {
                listaFines = listaHorarios.FindAll(horario => horario.HoraFin.ToString().ToUpper().Contains(tbxFiltroFin.Text.ToUpper()));
                return listaFines;
            }
            catch
            {
                return null;
            }
        }
    }
}