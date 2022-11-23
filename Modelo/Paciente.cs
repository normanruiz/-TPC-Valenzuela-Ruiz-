using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Paciente : Persona
    {
        public int IdPaciente { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }

        public string denominacion
        {
            get
            {
                return Apellido + " " + Nombre;
            }
        }
    }
}
