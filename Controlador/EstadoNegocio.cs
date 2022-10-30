using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class EstadoNegocio
    {
        public List<Estado> listar()
        {
            List<Estado> listaEstados = new List<Estado>();
            AccesoDatos Conexion = new AccesoDatos();
            Estado estado;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT e.[id], e.[descripcion] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[estados] AS e WITH (NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    estado = new Estado();
                    estado.Id = (Int32)Conexion.Lector["id"];
                    estado.Descripcion = (string)Conexion.Lector["descripcion"];
                    listaEstados.Add(estado);
                }

                return listaEstados;
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

