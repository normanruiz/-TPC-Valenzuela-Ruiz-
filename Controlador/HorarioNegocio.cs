using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class HorarioNegocio
    {
        public List<Horario> listar()
        {
            List<Horario> listaHorarios = new List<Horario>();
            AccesoDatos Conexion = new AccesoDatos();
            Horario horario;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT h.[id], h.[dia], h.[horaInicio], h.[horaFin] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] AS h WITH (NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    horario = new Horario();
                    horario.Id = (Int32)Conexion.Lector["id"];
                    horario.Dia = (string)Conexion.Lector["dia"];
                    horario.HoraInicio = (int)Conexion.Lector["horaInicio"];
                    horario.HoraFin = (int)Conexion.Lector["horaFin"];

                    listaHorarios.Add(horario);
                }

                return listaHorarios;
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

        public List<Horario> listar_con_medico(int idMedico)
        {
            List<Horario> listaHorarios = new List<Horario>();
            AccesoDatos conexion = new AccesoDatos();
            Horario horario;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT h.[id], h.[dia], h.[horaInicio], h.[horaFin] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] AS h WITH (NOLOCK) INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXHorario] AS mxh WITH (NOLOCK) ON h.[id] = mxh.[idHorario] AND mxh.[idMedico] = @idMedico;");
                conexion.setearParametro("@idMedico", idMedico.ToString());
                conexion.ejecutarLectura();

                while (conexion.Lector.Read())
                {
                    horario = new Horario();
                    horario.Id = (Int32)conexion.Lector["id"];
                    horario.Dia = (string)conexion.Lector["dia"];
                    horario.HoraInicio = (int)conexion.Lector["horaInicio"];
                    horario.HoraFin = (int)conexion.Lector["horaFin"];

                    listaHorarios.Add(horario);
                }

                return listaHorarios;
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

        public Horario buscar_con_id(int id)
        {
            AccesoDatos conexion = new AccesoDatos();
            Horario horario;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT h.[id], h.[dia], h.[horaInicio], h.[horaFin] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] AS h WITH (NOLOCK) WHERE h.[id] = @id;");
                conexion.setearParametro("@id", id);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    horario = new Horario();
                    horario.Id = (Int32)conexion.Lector["id"];
                    horario.Dia = (string)conexion.Lector["dia"];
                    horario.HoraInicio = (int)conexion.Lector["horaInicio"];
                    horario.HoraFin = (int)conexion.Lector["horaFin"];
                }
                else
                {
                    horario = null;
                }
                return horario;
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

        public void crear(Horario horario)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] ([dia], [horaInicio], [horaFin]) VALUES (@dia, @horaInicio, @horaFin);";
                conexion.setearParametro("@dia", horario.Dia);
                conexion.setearParametro("@horaInicio", horario.HoraInicio);
                conexion.setearParametro("@horaFin", horario.HoraFin);
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

        public void actualizar(Horario horario)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] SET [dia] = @dia, [horaInicio] = @horaInicio, [horaFin] = @horaFin WHERE [id] = @id;";
                conexion.setearParametro("@id", horario.Id);
                conexion.setearParametro("@dia", horario.Dia);
                conexion.setearParametro("@horaInicio", horario.HoraInicio);
                conexion.setearParametro("@horaFin", horario.HoraFin);
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

        public void Eliminar(int id)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] WHERE [id] = @id;";
                conexion.setearConsulta(consulta);
                conexion.setearParametro("@id", id);
                conexion.conectar();
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
