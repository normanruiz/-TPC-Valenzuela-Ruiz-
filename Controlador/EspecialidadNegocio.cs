using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class EspecialidadNegocio
    {
        public List<Especialidad> listar()
        {
            List<Especialidad> listaEspecialidades = new List<Especialidad>();
            AccesoDatos Conexion = new AccesoDatos();
            Especialidad especialidad;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT e.[id], e.[nombre] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH(NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    especialidad = new Especialidad();
                    especialidad.Id = (Int32)Conexion.Lector["id"];
                    especialidad.Nombre = (string)Conexion.Lector["nombre"];

                    listaEspecialidades.Add(especialidad);
                }

                return listaEspecialidades;
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

        public Especialidad buscar_con_id(int id)
        {
            AccesoDatos conexion = new AccesoDatos();
            Especialidad especialidad;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT e.[id], e.[nombre] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[especialidades] AS e WITH (NOLOCK) WHERE e.[id] = @id;");
                conexion.setearParametro("@id", id);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    especialidad = new Especialidad();
                    especialidad.Id = (Int32)conexion.Lector["id"];
                    especialidad.Nombre = (string)conexion.Lector["nombre"];
                }
                else
                {
                    especialidad = null;
                }
                return especialidad;
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
