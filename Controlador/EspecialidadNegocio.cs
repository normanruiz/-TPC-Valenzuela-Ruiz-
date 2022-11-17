using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class EspecialidadNegocio
    {
        public List<Especialidad> listar()
        {
            List<Especialidad> listaEspecialidades = new List<Especialidad>();
            AccesoDatos Conexion = new AccesoDatos();
            Especialidad especialidad;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT e.[id], e.[nombre] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH(NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    especialidad = new Especialidad();
                    especialidad.Id = (Int32)Conexion.Lector["id"];
                    especialidad.Nombre = (string)Conexion.Lector["nombre"];

                    listaEspecialidades.Add(especialidad);
                }

                return listaEspecialidades;
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

        public List<Especialidad> listar_con_medico(int idMedico)
        {
            List<Especialidad> listaEspecialidades = new List<Especialidad>();
            AccesoDatos conexion = new AccesoDatos();
            Especialidad especialidad;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT e.[id], e.[nombre] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK) INNER JOIN [TPC-Clinica-Valenzuela-Ruiz].[dbo].[MedicoXEspecialidad] AS mxe WITH (NOLOCK) ON e.[id] = mxe.[idEspecialidad] WHERE mxe.[idMedico] = @idMedico;");
                conexion.setearParametro("@idMedico", idMedico.ToString());
                conexion.ejecutarLectura();

                while (conexion.Lector.Read())
                {
                    especialidad = new Especialidad();
                    especialidad.Id = (Int32)conexion.Lector["id"];
                    especialidad.Nombre = (string)conexion.Lector["nombre"];

                    listaEspecialidades.Add(especialidad);
                }

                return listaEspecialidades;
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

        public Especialidad buscar_con_id(int id)
        {
            AccesoDatos conexion = new AccesoDatos();
            Especialidad especialidad;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT e.[id], e.[nombre] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK) WHERE e.[id] = @id;");
                conexion.setearParametro("@id", id);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    especialidad = new Especialidad();
                    especialidad.Id = (Int32)conexion.Lector["id"];
                    especialidad.Nombre = (string)conexion.Lector["nombre"];
                }
                else
                {
                    especialidad = null;
                }
                return especialidad;
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

        public Especialidad buscar_con_nombre(string nombre)
        {
            AccesoDatos conexion = new AccesoDatos();
            Especialidad especialidad;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT e.[id], e.[nombre] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK) WHERE e.[nombre] = @nombre;");
                conexion.setearParametro("@nombre", nombre);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    especialidad = new Especialidad();
                    especialidad.Id = (Int32)conexion.Lector["id"];
                    especialidad.Nombre = (string)conexion.Lector["nombre"];
                }
                else
                {
                    especialidad = null;
                }
                return especialidad;
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

        public void crear(Especialidad especialidad)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] ([nombre]) VALUES(@nombre);";
                conexion.setearParametro("@nombre", especialidad.Nombre);
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

        public void actualizar(Especialidad especialidad)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] SET [nombre] = @nombre WHERE [id] = @id;";
                conexion.setearParametro("@id", especialidad.Id);
                conexion.setearParametro("@nombre", especialidad.Nombre);
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
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] WHERE [id] = @id;";
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
