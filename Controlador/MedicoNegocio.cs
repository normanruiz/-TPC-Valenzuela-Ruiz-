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
                Conexion.setearConsulta("SELECT e.[id], e.[nombre] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH(NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    medico = new Medico();
                    medico.Id = (Int32)Conexion.Lector["id"];
                    medico.especialidad = new Especialidad();
                    medico.especialidad.Id = (Int32)Conexion.Lector["idEspecialidad"];
                    medico.especialidad.Nombre = (string)Conexion.Lector["especialidad"];

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
