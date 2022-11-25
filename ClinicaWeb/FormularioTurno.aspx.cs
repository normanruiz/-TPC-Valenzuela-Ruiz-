﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controlador;
using System.Globalization;

namespace ClinicaWeb
{
    public partial class FormularioTurno : System.Web.UI.Page
    {
        public List<Modelo.Especialidad> listaEspecialidades { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio especialidadNegocio;
            try
            {
                if (!Helpers.Validacion.ValidarPermisos(this, "Medico", "Recepcionista", "Administrador"))
                {
                    Session.Add("pagOrigen", "Turnos.aspx");
                    Session.Add("excepcion", new Exception("Esta intentando ingresar a una seccion para la que no tiene permisos de acceso."));
                    Response.Redirect("Error.aspx", false);
                }

                if (!IsPostBack)
                {
                    especialidadNegocio = new EspecialidadNegocio();
                    listaEspecialidades = especialidadNegocio.listar();
                    ddlEspecialidad.DataSource = listaEspecialidades;
                    ddlEspecialidad.DataTextField = "Nombre";
                    ddlEspecialidad.DataValueField = "Id";
                    ddlEspecialidad.DataBind();
                    ddlEspecialidad.Enabled = false;


                }
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Modelo.Turno turno;
            TurnoNegocio turnoNegocio;
            EstadoNegocio estadoNegocio;
            string observacion;


            try
            {
                //cargar y completar el turno
                turno = (Modelo.Turno)Session["turno"];
                observacion = (string)Session["observacion"];
                turnoNegocio = new TurnoNegocio();
                turno.Numero = turnoNegocio.generar_numero(turno.Fecha, turno.especialidad);
                estadoNegocio = new EstadoNegocio();
                turno.estado = estadoNegocio.buscar_con_descripcion("Nuevo");

                //guardar el turno
                turnoNegocio.crear(turno);

                //Guardar la observacion
                turno.Id = turnoNegocio.buscar_id_de_turno(turno);
                turnoNegocio.guardar_observacion(turno.Id, observacion);

                //limpiar session
                Session.Remove("observacion");
                Session.Remove("turno");
                Session.Remove("medicoOpcion1");
                Session.Remove("medicoOpcion2");
                Session.Remove("medicoOpcion3");
                Session.Remove("horarioOpcion1");
                Session.Remove("horaOpcion1");
                Session.Remove("fechaOpcion1");
                Session.Remove("horarioOpcion2");
                Session.Remove("horaOpcion2");
                Session.Remove("fechaOpcion2");
                Session.Remove("horarioOpcion3");
                Session.Remove("horaOpcion3");
                Session.Remove("fechaOpcion3");

                //salir
                Response.Redirect("Turnos.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Turnos.aspx", false);
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void tbxDNI_TextChanged(object sender, EventArgs e)
        {
            Modelo.Turno turno;
            string dniAux;
            PacienteNegocio pacienteNegocio;
            Modelo.Paciente paciente;
            try
            {
                turno = new Turno();
                if (tbxDNI.Text.Length >= 7)
                {
                    dniAux = tbxDNI.Text;
                    paciente = new Modelo.Paciente();
                    pacienteNegocio = new PacienteNegocio();
                    paciente = pacienteNegocio.buscar_con_dni(dniAux);
                    if (paciente is null)
                    {
                        lblDNI.Text = "No se encontro pasiente con el DNI cargado.";
                        lblDNI.CssClass = "d-block form-label invalid-feedback";
                    }
                    else
                    {
                        lblDNI.Text = paciente.denominacion;
                        lblDNI.CssClass = "d-block form-label valid-feedback";
                        turno.paciente = paciente;
                        Session["turno"] = turno;
                        ddlEspecialidad.Enabled = true;
                    }
                }


            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioPersona.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnAgregarObservacion_Click(object sender, EventArgs e)
        {

            try
            {
                listaObservaciones.InnerHtml = "<li class=\"list - group - item\">" + tbxObservacion.Text + "</li>";
                Session["observacion"] = tbxObservacion.Text;
                btnAgregarObservacion.Enabled = false;
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            Modelo.Turno turno;
            Modelo.Especialidad especialidad;
            EspecialidadNegocio especialidadNegocio;
            List<Modelo.Medico> listaMedicos;
            MedicoNegocio medicoNegocio;
            Modelo.Medico medicoOpcion1;
            Modelo.Medico medicoOpcion2;
            Modelo.Medico medicoOpcion3;
            HorarioNegocio horarioNegocio;

            List<Modelo.Horario> horariosDisponiblesOpcion1;
            List<Modelo.Horario> horariosDisponiblesOpcion2;
            List<Modelo.Horario> horariosDisponiblesOpcion3;

            List<int> horasOcupadas;
            List<int> horasLibres;

            DateTime? fechaOpcion1;
            DateTime? fechaOpcion2;
            DateTime? fechaOpcion3;
            int? horaOpcion1;
            int? horaOpcion2;
            int? horaOpcion3;

            try
            {
                turno = (Modelo.Turno)Session["turno"];
                //capturar especialidad y guardar en session
                especialidadNegocio = new EspecialidadNegocio();
                especialidad = especialidadNegocio.buscar_con_id(Int32.Parse(ddlEspecialidad.SelectedValue));
                turno.especialidad = especialidad;
                ckbCargaManual.Enabled = true;

                if (ckbCargaManual.Checked)
                {
                    ddlMedicos.Enabled = true;
                    medicoNegocio = new MedicoNegocio();
                    listaMedicos = medicoNegocio.listar_con_especialidad(especialidad.Id);
                    ddlMedicos.DataSource = listaMedicos;
                    ddlMedicos.DataTextField = "denominacion";
                    ddlMedicos.DataValueField = "IdMedico";
                    ddlMedicos.DataBind();
                    ddlMedicos.Enabled = true;
                }
                else
                {

                    //recuperar medicos
                    medicoNegocio = new MedicoNegocio();
                    listaMedicos = medicoNegocio.listar_con_especialidad(especialidad.Id);
                    medicoOpcion1 = listaMedicos[0] is null ? null : listaMedicos[0];
                    Session.Add("medicoOpcion1", medicoOpcion1);
                    medicoOpcion2 = listaMedicos[1] is null ? null : listaMedicos[1];
                    Session.Add("medicoOpcion2", medicoOpcion2);
                    medicoOpcion3 = listaMedicos[2] is null ? null : listaMedicos[2];
                    Session.Add("medicoOpcion3", medicoOpcion3);

                    //recupero fechas y horas
                    horarioNegocio = new HorarioNegocio();

                    // opcion 1
                    fechaOpcion1 = new DateTime();
                    horaOpcion1 = new int();
                    horasOcupadas = new List<int>();
                    if (medicoOpcion1 is null)
                    {
                        fechaOpcion1 = null;
                        horaOpcion1 = null;
                    }
                    else
                    {
                        horariosDisponiblesOpcion1 = horarioNegocio.listar_con_medico(medicoOpcion1.IdMedico);

                        foreach (Modelo.Horario horario in horariosDisponiblesOpcion1)
                        {
                            int incremento = 7;
                            for (DateTime fecha = DateTime.Today; incremento > 0; fecha = fecha.AddDays(1))
                            {
                                incremento--;
                                if ((fecha.ToString("dddd", CultureInfo.CreateSpecificCulture("es-AR"))).ToUpper() == horario.Dia.ToUpper())
                                {
                                    horasOcupadas = horarioNegocio.buscar_ocupados_para_medico_en_dia(medicoOpcion1.IdMedico, horario.Id);
                                    horasLibres = new List<int>();
                                    for (int i = horario.HoraInicio; i < horario.HoraFin; i++)
                                    {
                                        if (!horasOcupadas.Contains(i))
                                        {
                                            horasLibres.Add(i);
                                        }
                                    }
                                    if (horasLibres.Count != 0)
                                    {
                                        Session.Add("horarioOpcion1", horario);
                                        horaOpcion1 = horasLibres[0];
                                        Session.Add("horaOpcion1", horaOpcion1);
                                        fechaOpcion1 = fecha.AddHours(double.Parse(horaOpcion1.ToString()));
                                        Session.Add("fechaOpcion1", fechaOpcion1);
                                        break;
                                    }

                                }
                            }

                        }

                    }

                    // opcion 2
                    fechaOpcion2 = new DateTime();
                    horaOpcion2 = new int();
                    horasOcupadas = new List<int>();
                    if (medicoOpcion2 is null)
                    {
                        fechaOpcion2 = null;
                        horaOpcion2 = null;
                    }
                    else
                    {
                        horariosDisponiblesOpcion2 = horarioNegocio.listar_con_medico(medicoOpcion2.IdMedico);

                        foreach (Modelo.Horario horario in horariosDisponiblesOpcion2)
                        {
                            int incremento = 7;
                            for (DateTime fecha = DateTime.Today; incremento > 0; fecha = fecha.AddDays(1))
                            {
                                incremento--;
                                if ((fecha.ToString("dddd", CultureInfo.CreateSpecificCulture("es-AR"))).ToUpper() == horario.Dia.ToUpper())
                                {
                                    horasOcupadas = horarioNegocio.buscar_ocupados_para_medico_en_dia(medicoOpcion2.IdMedico, horario.Id);
                                    horasLibres = new List<int>();
                                    for (int i = horario.HoraInicio; i < horario.HoraFin; i++)
                                    {
                                        if (!horasOcupadas.Contains(i))
                                        {
                                            horasLibres.Add(i);
                                        }
                                    }
                                    if (horasLibres.Count != 0)
                                    {
                                        Session.Add("horarioOpcion2", horario);
                                        horaOpcion2 = horasLibres[0];
                                        Session.Add("horaOpcion2", horaOpcion2);
                                        fechaOpcion2 = fecha.AddHours(double.Parse(horaOpcion2.ToString()));
                                        Session.Add("fechaOpcion2", fechaOpcion2);
                                        break;
                                    }

                                }
                            }

                        }

                    }

                    // opcion 3
                    fechaOpcion3 = new DateTime();
                    horaOpcion3 = new int();
                    horasOcupadas = new List<int>();
                    if (medicoOpcion3 is null)
                    {
                        fechaOpcion3 = null;
                        horaOpcion3 = null;
                    }
                    else
                    {
                        horariosDisponiblesOpcion3 = horarioNegocio.listar_con_medico(medicoOpcion3.IdMedico);

                        foreach (Modelo.Horario horario in horariosDisponiblesOpcion3)
                        {
                            int incremento = 7;
                            for (DateTime fecha = DateTime.Today; incremento > 0; fecha = fecha.AddDays(1))
                            {
                                incremento--;
                                if ((fecha.ToString("dddd", CultureInfo.CreateSpecificCulture("es-AR"))).ToUpper() == horario.Dia.ToUpper())
                                {
                                    horasOcupadas = horarioNegocio.buscar_ocupados_para_medico_en_dia(medicoOpcion3.IdMedico, horario.Id);
                                    horasLibres = new List<int>();
                                    for (int i = horario.HoraInicio; i < horario.HoraFin; i++)
                                    {
                                        if (!horasOcupadas.Contains(i))
                                        {
                                            horasLibres.Add(i);
                                        }
                                    }
                                    if (horasLibres.Count != 0)
                                    {
                                        Session.Add("horarioOpcion3", horario);
                                        horaOpcion3 = horasLibres[0];
                                        Session.Add("horaOpcion3", horaOpcion3);
                                        fechaOpcion3 = fecha.AddHours(double.Parse(horaOpcion3.ToString()));
                                        Session.Add("fechaOpcion3", fechaOpcion3);
                                        break;
                                    }

                                }
                            }

                        }

                    }

                    // muestro los datos
                    // opcion 1
                    if (medicoOpcion1 is null)
                    {
                        lblMedicoOpcion1.Text = "Opcion";
                        lblDiaOpcion1.Text = "no";
                        lblHoraOpcion1.Text = "Disponible";
                    }
                    else
                    {
                        lblMedicoOpcion1.Text = medicoOpcion1.denominacion;
                        lblDiaOpcion1.Text = DateTime.Parse(fechaOpcion1.ToString()).ToString("dddd dd MMMM", CultureInfo.CreateSpecificCulture("es-AR"));
                        lblHoraOpcion1.Text = DateTime.Parse(fechaOpcion1.ToString()).ToString("HH:mm:ss", CultureInfo.CreateSpecificCulture("es-AR"));
                        btnElegirOpcion1.Enabled = true;
                    }
                    // opcion 2
                    if (medicoOpcion2 is null)
                    {
                        lblMedicoOpcion2.Text = "Opcion";
                        lblDiaOpcion2.Text = "no";
                        lblHoraOpcion2.Text = "Disponible";
                    }
                    else
                    {
                        lblMedicoOpcion2.Text = medicoOpcion2.denominacion;
                        lblDiaOpcion2.Text = DateTime.Parse(fechaOpcion2.ToString()).ToString("dddd dd MMMM", CultureInfo.CreateSpecificCulture("es-AR"));
                        lblHoraOpcion2.Text = DateTime.Parse(fechaOpcion2.ToString()).ToString("HH:mm:ss", CultureInfo.CreateSpecificCulture("es-AR"));
                        btnElegirOpcion2.Enabled = true;
                    }
                    // opcion 3
                    if (medicoOpcion3 is null)
                    {
                        lblMedicoOpcion3.Text = "Opcion";
                        lblDiaOpcion3.Text = "no";
                        lblHoraOpcion3.Text = "Disponible";
                    }
                    else
                    {
                        lblMedicoOpcion3.Text = medicoOpcion3.denominacion;
                        lblDiaOpcion3.Text = DateTime.Parse(fechaOpcion3.ToString()).ToString("dddd dd MMMM", CultureInfo.CreateSpecificCulture("es-AR"));
                        lblHoraOpcion3.Text = DateTime.Parse(fechaOpcion3.ToString()).ToString("HH:mm:ss", CultureInfo.CreateSpecificCulture("es-AR"));
                        btnElegirOpcion3.Enabled = true;
                    }

                }

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnElegirOpcion1_Click(object sender, EventArgs e)
        {
            Modelo.Turno turno;
            try
            {
                turno = (Modelo.Turno)Session["turno"];
                turno.medico = (Modelo.Medico)Session["medicoOpcion1"];
                turno.horario = (Modelo.Horario)Session["horarioOpcion1"];
                turno.horaInicio = (int)Session["horaOpcion1"];
                turno.Fecha = (DateTime)Session["fechaOpcion1"];
                Session["turno"] = turno;
                btnAgregarObservacion.Enabled = true;
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnElegirOpcion2_Click(object sender, EventArgs e)
        {
            Modelo.Turno turno;
            try
            {
                turno = (Modelo.Turno)Session["turno"];
                turno.medico = (Modelo.Medico)Session["medicoOpcion2"];
                turno.horario = (Modelo.Horario)Session["horarioOpcion2"];
                turno.horaInicio = (int)Session["horaOpcion2"];
                turno.Fecha = (DateTime)Session["fechaOpcion2"];
                Session["turno"] = turno;
                btnAgregarObservacion.Enabled = true;
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnElegirOpcion3_Click(object sender, EventArgs e)
        {
            Modelo.Turno turno;
            try
            {
                turno = (Modelo.Turno)Session["turno"];
                turno.medico = (Modelo.Medico)Session["medicoOpcion3"];
                turno.horario = (Modelo.Horario)Session["horarioOpcion3"];
                turno.horaInicio = (int)Session["horaOpcion3"];
                turno.Fecha = (DateTime)Session["fechaOpcion3"];
                Session["turno"] = turno;
                btnAgregarObservacion.Enabled = true;
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void ddlMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Modelo.Turno turno;
            List<Modelo.Horario> listaHorarios;
            Modelo.Medico medico;
            MedicoNegocio medicoNegocio;
            HorarioNegocio horarioNegocio;

            try
            {
                ddlHorarios.Items.Clear();
                ddlHora.Items.Clear();
                turno = (Modelo.Turno)Session["turno"];
                int id = Int32.Parse(ddlMedicos.SelectedValue);
                medicoNegocio = new MedicoNegocio();
                medico = medicoNegocio.buscar_con_id(id);
                turno.medico = medico;
                Session["turno"] = turno;

                horarioNegocio = new HorarioNegocio();
                listaHorarios = horarioNegocio.listar_con_medico(id);
                ddlHorarios.DataSource = listaHorarios;
                ddlHorarios.DataTextField = "Turno";
                ddlHorarios.DataValueField = "Id";
                ddlHorarios.DataBind();
                ddlHorarios.Enabled = true;
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void ddlHorarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            Modelo.Turno turno;
            Modelo.Horario horario;
            HorarioNegocio horarioNegocio;

            try
            {

                turno = (Modelo.Turno)Session["turno"];
                int id = Int32.Parse(ddlHorarios.SelectedValue);
                horarioNegocio = new HorarioNegocio();
                horario = horarioNegocio.buscar_con_id(id);
                turno.horario = horario;
                Session["turno"] = turno;

                tbxFecha.Enabled = true;

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void ckbCargaManual_CheckedChanged(object sender, EventArgs e)
        {
            Modelo.Turno turno;
            MedicoNegocio medicoNegocio;
            List<Modelo.Medico> listaMedicos;
            try
            {
                turno = (Modelo.Turno)Session["Turno"];
                ddlMedicos.Enabled = true;
                medicoNegocio = new MedicoNegocio();
                listaMedicos = medicoNegocio.listar_con_especialidad(turno.especialidad.Id);
                ddlMedicos.DataSource = listaMedicos;
                ddlMedicos.DataTextField = "denominacion";
                ddlMedicos.DataValueField = "IdMedico";
                ddlMedicos.DataBind();
                ddlMedicos.Enabled = true;

            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void tbxFecha_TextChanged(object sender, EventArgs e)
        {
            ddlHora.Items.Clear();
            Modelo.Turno turno;
            Modelo.Horario horario;
            HorarioNegocio horarioNegocio;
            DateTime fecha;
            List<int> horasOcupadas;
            List<int> horasLibres;
            try
            {
                turno = (Modelo.Turno)Session["Turno"];
                horarioNegocio = new HorarioNegocio();
                horario = horarioNegocio.buscar_con_id(Int32.Parse(ddlHorarios.SelectedValue));
                fecha = DateTime.Parse(tbxFecha.Text);
                turno.Fecha = fecha;
                Session["turno"] = turno;

                horasOcupadas = horarioNegocio.buscar_ocupados_para_medico_en_dia(turno.medico.IdMedico, horario.Id);
                horasLibres = new List<int>();
                for (int i = horario.HoraInicio; i < horario.HoraFin; i++)
                {
                    if (!horasOcupadas.Contains(i))
                    {
                        horasLibres.Add(i);
                    }
                }
                if (horasLibres.Count != 0)
                {
                    ddlHora.DataSource = horasLibres;
                    ddlHora.DataBind();
                    ddlHora.Enabled = true;
                }



            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void ddlHora_SelectedIndexChanged(object sender, EventArgs e)
        {
            Modelo.Turno turno;
            
            try
            {
                turno = (Modelo.Turno)Session["turno"];           
                turno.horaInicio = Int32.Parse(ddlHora.SelectedValue);
                Session["turno"] = turno;
                btnAgregarObservacion.Enabled = true;
            }
            catch (Exception excepcion)
            {
                Session.Add("pagOrigen", "FormularioTurno.aspx");
                Session.Add("excepcion", excepcion);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}
