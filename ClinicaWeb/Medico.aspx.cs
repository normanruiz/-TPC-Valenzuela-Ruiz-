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
                listaMedicos = medicoNegocio.listar();
                dgvMedicos.DataSource = listaMedicos;
                dgvMedicos.DataBind();
        }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "Default.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
}
    }
}