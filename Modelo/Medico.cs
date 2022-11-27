using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Medico : Persona
    {
        public int IdMedico { get; set; }
        public List<Especialidad> Especialidades { get; set; }
        public List<Horario> Horarios { get; set; }

        public string denominacion
        {
            get
            {
                if (Apellido == "Seleccionar...")
                {
                    return Apellido;
                }
                else
                {
                    return Apellido + " " + Nombre;
                }
            }
        }

    }
}
