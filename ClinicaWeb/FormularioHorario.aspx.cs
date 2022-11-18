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
    public partial class FormularioHorario : System.Web.UI.Page
    {
        public Horario horarioModificar { get; set; }
        public string tituloFormulario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            HorarioNegocio horarioNegocio;
            try
            {
                if (Session["horarioModificar"] is null)
                {
                    tituloFormulario = "Alta de Horario";
                }
                else
                {
                    tituloFormulario = "Modificacion de Horario";
                    int id = (int)Session["horarioModificar"];
                    horarioNegocio = new HorarioNegocio();
                    horarioModificar = horarioNegocio.buscar_con_id(id);
                    if (!IsPostBack)
                    {
                        ddlHorarioDia.SelectedValue = horarioModificar.Dia;
                        ddlHorarioInicio.SelectedValue = horarioModificar.HoraInicio.ToString();
                        ddlHorarioFin.SelectedValue = horarioModificar.HoraFin.ToString();
                    }
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioHorario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardarHorario_Click(object sender, EventArgs e)
        {
            Horario horario;
            HorarioNegocio horarioNegocio;

            try
            {
                string dia = ddlHorarioDia.SelectedValue;
                int horaInicio = Int32.Parse(ddlHorarioInicio.SelectedValue);
                int horaFin = Int32.Parse(ddlHorarioFin.SelectedValue);
                horarioNegocio = new HorarioNegocio();
                if (horarioNegocio.existe(dia, horaInicio, horaFin) is null)
                {
                    if (Session["horarioModificar"] is null)
                    {
                        horario = new Horario();
                        horario.Dia = ddlHorarioDia.SelectedValue;
                        horario.HoraInicio = Int32.Parse(ddlHorarioInicio.SelectedValue);
                        horario.HoraFin = Int32.Parse(ddlHorarioFin.SelectedValue);
                        horarioNegocio.crear(horario);
                        Session.Remove("horarioModificar");
                        Response.Redirect("Horarios.aspx", false);
                    }
                    else
                    {
                        horarioModificar.Dia = ddlHorarioDia.SelectedValue;
                        horarioModificar.HoraInicio = Int32.Parse(ddlHorarioInicio.SelectedValue);
                        horarioModificar.HoraFin = Int32.Parse(ddlHorarioFin.SelectedValue);
                        horarioNegocio.actualizar(horarioModificar);
                        Session.Remove("horarioModificar");
                        Response.Redirect("Horarios.aspx", false);
                    }
                }
                else
                {
                    lblAlerta.Text = "El horario que intenta ingresar ya existe.";
                    lblAlerta.CssClass = "form-label invalid-feedback";
                    lblAlerta.Visible = true;
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioHorario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelarHorario_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("horarioModificar");
                Response.Redirect("Horarios.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioHorario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void ddlHorarioInicio_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioHorario.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}