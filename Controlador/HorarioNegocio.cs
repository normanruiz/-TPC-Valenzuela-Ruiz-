using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
    public class HorarioNegocio
    {
        public List<Horario> listar()
        {
            List<Horario> listaHorarios = new List<Horario>();
            AccesoDatos Conexion = new AccesoDatos();
            Horario horario;

            try
            {
                Conexion.conectar();
                Conexion.setearConsulta("SELECT h.[id], h.[dia], h.[horaInicio], h.[horaFin] FROM [TPC-Clinica-Valenzuela-Ruiz].[dbo].[horarios] AS h WITH (NOLOCK);");
                Conexion.ejecutarLectura();

                while (Conexion.Lector.Read())
                {
                    horario = new Horario();
                    horario.Id = (Int32)Conexion.Lector["id"];
                    horario.Dia = (string)Conexion.Lector["dia"];
                    horario.HoraInicio = (int)Conexion.Lector["horaInicio"];
                    horario.HoraFin = (int)Conexion.Lector["horaFin"];

                    listaHorarios.Add(horario);
                }

                return listaHorarios;
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
