﻿using System;
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
    }
}