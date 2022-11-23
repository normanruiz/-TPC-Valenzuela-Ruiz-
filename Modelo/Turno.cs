using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Turno
    {
        public int Id { get; set; }
        public String Numero { get; set; }
        public Paciente paciente { get; set; }
        public Especialidad especialidad { get; set; }
        public Medico medico { get; set; }
        public Horario horario { get; set; }
        public int horaInicio { get; set; }
        public DateTime Fecha { get; set; }
        public Estado estado { get; set; }

    }
}
