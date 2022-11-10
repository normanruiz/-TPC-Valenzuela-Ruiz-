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
                HorarioNegocio horarioNegocio = new HorarioNegocio();

                try
                {
                    listaHorarios = horarioNegocio.listar();
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

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Horarios.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}