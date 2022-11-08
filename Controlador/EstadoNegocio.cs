using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class EstadoNegocio
    {
        public List<Estado> listar()
        {
            List<Estado> listaEstados = new List<Estado>();
            AccesoDatos Conexion = new AccesoDatos();
            Estado estado;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT e.[id], e.[descripcion] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] AS e WITH (NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    estado = new Estado();
                    estado.Id = (Int32)Conexion.Lector["id"];
                    estado.Descripcion = (string)Conexion.Lector["descripcion"];
                    listaEstados.Add(estado);
                }

                return listaEstados;
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

        public Estado buscar_con_id(int id)
        {
            AccesoDatos conexion = new AccesoDatos();
            Estado estado;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT e.[id], e.[descripcion] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] AS e WITH (NOLOCK) WHERE e.[id] = @id;");
                conexion.setearParametro("@id", id);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    estado = new Estado();
                    estado.Id = (Int32)conexion.Lector["id"];
                    estado.Descripcion = (string)conexion.Lector["descripcion"];
                }
                else
                {
                    estado = null;
                }
                return estado;
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

        public void crear(Estado estado)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] ([descripcion]) VALUES (@descripcion);";
                conexion.setearParametro("@descripcion", estado.Descripcion);
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

        public void actualizar(Estado estado)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] SET [descripcion] = @descripcion WHERE [id] = @id;";
                conexion.setearParametro("@id", estado.Id);
                conexion.setearParametro("@descripcion", estado.Descripcion);
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
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] WHERE [id] = @id;";
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

