using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Turno
    {
        public int Numero { get; set; }
        public Paciente paciente { get; set; }
        public Especialidad especialidad { get; set; }
        public Horario horario { get; set; }
        public Medico medico { get; set; }
        public String Observaciones { get; set; }
        public Estado estado { get; set; }

    }
}
