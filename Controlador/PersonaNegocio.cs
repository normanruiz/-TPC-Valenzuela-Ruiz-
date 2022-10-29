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
                Conexion.setearConsulta("");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    persona = new Persona();
                    persona.Id = (Int32)Conexion.Lector["id"];
                    persona.Nombre = (string)Conexion.Lector["nombre"];
                    persona.Apellido = (string)Conexion.Lector["apellido"];
                    persona.Email = (string)Conexion.Lector["email"];
                    persona.usuario = new Usuario();
                    persona.usuario.Id = (Int32)Conexion.Lector["idUsuario"];
                    persona.usuario.Nombre = (string)Conexion.Lector["usuario"];
                    persona.usuario.Contrasenia = (string)Conexion.Lector["contrasenia"];
                    persona.usuario.Perfil = (string)Conexion.Lector["perfil"];

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
    }
}
