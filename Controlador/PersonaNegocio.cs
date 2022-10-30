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
                Conexion.setearConsulta("SELECT p.[id], p.[nombre], p.[apellido], p.[email], p.[idUsuario] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[personas] AS p WITH(NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    persona = new Persona();
                    persona.IdPersona = (Int32)Conexion.Lector["id"];
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
                conexion.setearConsulta("SELECT u.[id], u.[nombre], u.[contrasenia], u.[perfil] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[usuarios] AS u WITH(NOLOCK) WHERE u.[id] = @id;");
                conexion.setearParametro("@id", id);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    persona = new Persona();
                    persona.IdPersona = (Int32)conexion.Lector["id"];
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
    }
}
