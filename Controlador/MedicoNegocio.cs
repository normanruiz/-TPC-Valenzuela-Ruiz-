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

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT m.[id], m.[idpersona], m.[idEspecialidad] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[medicos] AS m WITH (NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    medico = new Medico();
                    medico.IdMedico = (Int32)Conexion.Lector["id"];
                    if (!(Conexion.Lector["idPersona"] is DBNull))
                    {
                        PersonaNegocio personaNegocio = new PersonaNegocio();
                        Persona persona = new Persona();
                        persona = personaNegocio.buscar_con_id((Int32)Conexion.Lector["idPersona"]);
                        medico.Nombre = persona.Nombre;
                        medico.Apellido = persona.Apellido;
                        medico.Email = persona.Email;
                        medico.usuario = persona.usuario;
                    }
                    if (!(Conexion.Lector["idEspecialidad"] is DBNull))
                    {
                        EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
                        medico.especialidad = new Especialidad();
                        medico.especialidad = especialidadNegocio.buscar_con_id((Int32)Conexion.Lector["idEspecialidad"]);
                    }


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
