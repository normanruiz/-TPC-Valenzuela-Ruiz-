using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class TurnoNegocio
    {
        public List<Modelo.Turno> listar()
        {
            AccesoDatos Conexion = new AccesoDatos();
            Modelo.Turno turno;
            List<Modelo.Turno> listaTurnos;
            Modelo.Paciente paciente;
            PacienteNegocio pacienteNegocio;
            Modelo.Especialidad especialidad;
            EspecialidadNegocio especialidadNegocio;
            Modelo.Medico medico;
            MedicoNegocio medicoNegocio;
            Modelo.Horario horario;
            HorarioNegocio horarioNegocio;
            Modelo.Estado estado;
            EstadoNegocio estadoNegocio;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT t.[id], t.[numero], t.[ipPaciente], t.[idEspecialidad], t.[idMedico], t.[idHorario], t.[horainicio], t.[fecha], t.[idEstado] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] AS t WITH (NOLOCK);");
                Conexion.ejecutarLectura();
                listaTurnos = new List<Modelo.Turno>();
                while (Conexion.Lector.Read())
                {
                    turno = new Modelo.Turno();
                    turno.Id = (Int32)Conexion.Lector["id"];
                    turno.Numero = (string)Conexion.Lector["numero"];

                    pacienteNegocio = new PacienteNegocio();
                    paciente = pacienteNegocio.buscar_con_id((Int32)Conexion.Lector["ipPaciente"]);
                    turno.paciente = paciente;

                    especialidadNegocio = new EspecialidadNegocio();
                    especialidad = especialidadNegocio.buscar_con_id((Int32)Conexion.Lector["idEspecialidad"]);
                    turno.especialidad = especialidad;

                    medicoNegocio = new MedicoNegocio();
                    medico = medicoNegocio.buscar_con_id((Int32)Conexion.Lector["idMedico"]);
                    turno.medico = medico;

                    horarioNegocio = new HorarioNegocio();
                    horario = horarioNegocio.buscar_con_id((Int32)Conexion.Lector["idHorario"]);
                    turno.horario = horario;

                    turno.horaInicio = (Int32)Conexion.Lector["horainicio"];

                    turno.Fecha = (DateTime)Conexion.Lector["fecha"];

                    estadoNegocio = new EstadoNegocio();
                    estado = estadoNegocio.buscar_con_id((Int32)Conexion.Lector["idEstado"]);
                    turno.estado = estado;

                    listaTurnos.Add(turno);
                }

                return listaTurnos;
            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }
            finally
            {
                Conexion.cerrar();
            }
        }
    }
}
