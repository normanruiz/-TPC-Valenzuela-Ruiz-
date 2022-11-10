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
    }
}
