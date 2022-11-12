using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class MedicoNegocio
    {
        public List<Medico> listar()
        {
            List<Medico> listaMedicos = new List<Medico>();
            AccesoDatos Conexion = new AccesoDatos();
            Medico medico;
            Persona persona;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT m.[id], m.[idPersona] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] AS m WITH (NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    medico = new Medico();
                    medico.IdMedico = (Int32)Conexion.Lector["id"];
                    medico.IdPersona = (Int32)Conexion.Lector["idPersona"];

                    PersonaNegocio personaNegocio = new PersonaNegocio();
                    persona = new Persona();
                    persona = personaNegocio.buscar_con_id((Int32)Conexion.Lector["idPersona"]);

                    medico.DNI = persona.DNI;
                    medico.Nombre = persona.Nombre;
                    medico.Apellido = persona.Apellido;
                    medico.Email = persona.Email;
                    medico.usuario = persona.usuario;

                    listaMedicos.Add(medico);
                }

                return listaMedicos;
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

        //public Horario buscar_con_id(int id)
        //{
        //    AccesoDatos conexion = new AccesoDatos();
        //    Horario horario;

        //    try
        //    {
        //        conexion.conectar();
        //        conexion.setearConsulta("");
        //        conexion.setearParametro("@id", id);
        //        conexion.ejecutarLectura();

        //        if (conexion.Lector.Read())
        //        {
        //            horario = new Horario();
        //            horario.Id = (Int32)conexion.Lector["id"];
        //            horario.Dia = (string)conexion.Lector["dia"];
        //            horario.HoraInicio = (int)conexion.Lector["horaInicio"];
        //            horario.HoraFin = (int)conexion.Lector["horaFin"];
        //        }
        //        else
        //        {
        //            horario = null;
        //        }
        //        return horario;
        //    }
        //    catch (Exception excepcion)
        //    {
        //        throw excepcion;
        //    }
        //    finally
        //    {
        //        conexion.cerrar();
        //    }
        //}

        public Medico buscar_con_dni(string dni)
        {
            AccesoDatos conexion = new AccesoDatos();
            Medico medico;
            Persona persona;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT m.[id], m.[idPersona] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] AS m WITH (NOLOCK) INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[PERSONAS] AS P WITH (NOLOCK) ON m.[idPersona] = p.[id] WHERE p.[dni] = @dni;");
                conexion.setearParametro("@dni", dni);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    medico = new Medico();
                    medico.IdMedico = (Int32)conexion.Lector["id"];
                    medico.IdPersona = (Int32)conexion.Lector["idPersona"];

                    PersonaNegocio personaNegocio = new PersonaNegocio();
                    persona = new Persona();
                    persona = personaNegocio.buscar_con_id((Int32)conexion.Lector["idPersona"]);

                    medico.DNI = persona.DNI;
                    medico.Nombre = persona.Nombre;
                    medico.Apellido = persona.Apellido;
                    medico.Email = persona.Email;
                    medico.usuario = persona.usuario;
                }
                else
                {
                    medico = null;
                }
                return medico;
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

        public void crear(Medico medico)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] ([idPersona]) VALUES (@idPersona);";
                conexion.setearParametro("@idPersona", medico.IdPersona);
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

        //public void actualizar(Horario horario)
        //{
        //    AccesoDatos conexion = new AccesoDatos();
        //    try
        //    {
        //        string consulta = "";
        //        conexion.setearParametro("@id", horario.Id);
        //        conexion.setearParametro("@dia", horario.Dia);
        //        conexion.setearParametro("@horaInicio", horario.HoraInicio);
        //        conexion.setearParametro("@horaFin", horario.HoraFin);
        //        conexion.conectar();
        //        conexion.setearConsulta(consulta);
        //        conexion.ejecutarAccion();
        //    }
        //    catch (Exception excepcion)
        //    {
        //        throw excepcion;
        //    }
        //    finally
        //    {
        //        conexion.cerrar();
        //    }
        //}

        public void Eliminar(int id)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] WHERE [id] = @id;";
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

        public void establecer_especialidades(Medico medico, List<Especialidad> listaNueva )
        {
            EspecialidadNegocio especialidadNegocio;
            List<Especialidad> listaOriginal;
            List<Especialidad> listaAux;

            try
            {
               
                // traer la lista de la base
                especialidadNegocio = new EspecialidadNegocio();
                listaOriginal = new List<Especialidad>();
                listaOriginal = especialidadNegocio.listar_con_medico(medico.IdMedico);

                //eliminar las que sobran
                listaAux = new List<Especialidad>();
                foreach (Especialidad especialidad in listaOriginal)
                {
                    listaAux.Add(especialidad);
                }

                foreach (Especialidad especialidad in listaAux)
                {
                    if(!(listaNueva.Contains(especialidad)))
                    {
                        quitar_especialidad(medico, especialidad);
                        listaOriginal.Remove(especialidad);
                    }
                }
                //agregar las que faltan
                foreach (Especialidad especialidad in listaNueva)
                {
                    if (!(listaOriginal.Contains(especialidad)))
                    {
                        agregar_especialidad(medico, especialidad);
                    }
                }

            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }

        }

        private void quitar_especialidad(Medico medico, Especialidad especialidad)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXEspecialidad] WHERE [idMedico] = @idMedico AND [idEspecialidad] = @idEspecialidad;";
                conexion.setearConsulta(consulta);
                conexion.setearParametro("@idMedico", medico.IdMedico);
                conexion.setearParametro("@idEspecialidad", especialidad.Id);
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

        private void agregar_especialidad(Medico medico, Especialidad especialidad)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXEspecialidad] ([idMedico], [idEspecialidad]) VALUES (@idMedico, @idEspecialidad);";
                conexion.setearConsulta(consulta);
                conexion.setearParametro("@idMedico", medico.IdMedico);
                conexion.setearParametro("@idEspecialidad", especialidad.Id);
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

        public void establecer_horarios(Medico medico, List<Horario> listaNueva)
        {
            HorarioNegocio horarioNegocio;
            List<Horario> listaOriginal;
            List<Horario> listaAux;

            try
            {

                // traer la lista de la base
                horarioNegocio = new HorarioNegocio();
                listaOriginal = new List<Horario>();
                listaOriginal = horarioNegocio.listar_con_medico(medico.IdMedico);

                //eliminar las que sobran
                listaAux = new List<Horario>();
                foreach (Horario horario in listaOriginal)
                {
                    listaAux.Add(horario);
                }

                foreach (Horario horario in listaAux)
                {
                    if (!(listaNueva.Contains(horario)))
                    {
                        quitar_horario(medico, horario);
                        listaOriginal.Remove(horario);
                    }
                }
                //agregar las que faltan
                foreach (Horario horario in listaNueva)
                {
                    if (!(listaOriginal.Contains(horario)))
                    {
                        agregar_horario(medico, horario);
                    }
                }

            }
            catch (Exception excepcion)
            {
                throw excepcion;
            }
        }

        private void quitar_horario(Medico medico, Horario horario)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXHorario] WHERE [idMedico] = @idMedico AND [idHorario] = @idHorario;";
                conexion.setearConsulta(consulta);
                conexion.setearParametro("@idMedico", medico.IdMedico);
                conexion.setearParametro("@idHorario", horario.Id);
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

        private void agregar_horario(Medico medico, Horario horario)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXHorario] ([idMedico], [idHorario]) VALUES (@idMedico, @idHorario);";
                conexion.setearConsulta(consulta);
                conexion.setearParametro("@idMedico", medico.IdMedico);
                conexion.setearParametro("@idHorario", horario.Id);
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
