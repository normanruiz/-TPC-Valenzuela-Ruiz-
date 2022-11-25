using System;
using System.Collections.Generic;
using System.Globalization;
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
                Conexion.setearConsulta("SELECT t.[id], t.[numero], t.[idPaciente], t.[idEspecialidad], t.[idMedico], t.[idHorario], t.[horainicio], t.[fecha], t.[idEstado] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] AS t WITH (NOLOCK);");
                Conexion.ejecutarLectura();
                listaTurnos = new List<Modelo.Turno>();
                while (Conexion.Lector.Read())
                {
                    turno = new Modelo.Turno();
                    turno.Id = (Int32)Conexion.Lector["id"];
                    turno.Numero = (string)Conexion.Lector["numero"];

                    pacienteNegocio = new PacienteNegocio();
                    paciente = pacienteNegocio.buscar_con_id((Int32)Conexion.Lector["idPaciente"]);
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

        public void crear(Turno turno)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] ([numero], [idPaciente], [idEspecialidad], [idMedico], [idHorario], [horainicio], [fecha], [idEstado]) VALUES (@numero, @idPaciente, @idEspecialidad, @idMedico, @idHorario, @horainicio, @fecha, @idEstado)";
                conexion.setearParametro("@numero", turno.Numero);
                conexion.setearParametro("@idPaciente", turno.paciente.IdPaciente);
                conexion.setearParametro("@idEspecialidad", turno.especialidad.Id);
                conexion.setearParametro("@idMedico", turno.medico.IdMedico);
                conexion.setearParametro("@idHorario", turno.horario.Id);
                conexion.setearParametro("@horainicio", turno.horaInicio);
                conexion.setearParametro("@fecha", turno.Fecha);
                conexion.setearParametro("@idEstado", turno.estado.Id);
                conexion.conectar();
                conexion.setearConsulta(consulta);
                conexion.ejecutarAccion();
            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }
            finally
            {
                conexion.cerrar();
            }
        }

        public string generar_numero(DateTime fecha, Especialidad especialidad)
        {
            AccesoDatos conexion = new AccesoDatos();
            string numero;
            int aux;
            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT COUNT(t.[id]) AS 'contador' FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] AS t WITH (NOLOCK) INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK) ON T.idEspecialidad = e.id WHERE CONVERT(DATE, t.[fecha]) = CONVERT(DATE, @fecha) AND t.[idEspecialidad] = @especialidad;");
                conexion.setearParametro("@fecha", fecha);
                conexion.setearParametro("@especialidad", especialidad.Id);
                conexion.ejecutarLectura();
                aux = new int();
                if (conexion.Lector.Read())
                {
                    aux = (int)conexion.Lector["contador"];
                }

                aux = aux == 0 ? 1 : aux;

                numero = especialidad.Nombre.Substring(0, 1) + aux.ToString("D3");

                return numero;
            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }
            finally
            {
                conexion.cerrar();
            }
        }

        public int buscar_id_de_turno(Turno turno)
        {
            AccesoDatos conexion = new AccesoDatos();
            int id;
            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT t.[id] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] AS t WITH (NOLOCK) WHERE t.[numero] = @numero AND t.[idPaciente] = @idPaciente AND t.[idEspecialidad] = @idEspecialidad AND t.[idMedico] = @idMedico AND t.[idHorario] = @idHorario AND t.[horainicio] = @horainicio AND t.[fecha] = @fecha AND t.[idEstado] = @idEstado; ");
                conexion.setearParametro("@numero", turno.Numero);
                conexion.setearParametro("@idPaciente", turno.paciente.IdPaciente);
                conexion.setearParametro("@idEspecialidad", turno.especialidad.Id);
                conexion.setearParametro("@idMedico", turno.medico.IdMedico);
                conexion.setearParametro("@idHorario", turno.horario.Id);
                conexion.setearParametro("@horainicio", turno.horaInicio);
                conexion.setearParametro("@fecha", turno.Fecha);
                conexion.setearParametro("@idEstado", turno.estado.Id);
                conexion.ejecutarLectura();
                id = new int();
                if (conexion.Lector.Read())
                {
                    id = (Int32)conexion.Lector["id"];
                }

                return id;
            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }
            finally
            {
                conexion.cerrar();
            }
        }

        public void guardar_observacion(int idTurno, string observacion)
        {
            AccesoDatos conexion = new AccesoDatos();

            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[ObservacionesXTurno] ([idTurno], [observacion]) VALUES (@idTurno, @observacion);";
                conexion.setearParametro("@idTurno", idTurno);
                conexion.setearParametro("@observacion", observacion);
                conexion.conectar();
                conexion.setearConsulta(consulta);
                conexion.ejecutarAccion();
            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }
            finally
            {
                conexion.cerrar();
            }
        }

        public void Eliminar_observaciones_de_turno(int idTurno)
        {
            AccesoDatos conexion = new AccesoDatos();

            try
            {
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[ObservacionesXTurno] WHERE [idTurno] = @idTurno;";
                conexion.setearParametro("@idTurno", idTurno);
                conexion.conectar();
                conexion.setearConsulta(consulta);
                conexion.ejecutarAccion();
            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }
            finally
            {
                conexion.cerrar();
            }
        }

        public void Eliminar(int idTurno)
        {
            AccesoDatos conexion = new AccesoDatos();

            try
            {
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[turnos] WHERE [id] = @idTurno;";
                conexion.setearParametro("@idTurno", idTurno);
                conexion.conectar();
                conexion.setearConsulta(consulta);
                conexion.ejecutarAccion();
            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }
            finally
            {
                conexion.cerrar();
            }
        }

    }
}

