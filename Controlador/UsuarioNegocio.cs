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

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT u.[id], u.[nombre], u.[contrasenia], u.[perfil] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH(NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    usuario = new Usuario();
                    usuario.Id = (Int32)Conexion.Lector["id"];
                    usuario.Nombre = (string)Conexion.Lector["nombre"];
                    usuario.Contrasenia = (string)Conexion.Lector["contrasenia"];
                    usuario.Perfil = (string)Conexion.Lector["perfil"];

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
    }
}
