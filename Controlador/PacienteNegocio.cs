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
    }
}
