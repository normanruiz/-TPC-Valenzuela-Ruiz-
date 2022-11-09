using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class PacienteNegocio
    {
        public List<Paciente> listar()
        {
            List<Paciente> listaPacientes = new List<Paciente>();
            AccesoDatos Conexion = new AccesoDatos();
            Paciente paciente;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT p.[id], p.[idPersona], p.[fechaNacimiento], p.[direccion], p.[telefono] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] AS p WITH(NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    paciente = new Paciente();
                    paciente.IdPaciente = (Int32)Conexion.Lector["id"];

                    PersonaNegocio personaNegocio = new PersonaNegocio();
                    Persona persona = new Persona();
                    persona = personaNegocio.buscar_con_id((Int32)Conexion.Lector["idPersona"]);
                    paciente.IdPersona = persona.IdPersona;
                    paciente.DNI = persona.DNI;
                    paciente.Nombre = persona.Nombre;
                    paciente.Apellido = persona.Apellido;
                    paciente.Email = persona.Email;
                    paciente.usuario = persona.usuario;

                    paciente.FechaNacimiento = (DateTime)Conexion.Lector["fechaNacimiento"];
                    paciente.Direccion = (string)Conexion.Lector["direccion"];
                    paciente.Telefono = (string)Conexion.Lector["telefono"];

                    listaPacientes.Add(paciente);
                }

                return listaPacientes;
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

        public Paciente buscar_con_id(int id)
        {
            AccesoDatos conexion = new AccesoDatos();
            Paciente paciente;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT p.[id], p.[idPersona], p.[fechaNacimiento], p.[direccion], p.[telefono] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] AS p WITH (NOLOCK) WHERE p.[id] = @id;");
                conexion.setearParametro("@id", id);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    paciente = new Paciente();
                    paciente.IdPaciente = (Int32)conexion.Lector["id"];

                    PersonaNegocio personaNegocio = new PersonaNegocio();
                    Persona persona = new Persona();
                    persona = personaNegocio.buscar_con_id((Int32)conexion.Lector["idPersona"]);
                    paciente.IdPersona = persona.IdPersona;
                    paciente.DNI = persona.DNI;
                    paciente.Nombre = persona.Nombre;
                    paciente.Apellido = persona.Apellido;
                    paciente.Email = persona.Email;
                    paciente.usuario = persona.usuario;

                    paciente.FechaNacimiento = (DateTime)conexion.Lector["fechaNacimiento"];
                    paciente.Direccion = (string)conexion.Lector["direccion"];
                    paciente.Telefono = (string)conexion.Lector["telefono"];
                }
                else
                {
                    paciente = null;
                }
                return paciente;
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

        public void crear(Paciente paciente)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] ([idPersona], [fechaNacimiento], [direccion], [telefono]) VALUES (@idPersona, @fechaNacimiento, @direccion, @telefono);";
                conexion.setearParametro("@idPersona", paciente.IdPersona);
                conexion.setearParametro("@fechaNacimiento", paciente.FechaNacimiento);
                conexion.setearParametro("@direccion", paciente.Direccion);
                conexion.setearParametro("@telefono", paciente.Telefono);
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

        public void actualizar(Paciente paciente)
        {
            AccesoDatos conexion = new AccesoDatos();
            try
            {
                string consulta = "UPDATE [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] SET [idPersona] = @idPersona, [fechaNacimiento] = @fechaNacimiento, [direccion] = @direccion, [telefono] = @telefono WHERE [id] = @id;";
                conexion.setearParametro("@id", paciente.IdPaciente);
                conexion.setearParametro("@idPersona", paciente.IdPersona);
                conexion.setearParametro("@fechaNacimiento", paciente.FechaNacimiento);
                conexion.setearParametro("@direccion", paciente.Direccion);
                conexion.setearParametro("@telefono", paciente.Telefono);
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
                string consulta = "DELETE FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[pacientes] WHERE [id] = @id; ";
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
