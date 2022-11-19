using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class UsuarioNegocio
    {
        public List<Usuario> listar()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();
            AccesoDatos Conexion = new AccesoDatos();
            Usuario usuario;
            PerfilNegocio perfilNegocio;
            Perfil perfil;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT u.[id], u.[nombre], u.[contrasenia], u.[idPerfil] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH(NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    usuario = new Usuario();
                    usuario.Id = (Int32)Conexion.Lector["id"];
                    usuario.Nombre = (string)Conexion.Lector["nombre"];
                    usuario.Contrasenia = (string)Conexion.Lector["contrasenia"];
                    perfilNegocio = new PerfilNegocio();
                    perfil = perfilNegocio.buscar_con_id((Int32)Conexion.Lector["idPerfil"]);
                    usuario.perfil = perfil;

                    listaUsuarios.Add(usuario);
                }

                return listaUsuarios;
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

        public Usuario buscar_con_id(int id)
        {
            AccesoDatos conexion = new AccesoDatos();
            Usuario usuario;
            PerfilNegocio perfilNegocio;
            Perfil perfil;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT u.[id], u.[nombre], u.[contrasenia], u.[idPerfil] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH (NOLOCK) WHERE u.[id] = @id;");
                conexion.setearParametro("@id", id);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    usuario = new Usuario();
                    usuario.Id = (Int32)conexion.Lector["id"];
                    usuario.Nombre = (string)conexion.Lector["nombre"];
                    usuario.Contrasenia = (string)conexion.Lector["contrasenia"];
                    perfilNegocio = new PerfilNegocio();
                    perfil = perfilNegocio.buscar_con_id((Int32)conexion.Lector["idPerfil"]);
                    usuario.perfil = perfil;
                }
                else
                {
                    usuario = null;
                }
                return usuario;
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

        public Usuario buscar_con_nombre(string nombre)
        {
            AccesoDatos conexion = new AccesoDatos();
            Usuario usuario;
            PerfilNegocio perfilNegocio;
            Perfil perfil;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT u.[id], u.[nombre], u.[contrasenia], u.[idPerfil] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH (NOLOCK) WHERE u.[nombre] = @nombre;");
                conexion.setearParametro("@nombre", nombre);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    usuario = new Usuario();
                    usuario.Id = (Int32)conexion.Lector["id"];
                    usuario.Nombre = (string)conexion.Lector["nombre"];
                    usuario.Contrasenia = (string)conexion.Lector["contrasenia"];
                    perfilNegocio = new PerfilNegocio();
                    perfil = perfilNegocio.buscar_con_id((Int32)conexion.Lector["idPerfil"]);
                    usuario.perfil = perfil;
                }
                else
                {
                    usuario = null;
                }
                return usuario;
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

        public Usuario validar(string nombre, string contraseña)
        {
            AccesoDatos conexion = new AccesoDatos();
            Usuario usuario;
            PerfilNegocio perfilNegocio;
            Perfil perfil;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT u.[id], u.[nombre], u.[contrasenia], u.[idPerfil] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH (NOLOCK) WHERE u.[nombre] = @nombre AND u.[contrasenia] = @contrasenia;");
                conexion.setearParametro("@nombre", nombre);
                conexion.setearParametro("@contrasenia", contraseña);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    usuario = new Usuario();
                    usuario.Id = (Int32)conexion.Lector["id"];
                    usuario.Nombre = (string)conexion.Lector["nombre"];
                    usuario.Contrasenia = (string)conexion.Lector["contrasenia"];
                    perfilNegocio = new PerfilNegocio();
                    perfil = perfilNegocio.buscar_con_id((Int32)conexion.Lector["idPerfil"]);
                    usuario.perfil = perfil;
                }
                else
                {
                    usuario = null;
                }
                return usuario;
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

        public void crear(Usuario usuario)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] ([nombre], [contrasenia], [IdPerfil]) VALUES (@usuario, @contraseña, @perfil); ";
                conexion.setearParametro("@usuario", usuario.Nombre);
                conexion.setearParametro("@contraseña", usuario.Contrasenia);
                conexion.setearParametro("@perfil", usuario.perfil.Id);
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

        public void actualizar(Usuario usuario)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] SET [nombre] = @usuario, [contrasenia] = @contraseña, [idPerfil] = @idPerfil WHERE [id] = @id;";
                conexion.setearParametro("@id", usuario.Id);
                conexion.setearParametro("@usuario", usuario.Nombre);
                conexion.setearParametro("@contraseña", usuario.Contrasenia);
                conexion.setearParametro("@idPerfil", usuario.perfil.Id);
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
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] WHERE [id] = @id;";
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
