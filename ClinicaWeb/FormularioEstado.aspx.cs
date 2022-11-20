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
    public partial class FormularioEstado : System.Web.UI.Page
    {
        public string tituloFormulario { get; set; }
        public Estado estadoModificar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if( !Helpers.Validacion.ValidarPermisos(this, "Administrador"))
            {
                Session.Add("pagOrigen", "Turnos.aspx");
                Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                Response.Redirect("Error.aspx", false);
            }

            EstadoNegocio estadoNegocio;
            try
            {
                if (Session["estadoModificar"] is null)
                {
                    tituloFormulario = "Alta de Estado";
                }
                else
                {
                    tituloFormulario = "Modificación de Estado";
                    int id = (int)Session["estadoModificar"];
                    estadoNegocio = new EstadoNegocio();
                    estadoModificar = estadoNegocio.buscar_con_id(id);
                    if (!IsPostBack)
                    {
                        tbxEstadoDescripcion.Text = estadoModificar.Descripcion;
                    }
                    
                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioEstado.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardarEstado_Click(object sender, EventArgs e)
        {
            EstadoNegocio estadoNegocio;
            Estado estado;
            try
            {
                estadoNegocio = new EstadoNegocio();

                if (Session["estadoModificar"] is null)
                {
                    if (estadoNegocio.buscar_con_descripcion(tbxEstadoDescripcion.Text) is null)
                    {
                        estado = new Estado();
                        estado.Descripcion = tbxEstadoDescripcion.Text;
                        estadoNegocio.crear(estado);
                        Response.Redirect("Estados.aspx", false);
                    }
                    else
                    {
                        tbxEstadoDescripcion.CssClass = "form-control is-invalid";
                        lblEstadoDescripcion.CssClass = "form-label invalid-feedback";
                        lblEstadoDescripcion.Text = "El campo que intenta ingresar ya existe.";
                    }
                }
                else
                {
                    if (estadoNegocio.buscar_con_descripcion(tbxEstadoDescripcion.Text) is null || tbxEstadoDescripcion.Text == estadoModificar.Descripcion)
                    {
                        estadoModificar.Descripcion = tbxEstadoDescripcion.Text;
                        estadoNegocio.actualizar(estadoModificar);
                        Session.Remove("estadoModificar");
                        Response.Redirect("Estados.aspx", false);
                    }
                    else
                    {
                        tbxEstadoDescripcion.CssClass = "form-control is-invalid";
                        lblEstadoDescripcion.CssClass = "form-label invalid-feedback";
                        lblEstadoDescripcion.Text = "El campo que intenta ingresar ya existe.";
                    }
                }

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioEstado.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelarEstado_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("estadoModificar");
                Response.Redirect("Estados.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioEstado.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}