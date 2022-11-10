﻿using System;
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
            EstadoNegocio estadoNegocio;
            try
            {
                if (Session["estadoModificar"] is null)
                {
                    tituloFormulario = "Alta de Estado";
                }
                else
                {
                    tituloFormulario = "Modificacion de Estado";
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
                if (Session["estadoModificar"] is null)
                {
                    estado = new Estado();
                    estado.Descripcion = tbxEstadoDescripcion.Text;
                    estadoNegocio = new EstadoNegocio();
                    estadoNegocio.crear(estado);
                    Response.Redirect("Estados.aspx", false);
                }
                else
                {
                    estadoModificar.Descripcion = tbxEstadoDescripcion.Text;
                    estadoNegocio = new EstadoNegocio();
                    estadoNegocio.actualizar(estadoModificar);
                    Session.Remove("estadoModificar");
                    Response.Redirect("Estados.aspx", false);
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