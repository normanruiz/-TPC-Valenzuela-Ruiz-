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
    public partial class Medico : System.Web.UI.Page
    {
        public List<Modelo.Medico> listaMedicos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            MedicoNegocio medicoNegocio = new MedicoNegocio();

            try
            {
                if (!Helpers.Validacion.ValidarPermisos(this, "Recepcionista", "Administrador"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

                listaMedicos = medicoNegocio.listar();
                Session["listaMedicos"] = listaMedicos;
                dgvMedicos.DataSource = (List<Modelo.Medico>)Session["listaMedicos"];
                dgvMedicos.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Medico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("FormularioMedico.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Medico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Modificar" || e.CommandName == "Eliminar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow selectedRow = dgvMedicos.Rows[index];
                    TableCell contactName = selectedRow.Cells[0];
                    int id = Convert.ToInt32(contactName.Text);

                    if (e.CommandName == "Modificar")
                    {
                        Session.Add("medicoModificar", id);
                        Response.Redirect("FormularioMedico.aspx", false);
                    }
                    else if (e.CommandName == "Eliminar")
                    {
                        MedicoNegocio MedicoNegocio = new MedicoNegocio();
                        MedicoNegocio.quitar_especialidades(id);
                        MedicoNegocio.quitar_horarios(id);
                        MedicoNegocio.Eliminar(id);
                        Response.Redirect("Medico.aspx", false);
                    }
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Medico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void tbxFiltroNombre_TextChanged(object sender, EventArgs e)
        {
            List<Modelo.Medico> listaMedicos;
            List<Modelo.Medico> listaMedicosFiltrada;
            try
            {
                listaMedicos = (List<Modelo.Medico>)Session["listaMedicos"];
                listaMedicosFiltrada = filtrarNombre(listaMedicos);
                if (tbxFiltroApellido.Text.Length > 0)
                {
                    listaMedicosFiltrada = filtrarApellido(listaMedicosFiltrada);
                }
                Session["listaMedicosFiltrada"] = listaMedicosFiltrada;
                dgvMedicos.DataSource = listaMedicosFiltrada;
                dgvMedicos.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Medico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void tbxFiltroApellido_TextChanged(object sender, EventArgs e)
        {
            List<Modelo.Medico> listaMedicos;
            List<Modelo.Medico> listaMedicosFiltrada;
            try
            {
                listaMedicos = (List<Modelo.Medico>)Session["listaMedicos"];
                listaMedicosFiltrada = filtrarApellido(listaMedicos);
                if (tbxFiltroNombre.Text.Length > 0)
                {
                    listaMedicosFiltrada = filtrarNombre(listaMedicosFiltrada);
                }
                Session["listaMedicosFiltrada"] = listaMedicosFiltrada;
                dgvMedicos.DataSource = listaMedicosFiltrada;
                dgvMedicos.DataBind();
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Medico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        private List<Modelo.Medico> filtrarNombre(List<Modelo.Medico> listaMedicos)
        {
            List<Modelo.Medico> listaNombres;
            try
            {
                listaNombres = listaMedicos.FindAll(medico => medico.Nombre.ToUpper().Contains(tbxFiltroNombre.Text.ToUpper()));
                return listaNombres;
            }
            catch
            {
                return null;
            }
        }

        private List<Modelo.Medico> filtrarApellido(List<Modelo.Medico> listaMedicos)
        {
            List<Modelo.Medico> listaApellidos;
            try
            {
                listaApellidos = listaMedicos.FindAll(medico => medico.Apellido.ToUpper().Contains(tbxFiltroApellido.Text.ToUpper()));
                return listaApellidos;
            }
            catch
            {
                return null;
            }
        }

        protected void dgvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            List<Modelo.Medico> listaMedicos;
            List<Modelo.Medico> listaMedicosFiltrada;
            try
            {

                listaMedicosFiltrada = (List<Modelo.Medico>)Session["listaMedicosFiltrada"];
                if (listaMedicosFiltrada is null)
                {
                    listaMedicos = (List<Modelo.Medico>)Session["listaMedicos"];
                    dgvMedicos.PageIndex = e.NewPageIndex;
                    dgvMedicos.DataSource = listaMedicos;
                }
                else
                {
                    dgvMedicos.PageIndex = e.NewPageIndex;
                    dgvMedicos.DataSource = listaMedicosFiltrada;
                }
                dgvMedicos.DataBind();

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Medico.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}