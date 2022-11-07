using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class PersonaNegocio
    {
        public List<Persona> listar()
        {
            List<Persona> listaPersonas = new List<Persona>();
            AccesoDatos Conexion = new AccesoDatos();
            Persona persona;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT p.[id], p.[dni], p.[nombre], p.[apellido], p.[email], p.[idUsuario] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] AS p WITH (NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    persona = new Persona();
                    persona.IdPersona = (Int32)Conexion.Lector["id"];
                    persona.DNI = (string)Conexion.Lector["dni"];
                    persona.Nombre = (string)Conexion.Lector["nombre"];
                    persona.Apellido = (string)Conexion.Lector["apellido"];
                    persona.Email = (string)Conexion.Lector["email"];
                    if (!(Conexion.Lector["idUsuario"] is DBNull))
                    {
                        UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                        persona.usuario = new Usuario();
                        persona.usuario = usuarioNegocio.buscar_con_id((Int32)Conexion.Lector["idUsuario"]);
                    }

                    listaPersonas.Add(persona);
                }

                return listaPersonas;
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

        public Persona buscar_con_id(int id)
        {
            AccesoDatos conexion = new AccesoDatos();
            Persona persona;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT p.[id], p.[dni], p.[nombre], p.[apellido], p.[email], p.[idUsuario] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] AS p WITH (NOLOCK) WHERE p.[id] = @id;");
                conexion.setearParametro("@id", id);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    persona = new Persona();
                    persona.IdPersona = (Int32)conexion.Lector["id"];
                    persona.DNI = (string)conexion.Lector["dni"];
                    persona.Nombre = (string)conexion.Lector["nombre"];
                    persona.Apellido = (string)conexion.Lector["apellido"];
                    persona.Email = (string)conexion.Lector["email"];
                    if (!(conexion.Lector["idUsuario"] is DBNull))
                    {
                        UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                        persona.usuario = new Usuario();
                        persona.usuario = usuarioNegocio.buscar_con_id((Int32)conexion.Lector["idUsuario"]);
                    }
                }
                else
                {
                    persona = null;
                }
                return persona;
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

        public void crear(Persona persona)
        {
            UsuarioNegocio usuarioNegocio;
            Usuario usuario = new Usuario();
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] ([dni], [nombre], [apellido], [email], [idUsuario]) VALUES (@dni, @nombre, @apellido, @email, @idUsuario);";
                conexion.setearParametro("@dni", persona.DNI);
                conexion.setearParametro("@nombre", persona.Nombre);
                conexion.setearParametro("@apellido", persona.Apellido);
                conexion.setearParametro("@email", persona.Email);
                if (!(persona.usuario is null))
                {
                    usuarioNegocio = new UsuarioNegocio();
                    usuarioNegocio.crear(persona.usuario);
                    usuario = usuarioNegocio.buscar_con_nombre(persona.usuario.Nombre);
                    conexion.setearParametro("@idUsuario", usuario.Id);
                }
                else
                {
                    conexion.setearParametro("@idUsuario", DBNull.Value);
                }

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

        public void actualizar(Persona persona)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] SET [dni] = @dni, [nombre] = @nombre, [apellido] = @apellido, [email] = @email, [idUsuario] = @idUsuario WHERE [id] = @id;";
                conexion.setearParametro("@id", persona.IdPersona);
                conexion.setearParametro("@dni", persona.DNI);
                conexion.setearParametro("@nombre", persona.Nombre);
                conexion.setearParametro("@apellido", persona.Apellido);
                conexion.setearParametro("@email", persona.Email);
                conexion.setearParametro("@idUsuario", persona.usuario.Id);
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
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] WHERE [id] = @id;";
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
