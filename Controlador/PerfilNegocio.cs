using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class PerfilNegocio
    {
        public List<Perfil> listar()
        {
            List<Perfil> listaPerfiles = new List<Perfil>();
            AccesoDatos Conexion = new AccesoDatos();
            Perfil perfil;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT p.[id], p.[tipo] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[perfiles] AS p WITH (NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    perfil = new Perfil();
                    perfil.Id = (Int32)Conexion.Lector["id"];
                    perfil.Tipo = (string)Conexion.Lector["tipo"];

                    listaPerfiles.Add(perfil);
                }

                return listaPerfiles;
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

        public Perfil buscar_con_id(int id)
        {
            AccesoDatos conexion = new AccesoDatos();
            Perfil perfil;

            try
            {
                conexion.conectar();
                conexion.setearConsulta("SELECT p.[id], p.[tipo] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[perfiles] AS p WITH (NOLOCK) WHERE p.[id] = @id;");
                conexion.setearParametro("@id", id);
                conexion.ejecutarLectura();

                if (conexion.Lector.Read())
                {
                    perfil = new Perfil();
                    perfil.Id = (Int32)conexion.Lector["id"];
                    perfil.Tipo = (string)conexion.Lector["tipo"];
                }
                else
                {
                    perfil = null;
                }
                return perfil;
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
